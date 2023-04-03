import 'package:chatgpt_client/model/setting.dart';
import 'package:chatgpt_client/repository/data_repository.dart';
import 'package:chatgpt_client/repository/ws_repository.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{

  DataRepository dataRepository = Get.find();
  WSRepository wsRepository = Get.find();
  late Setting setting =  dataRepository.getSetting();


  void updateSetting(Setting setting){
    dataRepository.saveSetting(setting);
  }

  void login(){
    wsRepository.login();
  }

}