


import 'package:flutter_sample/arch/model/dict_model.dart';

dictModelFromJson(DictModel data, Map<String, dynamic> json) {
	if (json['codeItemName'] != null) {
		data.codeItemName = json['codeItemName'].toString();
	}
	if (json['codeTypeNo'] != null) {
		data.codeTypeNo = json['codeTypeNo'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['no'] != null) {
		data.no = json['no'].toString();
	}
	return data;
}

Map<String, dynamic> dictModelToJson(DictModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['codeItemName'] = entity.codeItemName;
	data['codeTypeNo'] = entity.codeTypeNo;
	data['id'] = entity.id;
	data['no'] = entity.no;
	return data;
}