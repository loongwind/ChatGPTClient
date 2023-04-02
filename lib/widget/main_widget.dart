import 'package:chatgpt_client/controller/chat_controller.dart';
import 'package:chatgpt_client/model/chat_model.dart';
import 'package:chatgpt_client/model/intl.dart';
import 'package:chatgpt_client/widget/chat_content.dart';
import 'package:chatgpt_client/widget/create_session_dialog.dart';
import 'package:chatgpt_client/widget/setting.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  bool isWindows = defaultTargetPlatform == TargetPlatform.windows;
  ChatController controller = Get.find();
  int topIndex = 0;
  @override
  Widget build(BuildContext context) {
    print(Get.locale?.languageCode);
    return Obx(
      () => NavigationView(
          appBar: NavigationAppBar(
              leading: Container(),
              title: () {
                return DragToMoveArea(
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      S.appName.tr,
                      style: material.Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                );
              }(),
              actions: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // WindowButtons()
                  if (isWindows) const WindowButtons() else Container()
                ],
              )
            // actions: defaultTargetPlatform == TargetPlatform.windows
            //     ? const WindowButtons()
            //     : null
          ),
          pane: NavigationPane(
            selected: topIndex,
            onChanged: (index) => setState(() => topIndex = index),
            displayMode: PaneDisplayMode.open,
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.session.tr),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: Get.locale?.languageCode == "zh" ? 80 : 120),
                  child: CommandBar(
                    overflowBehavior: CommandBarOverflowBehavior.wrap,
                    primaryItems: [
                      CommandBarButton(
                        icon: const Icon(
                          FluentIcons.add,
                          size: 12,
                        ),
                        label: Text(S.newSession.tr),
                        onPressed: () {
                          showCreateSessionDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            items: List.generate(controller.sessions.length, (index){
              ChatSession session = controller.sessions[index];
              return PaneItem(
                      icon: const Icon(FluentIcons.chat),
                      title: Text(session.getName()),
                      body: ChatContent(session),
                      infoBadge: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 40),
                        child: CommandBar(
                          primaryItems: [
                            CommandBarButton(
                              icon: const Icon(
                                FluentIcons.edit,
                                size: 12,
                              ),
                              label: Text(S.rename.tr),
                              onPressed: () {
                                Navigator.pop(context);
                                showCreateSessionDialog(context, session:session);
                              },
                            ),
                            CommandBarButton(
                              icon: const Icon(
                                FluentIcons.clear,
                                size: 12,
                              ),
                              label: Text(S.clearMessage.tr),
                              onPressed: () {
                                Navigator.pop(context);
                                controller.cleanChatMessage(session);
                              },
                            ),
                            CommandBarButton(
                              icon: const Icon(
                                FluentIcons.delete,
                                size: 12,
                              ),
                              label: Text(S.delete.tr),
                              onPressed: () {
                                Navigator.pop(context);
                                controller.deleteChatSession(session);
                              },
                            ),
                          ],
                        ),
                      )
                    );
            }),
            footerItems: [
              PaneItem(
                icon: const Icon(FluentIcons.settings),
                title: Text(S.setting.tr),
                body: const SettingWidget(),
              ),
            ]
          ),
          // content: const MainContent(),
          transitionBuilder: (child, animation) {
            return SuppressPageTransition(
              child: child,
            );
          }),
    );
  }
}


class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

