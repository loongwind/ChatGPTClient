import 'package:chatgpt_client/widget/chat_content.dart';
import 'package:chatgpt_client/widget/main_content.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:window_manager/window_manager.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  bool isWindows = defaultTargetPlatform == TargetPlatform.windows;
  int topIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
        appBar: NavigationAppBar(
            leading: Container(),
            title: () {
              return DragToMoveArea(
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "ChatGPT Client",
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
          header: const Text('会话'),
          items: [
            PaneItem(
              icon: const Icon(FluentIcons.chat),
              title: const Text('技术问题'),
              body: ChatContent(),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.chat),
              title: const Text('日常问题'),
              infoBadge: const InfoBadge(source: Text('8')),
              body: ChatContent(),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.chat),
              title: const Text('瞎问'),
              infoBadge: const InfoBadge(source: Text('8')),
              body: ChatContent(),
            ),
          ],
          footerItems: [
            PaneItem(
              icon: const Icon(FluentIcons.settings),
              title: const Text('设置'),
              body: Placeholder(),
            ),
          ]
        ),
        // content: const MainContent(),
        transitionBuilder: (child, animation) {
          return SuppressPageTransition(
            child: child,
          );
        });
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

