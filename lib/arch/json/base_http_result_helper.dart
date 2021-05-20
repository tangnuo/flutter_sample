
import 'package:flutter_sample/arch/net/base_http_result.dart';

baseHttpResultFromJson(BaseHttpResult data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['fields'] != null) {
		data.fields = (json['fields'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['result'] != null) {
		data.result = json['result'];
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['timestamp'] != null) {
		data.timestamp = json['timestamp'] is String
				? int.tryParse(json['timestamp'])
				: json['timestamp'].toInt();
	}
	return data;
}

Map<String, dynamic> baseHttpResultToJson(BaseHttpResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['fields'] = entity.fields;
	data['message'] = entity.message;
	data['result'] = entity.result;
	data['status'] = entity.status;
	data['timestamp'] = entity.timestamp;
	return data;
}

baseHttpResultResultFromJson(BaseHttpResultResult data, Map<String, dynamic> json) {
	if (json['path'] != null) {
		data.path = json['path'].toString();
	}
	return data;
}

Map<String, dynamic> baseHttpResultResultToJson(BaseHttpResultResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['path'] = entity.path;
	return data;
}