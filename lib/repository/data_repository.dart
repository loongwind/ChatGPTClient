import 'package:chatgpt_client/app.dart';
import 'package:chatgpt_client/model/chat_model.dart';
import 'package:chatgpt_client/model/setting.dart';
import 'package:chatgpt_client/objectbox.g.dart';
import 'package:chatgpt_client/utils/ext.dart';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

class DataRepository {
  late Store _store;
  late final Box<ChatSession> _chatSessionBox = _store.box<ChatSession>();
  late final Box<ChatMessage> _chatMessageBox = _store.box<ChatMessage>();
  late final Box<Setting> _settingMessageBox = _store.box<Setting>();


  static Future<DataRepository> create() async{
    DataRepository repository = DataRepository();
    await repository.initStore();
    return repository;
  }

  Future<void> initStore() async {
    _store = await openStore(macosApplicationGroup: "FGDTDLOBXDJ.demo");
    _initSetting();
    return;
  }

  void _initSetting() {
    Setting setting = getSetting();
    if(setting.uuid.isEmpty){
      setting.uuid = const Uuid().v4().substring(0,8);
      saveSetting(setting);
    }
    sessionPrefix = setting.uuid;
  }

  void saveChatSession(ChatSession chatSession){
    _chatSessionBox.put(chatSession);
  }

  List<ChatSession> getAllChatSession(){
    return _chatSessionBox.getAll();
  }

  void updateChatMessage(ChatMessage chatMessage){
    _chatMessageBox.put(chatMessage);
  }

  void deleteChatSession(ChatSession chatSession){
    _chatSessionBox.remove(chatSession.id);
  }

  void saveSetting(Setting setting){
    _settingMessageBox.put(setting);
  }

  Setting getSetting(){
    return _settingMessageBox.getAll().firstOrNull() ?? Setting();
  }

}
