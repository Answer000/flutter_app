import 'package:flutter_app/class/profile/integral/myIntegral_data_entity.dart';

myIntegralDataEntityFromJson(MyIntegralDataEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode'].toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = MyIntegralDataData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> myIntegralDataEntityToJson(MyIntegralDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

myIntegralDataDataFromJson(MyIntegralDataData data, Map<String, dynamic> json) {
	if (json['missionList'] != null) {
		data.missionList = (json['missionList'] as List).map((v) => MyIntegralDataDataMissionList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> myIntegralDataDataToJson(MyIntegralDataData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['missionList'] =  entity.missionList?.map((v) => v.toJson())?.toList();
	return data;
}

myIntegralDataDataMissionListFromJson(MyIntegralDataDataMissionList data, Map<String, dynamic> json) {
	if (json['currentTime'] != null) {
		data.currentTime = json['currentTime'] is String
				? int.tryParse(json['currentTime'])
				: json['currentTime'].toInt();
	}
	if (json['maxTime'] != null) {
		data.maxTime = json['maxTime'] is String
				? int.tryParse(json['maxTime'])
				: json['maxTime'].toInt();
	}
	if (json['btnText'] != null) {
		data.btnText = json['btnText'].toString();
	}
	if (json['route'] != null) {
		data.route = json['route'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['maxIntegral'] != null) {
		data.maxIntegral = json['maxIntegral'] is String
				? int.tryParse(json['maxIntegral'])
				: json['maxIntegral'].toInt();
	}
	if (json['isComplete'] != null) {
		data.isComplete = json['isComplete'];
	}
	return data;
}

Map<String, dynamic> myIntegralDataDataMissionListToJson(MyIntegralDataDataMissionList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currentTime'] = entity.currentTime;
	data['maxTime'] = entity.maxTime;
	data['btnText'] = entity.btnText;
	data['route'] = entity.route;
	data['id'] = entity.id;
	data['type'] = entity.type;
	data['title'] = entity.title;
	data['maxIntegral'] = entity.maxIntegral;
	data['isComplete'] = entity.isComplete;
	return data;
}