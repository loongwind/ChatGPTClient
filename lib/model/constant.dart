
import 'package:chatgpt_client/model/intl.dart';
import 'package:get/get.dart';

const systemProxyType = S.systemProxy;
const customProxyType = S.customProxy;

const EN = "English";
const CN = "简体中文";

const defaultModel = "gpt-3.5-turbo";
const defaultPlusModel = "text-davinci-002-render-sha";
const defaultMaxContextTokens = 4000;
const defaultMaxResponseTokens = 2048;

final proxyTypes = ()=>[systemProxyType, customProxyType];
const languages = [EN, CN];
const models = ["gpt-3.5-turbo","gpt-3.5-turbo-0301", "gpt-4", "gpt-4-0314", "gpt-4-32k", "gpt-4-32k-0314"];


const typeOpenAPI = "Open API";
const typePlus = "ChatGPT Plus";

const chatTypes = [typeOpenAPI, typePlus];