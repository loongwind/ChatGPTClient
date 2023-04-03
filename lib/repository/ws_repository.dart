
import 'dart:convert';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:chatgpt_client/generated/json/base/json_convert_content.dart';
import 'package:chatgpt_client/http/apis.dart';
import 'package:chatgpt_client/http/request.dart';
import 'package:chatgpt_client/http/request_client.dart';
import 'package:chatgpt_client/model/plus_model.dart';
import 'package:chatgpt_client/model/setting.dart';
import 'package:chatgpt_client/repository/data_repository.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WSRepository{

  DataRepository repository = Get.find();

  IOWebSocketChannel? channel;
  Function(WSResponseModel)? _listener;


  Future login() async{
    Setting setting = repository.getSetting();
    if(setting.isOpenAPI || setting.plusHost.isEmpty || setting.plusPort.isEmpty || setting.plusUsername.isEmpty || setting.plusPassword.isEmpty){
      return;
    }
      await requestClient.post<String>("http://${setting.plusHost}:${setting.plusPort}${APIS.login}", data: {
        "username":setting.plusUsername,
        "password":setting.plusPassword
      }, headers: {"Content-Type":"application/x-www-form-urlencoded"});
      final wsUrl = Uri.parse('ws://${setting.plusHost}:${setting.plusPort}/api/conv');
      List<Cookie> cookies = await APIS.cookieJar.loadForRequest(wsUrl);
      APIS.serializableCookies = cookies.map((e) => SerializableCookie(e)).toList();
      return;
  }


  Future _open() async {
    if(channel != null){
      return;
    }
    Setting setting = repository.getSetting();
    final wsUrl = Uri.parse('ws://${setting.plusHost}:${setting.plusPort}/api/conv');
    Map<String, dynamic> headers = await getCookie(wsUrl);

    channel = IOWebSocketChannel.connect(wsUrl, headers: headers);
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
    return;
  }

  Future<Map<String, dynamic>> getCookie(Uri wsUrl) async {


    if(APIS.serializableCookies == null || APIS.serializableCookies?.isEmpty == true || APIS.serializableCookies?.every((element) => !element.isExpired()) != true){
      await login();
      return await getCookie(wsUrl);
    }
    Map<String, dynamic> headers = {};
    for (var element in APIS.serializableCookies!) {
      print("${element.cookie.name}=${element.cookie.value}");
      headers["Cookie"] = "${element.cookie.name}=${element.cookie.value}";
    }
    return headers;
  }

  void listen(Function(WSResponseModel) listener){
    _listener = listener;
  }
  
  void send(WSRequestModel model) async{
    await _open();
    print(model.toString());
    channel?.sink.add(model.toString());
  }


  void close(){
    channel = null;
  }


}