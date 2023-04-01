

import 'package:chatgpt_client/model/chat_model.dart';
import 'package:chatgpt_client/model/setting.dart';
import 'package:chatgpt_client/repository/data_repository.dart';
import 'package:get/get.dart';
import 'package:dart_openai/openai.dart';

class ChatController extends GetxController{
  DataRepository repository = Get.find();
  final sessions = <ChatSession>[].obs;
  double scrollOffset = 0;


  @override
  void onInit() {
    super.onInit();
    List<ChatSession> list = repository.getAllChatSession();
    for (var element in list) {
      element.init();
    }
    sessions.addAll(list);
  }


  void addSession(ChatSession session){
    sessions.add(session);
    repository.saveChatSession(session);
  }
  void updateSession(ChatSession session){
    repository.saveChatSession(session);
  }

  void chat(ChatSession chatSession, String msg, {Function()? callback}) {
    Setting setting = repository.getSetting();
    ChatMessage sendMsg = ChatMessage();
    sendMsg.setMessage(msg);
    chatSession.addMessage(sendMsg);

    List<OpenAIChatCompletionChoiceMessageModel> modes = createChatModels(chatSession);

    ChatMessage chatMessage = ChatMessage();
    chatMessage.isChatGPT = true;
    chatSession.addMessage(chatMessage);
    repository.saveChatSession(chatSession);
    Stream<OpenAIStreamChatCompletionModel> chatStream = OpenAI.instance.chat.createStream(
      model: setting.model,
      maxTokens: setting.maxResponseTokens,
      messages: modes,
    );
    chatStream.listen((chatStreamEvent) async{
      chatMessage.setMessage(chatMessage.getMessage() + (chatStreamEvent.choices.first.delta.content ?? ""));
      repository.updateChatMessage(chatMessage);
      callback?.call();
    });
    callback?.call();
  }

  List<OpenAIChatCompletionChoiceMessageModel> createChatModels(ChatSession session){
    return session.messages.map((element){
      OpenAIChatCompletionChoiceMessageModel model;
      if(element.isChatGPT){
        model = OpenAIChatCompletionChoiceMessageModel(
          content: element.message,
          role: OpenAIChatMessageRole.assistant,
        );
      }else{
        model = OpenAIChatCompletionChoiceMessageModel(
          content: element.message,
          role: OpenAIChatMessageRole.user,
        );
      }
      return model;
    }).toList();
  }

  void deleteChatSession(ChatSession chatSession){
    sessions.remove(chatSession);
    repository.deleteChatSession(chatSession);
  }

  void cleanChatMessage(ChatSession chatSession){
    chatSession.cleanMessage();
    repository.saveChatSession(chatSession);
  }

}