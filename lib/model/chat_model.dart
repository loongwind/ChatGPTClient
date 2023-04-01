import 'dart:ffi';

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

  void init(){
    messagesObs.addAll(messages);
  }


  void setName(String name){
    this.name = name;
    nameObs.value = name;
  }

  String getName(){
    return nameObs.value.isEmpty ?  name : nameObs.value;
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