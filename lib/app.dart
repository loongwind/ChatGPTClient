
import 'package:chatgpt_client/controller/ChatController.dart';
import 'package:dart_openai/openai.dart';
import 'package:get/get.dart';

Future<void> init() async{
  OpenAI.apiKey = "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";
  Get.put(ChatController());
  return;
}