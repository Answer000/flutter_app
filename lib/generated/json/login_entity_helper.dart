import 'package:flutter_app/class/login/login_entity.dart';

loginEntityFromJson(LoginEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode']?.toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new LoginData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> loginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

loginDataFromJson(LoginData data, Map<String, dynamic> json) {
	if (json['tokenExpiryDate'] != null) {
		data.tokenExpiryDate = json['tokenExpiryDate']?.toInt();
	}
	if (json['isFirstLogin'] != null) {
		data.isFirstLogin = json['isFirstLogin']?.toString();
	}
	if (json['systemDate'] != null) {
		data.systemDate = json['systemDate']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['refreshToken'] != null) {
		data.refreshToken = json['refreshToken']?.toString();
	}
	return data;
}

Map<String, dynamic> loginDataToJson(LoginData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tokenExpiryDate'] = entity.tokenExpiryDate;
	data['isFirstLogin'] = entity.isFirstLogin;
	data['systemDate'] = entity.systemDate;
	data['userId'] = entity.userId;
	data['token'] = entity.token;
	data['refreshToken'] = entity.refreshToken;
	return data;
}