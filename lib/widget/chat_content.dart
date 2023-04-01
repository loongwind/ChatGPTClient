import 'package:chatgpt_client/controller/chat_controller.dart';
import 'package:chatgpt_client/model/chat_model.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
class ChatContent extends StatefulWidget {
  final ChatSession chatSession;
  const ChatContent(this.chatSession, {Key? key}) : super(key: key);

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  TextEditingController textEditingController = TextEditingController();
  material.ScrollController scrollController = material.ScrollController();
  ChatController controller = Get.find();

  @override
  void initState() {
    super.initState();
    print("---------------------------${identityHashCode(controller)}");
    scrollController.addListener(() {
      controller.scrollOffset = scrollController.offset;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.jumpTo(controller.scrollOffset);
    });
  }

  void _scrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 10), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(itemBuilder: (context, index){
                ChatMessage chatMsg = widget.chatSession.getMessage(index);
                return chatMsg.isChatGPT ?  buildGPTMessage(chatMsg) : buildMyMessage(chatMsg);
              }, itemCount: widget.chatSession.getMessagesSize(), controller: scrollController,),
            ),
          ),
          buildEdit(),
        ],
      ),
    );
  }
  
  
  Widget buildGPTMessage(ChatMessage message){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network("https://alifei05.cfp.cn/creative/vcg/veer/1600water/veer-140775274.jpg",
                  width: 45,height: 45,fit: BoxFit.cover,),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ChatGPT", style: material.Theme.of(context).textTheme.bodySmall,),
                      const SizedBox(height: 10,),
                      Obx(() => SelectableText(message.getMessage(), style: material.Theme.of(context).textTheme.bodyMedium)),
                      const SizedBox(height: 10,),
                      Text("model: gpt-3.5-turbo, word count: 417, token estimate: 1036", style: material.Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
  Widget buildMyMessage(ChatMessage message){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(right: 10, left: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("My", style: material.Theme.of(context).textTheme.bodySmall,),
                      const SizedBox(height: 10,),
                      SelectableText(message.getMessage(), style: material.Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              ClipOval(
                child: Image.network("https://alifei05.cfp.cn/creative/vcg/veer/1600water/veer-140775274.jpg",
                  width: 45,height: 45,fit: BoxFit.cover,),
              ),
            ],
          ),


        ],
      ),
    );
  }

  Widget buildEdit() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          Expanded(
              child: TextBox(
                controller: textEditingController,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            style: material.Theme.of(context).textTheme.bodyLarge,
          )),
          const SizedBox(width: 15,),
          FilledButton(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('发送'),
            ),
            onPressed: (){
              String text = textEditingController.text;
              textEditingController.text = "";
              controller.chat(widget.chatSession, text, callback: (){
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  _scrollToBottom();
                });
              });
            },
          )
        ],
      ),
    );
  }
}
