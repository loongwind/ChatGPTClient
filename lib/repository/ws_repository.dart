
import 'dart:convert';

import 'package:chatgpt_client/generated/json/base/json_convert_content.dart';
import 'package:chatgpt_client/model/plus_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WSRepository{

  IOWebSocketChannel? channel;
  Function(WSResponseModel)? _listener;


  void open() {
    if(channel != null){
      return;
    }
    final wsUrl = Uri.parse('ws://165.154.36.63:8080/api/conv');
    channel = IOWebSocketChannel.connect(wsUrl, headers: {
      "Cookie":"user_auth=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyIiwiYXVkIjpbImZhc3RhcGktdXNlcnM6YXV0aCJdLCJleHAiOjE2ODA1Mjg1MzV9._-2xxpihp4khC3tB3_VrCzlE7Zx4XRu5i87H2egi32s"
    });
    channel?.stream.listen((event) {
      WSResponseModel model = WSResponseModel.fromJson(json.decode(event.toString()));
      if(model.type == "message"){
        _listener?.call(model);
      }
      print("event:$event");
    }, onError: (e){
      print(e);
      channel = null;
    }, onDone: (){
      print("onDone");
      channel = null;
    });
  }

  void listen(Function(WSResponseModel) listener){
    _listener = listener;
  }
  
  void send(WSRequestModel model){
    open();
    print(model.toString());
    channel?.sink.add(model.toString());
  }


  void close(){
    channel = null;
  }


}