import 'package:chatgpt_client/model/setting.dart';
import 'package:chatgpt_client/repository/data_repository.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{

  DataRepository dataRepository = Get.find();
  late Setting setting =  dataRepository.getSetting();


  void updateSetting(Setting setting){
    dataRepository.saveSetting(setting);
  }

}