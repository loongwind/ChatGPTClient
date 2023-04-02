
import 'dart:io';

import 'package:chatgpt_client/controller/chat_controller.dart';
import 'package:chatgpt_client/controller/setting_controller.dart';
import 'package:chatgpt_client/http/http_overrides.dart';
import 'package:chatgpt_client/model/constant.dart';
import 'package:chatgpt_client/model/setting.dart';
import 'package:chatgpt_client/repository/data_repository.dart';
import 'package:chatgpt_client/repository/ws_repository.dart';
import 'package:dart_openai/openai.dart';
import 'package:get/get.dart';

Future<void> init() async{
  await Get.putAsync(() async{
    return await DataRepository.create();
  });
  Get.put(WSRepository());
  Get.put(ChatController());
  Get.put(SettingController());

  Setting setting = Get.find<SettingController>().setting;
  setApiKey(setting.apiKey);
  setProxy();
  return;
}

void setApiKey(String apiKey){
  OpenAI.apiKey = apiKey;
}

void setProxy(){
    HttpOverrides.global = ProxiedHttpOverrides();
}