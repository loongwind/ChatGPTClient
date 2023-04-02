import 'dart:io';

import 'package:chatgpt_client/model/constant.dart';
import 'package:chatgpt_client/model/setting.dart';
import 'package:chatgpt_client/repository/data_repository.dart';
import 'package:get/get.dart';

class ProxiedHttpOverrides extends HttpOverrides {
  ProxiedHttpOverrides();

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    Setting setting = Get.find<DataRepository>().getSetting();
    if(setting.enabledProxy){
      // if(setting.proxyType == customProxyType){
        return super.createHttpClient(context)
          ..findProxy = (uri) {
            return "PROXY ${setting.proxyHost}:${setting.proxyPort};";
          };
      // }
    }
    return super.createHttpClient(context);
  }
}