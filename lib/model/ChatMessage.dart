import 'package:get/get.dart';


class ChatSession{
  final name = "".obs;
  final messages = <ChatMessage>[].obs;
  ChatSession(String name){
    this.name.value = name;
  }
}

class ChatMessage{
  bool isChatGPT = false;
  final message = "".obs;
}