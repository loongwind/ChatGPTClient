import 'package:get/get.dart';


class ChatSession{
  final String name ;
  final messages = <ChatMessage>[].obs;
  ChatSession(this.name);
}

class ChatMessage{
  bool isChatGPT = false;
  final message = "".obs;
}