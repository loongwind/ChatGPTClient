
import 'package:chatgpt_client/model/intl.dart';
import 'package:get/get.dart';

final systemProxyType = S.systemProxy.tr;
final customProxyType = S.customProxy.tr;

const EN = "English";
const CN = "简体中文";

const defaultModel = "gpt-3.5-turbo";
const defaultMaxContextTokens = 4000;
const defaultMaxResponseTokens = 2048;

final proxyTypes = ()=>[systemProxyType, customProxyType];
const languages = [EN, CN];
const models = ["gpt-3.5-turbo","gpt-3.5-turbo-0301", "gpt-4", "gpt-4-0314", "gpt-4-32k", "gpt-4-32k-0314"];