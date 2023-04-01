
import 'package:chatgpt_client/model/constant.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Setting{
  @Id()
  int id = 0;

  String apiKey = "";
  String language = CN;
  bool showWordsNum = false;
  String model = defaultModel;
  int maxContextTokens = defaultMaxContextTokens;
  int maxResponseTokens = defaultMaxResponseTokens;
  bool showModelName = false;
  bool enabledProxy = false;
  String proxyType = systemProxyType;
  String proxyHost = "";
  String proxyPort = "";
}