
import 'package:chatgpt_client/controller/chat_controller.dart';
import 'package:chatgpt_client/model/chat_model.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

void showCreateSessionDialog(BuildContext context, {ChatSession? session}) async {
  TextEditingController nameController = TextEditingController();
  if(session != null){
    nameController.text = session.getName();
  }
  await showDialog<String>(
    context: context,
    builder: (context) => ContentDialog(
      title: Text(session == null ? '新建会话' : "重命名"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              const Text('名称:'),
              const SizedBox(width: 10),
              SizedBox(
                width: 250,
                child: TextBox(
                  controller: nameController,
                  placeholder: "请输入会话名称",
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
        ],
      ),
      actions: [
        Button(
          child: const Text('取消'),
          onPressed: () =>  Navigator.pop(context),
        ),
        FilledButton(
          child: const Text('确定'),
          onPressed: (){
            ChatController controller = Get.find();
            String name = nameController.text;
            if(session != null){
              session.setName(name);
              controller.updateSession(session);
            }else{
              ChatSession chatSession = ChatSession();
              chatSession.setName(name);
              controller.addSession(chatSession);
            }
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}