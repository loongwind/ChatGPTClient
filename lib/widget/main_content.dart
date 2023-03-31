import 'package:chatgpt_client/widget/left_content.dart';
import 'package:chatgpt_client/widget/chat_content.dart';
import 'package:fluent_ui/fluent_ui.dart';

class MainContent extends StatefulWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
            child: LeftContent()),
        Expanded(
          flex: 3,
            child: ChatContent()),
      ],
    );
  }
}
