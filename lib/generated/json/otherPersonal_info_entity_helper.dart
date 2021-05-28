import 'package:flutter_app/class/profile/personal/otherPersonal/otherPersonal_info_entity.dart';

otherPersonalInfoEntityFromJson(OtherPersonalInfoEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode'].toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = OtherPersonalInfoData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> otherPersonalInfoEntityToJson(OtherPersonalInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

otherPersonalInfoDataFromJson(OtherPersonalInfoData data, Map<String, dynamic> json) {
	if (json['attention'] != null) {
		data.attention = json['attention'].toString();
	}
	if (json['user'] != null) {
		data.user = OtherPersonalInfoDataUser().fromJson(json['user']);
	}
	return data;
}

Map<String, dynamic> otherPersonalInfoDataToJson(OtherPersonalInfoData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['attention'] = entity.attention;
	data['user'] = entity.user?.toJson();
	return data;
}

otherPersonalInfoDataUserFromJson(OtherPersonalInfoDataUser data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['id_no'] != null) {
		data.idNo = json['id_no'];
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday'].toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex'] is String
				? int.tryParse(json['sex'])
				: json['sex'].toInt();
	}
	if (json['user_avatar'] != null) {
		data.userAvatar = json['user_avatar'].toString();
	}
	if (json['nick'] != null) {
		data.nick = json['nick'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['integral'] != null) {
		data.integral = json['integral'] is String
				? int.tryParse(json['integral'])
				: json['integral'].toInt();
	}
	if (json['attention_num'] != null) {
		data.attentionNum = json['attention_num'] is String
				? int.tryParse(json['attention_num'])
				: json['attention_num'].toInt();
	}
	if (json['fans_num'] != null) {
		data.fansNum = json['fans_num'] is String
				? int.tryParse(json['fans_num'])
				: json['fans_num'].toInt();
	}
	if (json['post_num'] != null) {
		data.postNum = json['post_num'] is String
				? int.tryParse(json['post_num'])
				: json['post_num'].toInt();
	}
	if (json['collection_num'] != null) {
		data.collectionNum = json['collection_num'] is String
				? int.tryParse(json['collection_num'])
				: json['collection_num'].toInt();
	}
	if (json['praiseNums'] != null) {
		data.praiseNums = json['praiseNums'] is String
				? int.tryParse(json['praiseNums'])
				: json['praiseNums'].toInt();
	}
	if (json['consume_amt'] != null) {
		data.consumeAmt = json['consume_amt'];
	}
	if (json['user_skin'] != null) {
		data.userSkin = json['user_skin'].toString();
	}
	if (json['user_skin_id'] != null) {
		data.userSkinId = json['user_skin_id'] is String
				? int.tryParse(json['user_skin_id'])
				: json['user_skin_id'].toInt();
	}
	if (json['user_no'] != null) {
		data.userNo = json['user_no'].toString();
	}
	return data;
}

Map<String, dynamic> otherPersonalInfoDataUserToJson(OtherPersonalInfoDataUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['id_no'] = entity.idNo;
	data['birthday'] = entity.birthday;
	data['sex'] = entity.sex;
	data['user_avatar'] = entity.userAvatar;
	data['nick'] = entity.nick;
	data['status'] = entity.status;
	data['integral'] = entity.integral;
	data['attention_num'] = entity.attentionNum;
	data['fans_num'] = entity.fansNum;
	data['post_num'] = entity.postNum;
	data['collection_num'] = entity.collectionNum;
	data['praiseNums'] = entity.praiseNums;
	data['consume_amt'] = entity.consumeAmt;
	data['user_skin'] = entity.userSkin;
	data['user_skin_id'] = entity.userSkinId;
	data['user_no'] = entity.userNo;
	return data;
}