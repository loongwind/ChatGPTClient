import 'package:get/get.dart';

class S{
  static const String appName = "appName";
  static const String session = "session";
  static const String newSession = "newSession";
  static const String setting = "setting";
  static const String save = "save";
  static const String language = "language";
  static const String simpleChinese = "simpleChinese";
  static const String showTokenStatic = "showTokenStatic";
  static const String modelAndParamsSetting = "modelAndParamsSetting";
  static const String model = "model";
  static const String maxContextToken = "maxContextToken";
  static const String maxResponseToken = "maxResponseToken";
  static const String showModelName = "showModelName";
  static const String proxySetting = "proxySetting";
  static const String proxyType = "proxyType";
  static const String systemProxy = "systemProxy";
  static const String customProxy = "customProxy";
  static const String enabledProxy = "enabledProxy";
  static const String send = "send";
  static const String rename = "rename";
  static const String clearMessage = "clearMessage";
  static const String delete = "delete";
  static const String chatType = "chatType";
  static const String warningTip = "warningTip";
  static const String loginException = "loginException";
  static const String loginExceptionTips = "loginExceptionTips";
  static const String saveSuccess = "saveSuccess";
}


class Intl extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {
      S.appName : 'ChatGPT 客户端',
      S.session : '会话',
      S.newSession : '新会话',
      S.setting : '设置',
      S.save : '保存',
      S.language : '语言',
      S.simpleChinese : '简体中文',
      S.showTokenStatic : '显示 Token 统计',
      S.modelAndParamsSetting : '模型 & 参数设置',
      S.model : '模型',
      S.maxContextToken : '上下文中最大 ToKen 数',
      S.maxResponseToken : '每个回复最大 ToKen 数',
      S.showModelName : '显示模型名称',
      S.proxySetting : '代理设置',
      S.proxyType : '代理类型',
      S.systemProxy : '系统代理',
      S.customProxy : '自定义代理',
      S.enabledProxy : '是否开启代理',
      S.send : '发送',
      S.rename : '重命名',
      S.clearMessage : '清除聊天记录',
      S.delete : '删除',
      S.chatType : '模式',
      S.warningTip : '异常提示',
      S.loginException : '登录异常',
      S.loginExceptionTips : '请检查地址、端口或用户名密码是否填写正确',
      S.saveSuccess : '保存成功',
    },
    'en_US': {
      S.appName: 'ChatGPT Client',
      S.session: 'Session',
      S.newSession: 'New Session',
      S.setting: 'Setting',
      S.save: 'Save',
      S.language: 'Language',
      S.simpleChinese: 'Simple Chinese',
      S.showTokenStatic: 'Show Token Static',
      S.modelAndParamsSetting: 'Model & Parameter Setting',
      S.model: 'Model',
      S.maxContextToken: 'Max Context Token Num',
      S.maxResponseToken: 'Max Response Token Num',
      S.showModelName: 'Show Model Name',
      S.proxySetting: 'Proxy Setting',
      S.proxyType: 'Proxy Type',
      S.systemProxy: 'System Proxy',
      S.customProxy: 'Custom Proxy',
      S.enabledProxy: 'Is Open Proxy',
      S.send: 'Send',
      S.rename: 'Rename',
      S.clearMessage: 'Clear Message',
      S.delete: 'Delete',
      S.chatType : 'Chat Mode',
      S.warningTip : 'Warning Tips',
      S.loginException : 'Login Exception',
      S.loginExceptionTips : 'Please check Host、Port、Username、Password is Right',
      S.saveSuccess : 'Save Success',
    }
  };
}