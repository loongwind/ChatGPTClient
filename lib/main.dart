import 'dart:io';

import 'package:chatgpt_client/app.dart';
import 'package:chatgpt_client/http/http_overrides.dart';
import 'package:chatgpt_client/model/intl.dart';
import 'package:chatgpt_client/widget/main_widget.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // 必须加上这一行。
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1000, 800),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.center();
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setPreventClose(true);
  });
  await init();
  runApp(const MyApp());
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Intl(),
      locale: Locale('zh', 'CN'),
      fallbackLocale: Locale('zh', 'CN'),
      home: FluentApp(
        title: 'Flutter Demo',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: FluentThemeData(accentColor: SystemTheme.accentColor.accent.toAccentColor()),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with WindowListener{

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowClose() {
    // TODO: implement onWindowClose
    super.onWindowClose();
    windowManager.destroy();
  }

  @override
  void onWindowFocus() {
    super.onWindowFocus();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MainWidget();
  }
}
