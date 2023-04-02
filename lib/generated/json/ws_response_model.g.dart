import 'package:chatgpt_client/generated/json/base/json_convert_content.dart';
import 'package:chatgpt_client/model/plus_model.dart';

WSResponseModel $WSResponseModelFromJson(Map<String, dynamic> json) {
  final WSResponseModel data = WSResponseModel();
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    data.message = message;
  }
  final String? conversation_id = jsonConvert.convert<String>(json['conversation_id']);
  if (conversation_id != null) {
    data.conversation_id = conversation_id;
  }
  final String? parent_id = jsonConvert.convert<String>(json['parent_id']);
  if (parent_id != null) {
    data.parent_id = parent_id;
  }
  final String? new_title = jsonConvert.convert<String>(json['new_title']);
  if (new_title != null) {
    data.new_title = new_title;
  }
  final String? model_name = jsonConvert.convert<String>(json['model_name']);
  if (model_name != null) {
    data.model_name = model_name;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    data.type = type;
  }
  final String? tip = jsonConvert.convert<String>(json['tip']);
  if (tip != null) {
    data.tip = tip;
  }
  return data;
}

Map<String, dynamic> $WSResponseModelToJson(WSResponseModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  // data['id'] = entity.id;
  data['message'] = entity.message;
  data['conversation_id'] = entity.conversation_id;
  data['parent_id'] = entity.parent_id;
  data['new_title'] = entity.new_title;
  data['model_name'] = entity.model_name;
  data['type'] = entity.type;
  data['tip'] = entity.tip;
  return data;
}
