

import 'dart:convert';

import 'package:chatgpt_client/generated/json/ws_request_model.g.dart';
import 'package:chatgpt_client/generated/json/ws_response_model.g.dart';

class WSRequestModel{
  String? message;
  String? conversation_id;
  String? parent_id;
  String? new_title;
  String? model_name;

  WSRequestModel();

  factory WSRequestModel.fromJson(Map<String, dynamic> json) => $WSRequestModelFromJson(json);

  Map<String, dynamic> toJson() => $WSRequestModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class WSResponseModel{
  String? type;
  String? message;
  String? conversation_id;
  String? parent_id;
  String? new_title;
  String? model_name;
  String? tip;

  WSResponseModel();

  factory WSResponseModel.fromJson(Map<String, dynamic> json) => $WSResponseModelFromJson(json);

  Map<String, dynamic> toJson() => $WSResponseModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}