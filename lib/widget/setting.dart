import 'package:chatgpt_client/app.dart';
import 'package:chatgpt_client/controller/chat_controller.dart';
import 'package:chatgpt_client/controller/setting_controller.dart';
import 'package:chatgpt_client/model/chat_model.dart';
import 'package:chatgpt_client/model/constant.dart';
import 'package:chatgpt_client/model/intl.dart';
import 'package:chatgpt_client/model/setting.dart';
import 'package:chatgpt_client/widget/chat_content.dart';
import 'package:chatgpt_client/widget/create_session_dialog.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';
class SettingWidget extends StatefulWidget {
  const SettingWidget({Key? key}) : super(key: key);

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  SettingController controller = Get.find();
  late Setting setting = controller.setting;
  late String selectedLanguage = setting.language;
  late String selectedChatType = setting.isOpenAPI ? typeOpenAPI : typePlus;
  late String selectedModel = setting.model;
  late String selectedProxy = setting.proxyType;
  late bool showNumChecked = setting.showWordsNum;
  late bool showModelChecked = setting.showModelName;
  late bool proxyChecked = setting.enabledProxy;
  late int contextMaxToken = setting.maxContextTokens;
  late int responseMaxToken = setting.maxResponseTokens;

  TextEditingController apiKeyController = TextEditingController();
  TextEditingController contextMaxTokenController = TextEditingController();
  TextEditingController responseMaxTokenController = TextEditingController();
  TextEditingController proxyHost = TextEditingController();
  TextEditingController proxyPort = TextEditingController();
  TextEditingController plusHost = TextEditingController();
  TextEditingController plusPort = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    contextMaxTokenController.text = "$contextMaxToken";
    responseMaxTokenController.text = "$responseMaxToken";
    apiKeyController.text = setting.apiKey;
    proxyHost.text = setting.proxyHost;
    proxyPort.text = setting.proxyPort;
    plusHost.text = setting.plusHost;
    plusPort.text = setting.plusPort;
    usernameController.text = setting.plusUsername;
    pwdController.text = setting.plusPassword;
  }

  void save(){
    String apiKey = apiKeyController.text;
    int maxContextTokens = int.parse(contextMaxTokenController.text);
    int maxResponseTokens = int.parse(responseMaxTokenController.text);
    setting.apiKey = apiKey;
    setting.maxContextTokens = maxContextTokens;
    setting.maxResponseTokens = maxResponseTokens;
    setting.language = selectedLanguage;
    setting.showWordsNum = showNumChecked;
    setting.showModelName = showModelChecked;
    setting.model = selectedModel;
    setting.enabledProxy = proxyChecked;
    setting.proxyType = selectedProxy;
    setting.proxyHost = proxyHost.text;
    setting.proxyPort = proxyPort.text;
    setting.isOpenAPI = selectedChatType == typeOpenAPI ;
    setting.plusHost = plusHost.text ;
    setting.plusPort = plusPort.text;
    setting.plusUsername = usernameController.text;
    setting.plusPassword = pwdController.text;

    controller.updateSetting(setting);
    setApiKey(apiKey);
    Get.updateLocale(setting.language == CN ? const Locale('zh', 'CN') : const Locale('en', 'US'));
  }

  @override
  Widget build(BuildContext context) {
    bool isOpenAPI = selectedChatType == typeOpenAPI;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(context),
          const SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildChatType(),
                  const SizedBox(height: 15,),
                  PaneItemSeparator().build(context, Axis.horizontal),
                  const SizedBox(height: 15,),
                  buildBaseSetting(),
                  PaneItemSeparator().build(context, Axis.horizontal),
                  isOpenAPI ? buildModelSettingWidget() : Container(),
                  isOpenAPI ? PaneItemSeparator().build(context, Axis.horizontal) : Container(),
                  buildProxyWidget(),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.setting.tr,
              style: material.Theme.of(context).textTheme.titleLarge,
            ),
            Button(child: Text(S.save.tr, style: material.Theme.of(context).textTheme.bodyMedium?.copyWith(color: material.Theme.of(context).primaryColor),), onPressed: (){
              save();
              displayInfoBar(context, alignment: Alignment.topCenter, duration:Duration(seconds: 1),builder: (context, close) {
                return InfoBar(
                  title: const Text('保存成功'),
                  action: IconButton(
                    icon: const Icon(FluentIcons.clear),
                    onPressed: close,
                  ),
                  severity: InfoBarSeverity.success,
                );
              });
            }),
          ],
        );
  }

  Widget buildChatType(){
    return Row(
      children: [
        Text(
          "${S.chatType.tr}：",
          style: material.Theme.of(context).textTheme.bodyMedium,
        ),
        ComboBox<String>(
          value: selectedChatType,
          items: List.generate(
              chatTypes.length,
                  (index) => ComboBoxItem(
                value: chatTypes[index],
                child: Text(chatTypes[index]),
              )),
          onChanged: (chatType) => setState(() => selectedChatType = chatType ?? ""),
        ),
      ],
    );
  }


  Widget buildBaseSetting(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        selectedChatType == typeOpenAPI ? buildEditOpenApiKey() : buildPlusSetting(),
        const SizedBox(height: 15,),
        Row(
          children: [
            Text(
              "${S.language.tr}：",
              style: material.Theme.of(context).textTheme.bodyMedium,
            ),
            ComboBox<String>(
              value: selectedLanguage,
              items: List.generate(
                  languages.length,
                      (index) => ComboBoxItem(
                    value: languages[index],
                    child: Text(languages[index]),
                  )),
              onChanged: (language) => setState(() => selectedLanguage = language ?? ""),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        ToggleSwitch(
          checked: showNumChecked,
          content: Text(S.showTokenStatic.tr),
          onChanged: (v) => setState(() => showNumChecked = v),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }

  Widget buildEditOpenApiKey() {
    return InfoLabel(
        label: 'OpenAI API Key:',
        child: TextBox(
          controller: apiKeyController,
          obscureText: true,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          placeholder: '',
          expands: false,
        ),
      );
  }

  Widget buildPlusSetting(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(
            flex:3,
            child: InfoLabel(
              label: 'Host:',
              child:  TextBox(
                controller: plusHost,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                placeholder: 'x.x.x.x',
                expands: false,
              ),
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex:1,
            child: InfoLabel(
              label: 'Port:',
              child: TextBox(
                controller: plusPort,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                placeholder: '8080',
                expands: false,
              ),
            ),
          ),
          Expanded( flex:2, child: Container())
        ],),
        const SizedBox(height: 15,),
        Row(children: [
          Expanded(
            flex:2,
            child: InfoLabel(
              label: 'username:',
              child:  TextBox(
                controller: usernameController,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                expands: false,
              ),
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            flex:2,
            child: InfoLabel(
              label: 'password:',
              child: TextBox(
                controller: pwdController,
                obscureText: true,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                expands: false,
              ),
            ),
          ),
          Expanded( flex:2, child: Container())
        ],),
      ],
    );
  }

  Widget buildModelSettingWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.modelAndParamsSetting.tr,
          style: material.Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 15,),
        Row(
          children: [
            Text(
              "${S.model.tr}：",
              style: material.Theme.of(context).textTheme.bodyMedium,
            ),
            ComboBox<String>(
              value: selectedModel,
              items: List.generate(
                  models.length,
                      (index) => ComboBoxItem(
                    value: models[index],
                    child: Text(models[index]),
                  )),
              onChanged: (model) => setState(() => selectedModel = model ?? ""),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        InfoLabel(
            label: S.maxContextToken.tr,
            child:  Row(
              children: [
                Expanded(
                  child: Slider(
                    value: contextMaxToken.toDouble(),
                    max: 8192,
                    min: 0,
                    onChanged:  (v) => setState((){
                      contextMaxToken = v.toInt();
                      contextMaxTokenController.text = contextMaxToken.toString();
                    }),
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                    width: 100,
                    child: TextBox(controller: contextMaxTokenController,)),
              ],
            )
        ),
        const SizedBox(height: 15,),
        InfoLabel(
            label: S.maxResponseToken.tr,
            child:  Row(
              children: [
                Expanded(
                  child: Slider(
                    value: responseMaxToken.toDouble(),
                    max: 8192,
                    min: 0,
                    onChanged:  (v) => setState((){
                      responseMaxToken = v.toInt();
                      responseMaxTokenController.text = responseMaxToken.toString();
                    }),
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                    width: 100,
                    child: TextBox(controller: responseMaxTokenController,)),
              ],
            )
        ),
        const SizedBox(height: 15,),
        ToggleSwitch(
          checked: showModelChecked,
          content: Text(S.showModelName.tr),
          onChanged: (v) => setState(() => showModelChecked = v),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }

  Widget buildProxyWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.proxySetting.tr,
          style: material.Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 15,),
        ToggleSwitch(
          checked: proxyChecked,
          content: Text(S.enabledProxy.tr),
          onChanged: (v) => setState(() => proxyChecked = v),
        ),
        const SizedBox(height: 15,),
        proxyChecked ? buildProxyCustomSetting() : Container(),
      ],
    );
  }

  Widget buildProxyEnabled(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "${S.proxyType.tr}：",
              style: material.Theme.of(context).textTheme.bodyMedium,
            ),
            ComboBox<String>(
              value: selectedProxy,
              items: List.generate(
                  proxyTypes().length,
                      (index) => ComboBoxItem(
                    value: proxyTypes()[index],
                    child: Text(proxyTypes()[index].tr),
                  )),
              onChanged: (type) => setState(() => selectedProxy = type ?? ""),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        selectedProxy == customProxyType ? buildProxyCustomSetting() : Container(),
      ],
    );
  }

  Widget buildProxyCustomSetting(){
    return Row(children: [
      Expanded(
        flex:3,
        child: InfoLabel(
          label: 'Host:',
          child:  TextBox(
            controller: proxyHost,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            placeholder: '127.0.0.1',
            expands: false,
          ),
        ),
      ),
      const SizedBox(width: 20,),
      Expanded(
        flex:1,
        child: InfoLabel(
          label: 'Port:',
          child: TextBox(
            controller: proxyPort,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            placeholder: '7890',
            expands: false,
          ),
        ),
      ),
      Expanded( flex:2, child: Container())
    ],);
  }
}
