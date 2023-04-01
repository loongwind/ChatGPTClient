

import 'package:chatgpt_client/model/ChatMessage.dart';
import 'package:get/get.dart';
import 'package:dart_openai/openai.dart';

class ChatController extends GetxController{
  final sessions = <ChatSession>[].obs;


  @override
  void onInit() {
    super.onInit();

  }

  ChatSession createSession(){
    ChatSession chatSession = ChatSession("test");
    sessions.add(chatSession);
    return chatSession;
  }
  void addSession(ChatSession session){
    sessions.add(session);
  }

  void chat(ChatSession chatSession, String msg) {
    ChatMessage sendMsg = ChatMessage();
    sendMsg.message.value = msg;
    chatSession.messages.add(sendMsg);

    ChatMessage chatMessage = ChatMessage();
    chatMessage.isChatGPT = true;
    chatSession.messages.add(chatMessage);
    Stream<OpenAIStreamChatCompletionModel> chatStream = OpenAI.instance.chat.createStream(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: msg,
          role: OpenAIChatMessageRole.user,
        )
      ],
    );
    chatStream.listen((chatStreamEvent) async{
      print(chatStreamEvent); // ...
      chatMessage.message.value = chatMessage.message.value + (chatStreamEvent.choices.first.delta.content ?? "");
    });
  }

  void _init(){

  }

}