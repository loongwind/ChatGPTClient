import 'dart:ffi';

import 'package:chatgpt_client/app.dart';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';


@Entity()
class ChatSession{

  @Id()
  int id = 0;
  String name = "";
  final messages = ToMany<ChatMessage>();

  
  @Transient()
  final nameObs = "".obs;
  @Entity()
  final messagesObs = <ChatMessage>[].obs;

  String? sessionId;

  void init(){
    messagesObs.addAll(messages);
  }


  void setName(String name){
    String convertName = "$sessionPrefix-$name";
    this.name = convertName;
    nameObs.value = convertName;
  }

  String getName(){
    String result = nameObs.value.isEmpty ?  name : nameObs.value;
    if(result.startsWith(sessionPrefix)){
      result = result.substring(sessionPrefix.length+1, result.length);
    }
    return result;
  }

  void addMessage(ChatMessage message){
    messages.add(message);
    messagesObs.add(message);
  }

  ChatMessage getMessage(int index){
    return messagesObs.length > index ? messagesObs[index] : messages[index];
  }

   int getMessagesSize(){
    return messages.length > messagesObs.length ? messages.length : messagesObs.length;
  }

  void cleanMessage(){
    messages.clear();
    messagesObs.clear();
  }
}

@Entity()
class ChatMessage{
  @Id()
  int id = 0;
  bool isChatGPT = false;

  String message = "";
  int token = 0;
  String model = "";
  String? messageId;

  @Transient()
  final _messageObs = "".obs;


  void setMessage(String message){
    this.message = message;
    _messageObs.value = message;
  }

  String getMessage(){
    return _messageObs.value.isEmpty ? message : _messageObs.value;
  }

}