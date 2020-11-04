import 'package:flutter_app/class/profile/profile_info_entity.dart';

profileInfoEntityFromJson(ProfileInfoEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode']?.toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new ProfileInfoData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> profileInfoEntityToJson(ProfileInfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

profileInfoDataFromJson(ProfileInfoData data, Map<String, dynamic> json) {
	if (json['userAddresses'] != null) {
		data.userAddresses = json['userAddresses']?.toInt();
	}
	if (json['user'] != null) {
		data.user = new ProfileInfoDataUser().fromJson(json['user']);
	}
	return data;
}

Map<String, dynamic> profileInfoDataToJson(ProfileInfoData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userAddresses'] = entity.userAddresses;
	if (entity.user != null) {
		data['user'] = entity.user.toJson();
	}
	return data;
}

profileInfoDataUserFromJson(ProfileInfoDataUser data, Map<String, dynamic> json) {
	if (json['gameStatus'] != null) {
		data.gameStatus = json['gameStatus']?.toInt();
	}
	if (json['consumeAmt'] != null) {
		data.consumeAmt = json['consumeAmt'];
	}
	if (json['beautyAmt'] != null) {
		data.beautyAmt = json['beautyAmt'];
	}
	if (json['skincardAmt'] != null) {
		data.skincardAmt = json['skincardAmt'];
	}
	if (json['time'] != null) {
		data.time = json['time']?.toInt();
	}
	if (json['collectionNum'] != null) {
		data.collectionNum = json['collectionNum']?.toInt();
	}
	if (json['birthdayString'] != null) {
		data.birthdayString = json['birthdayString'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['idNo'] != null) {
		data.idNo = json['idNo'];
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex']?.toInt();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['userAvatar'] != null) {
		data.userAvatar = json['userAvatar']?.toString();
	}
	if (json['nick'] != null) {
		data.nick = json['nick']?.toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['integral'] != null) {
		data.integral = json['integral']?.toInt();
	}
	if (json['openId'] != null) {
		data.openId = json['openId'];
	}
	if (json['unionId'] != null) {
		data.unionId = json['unionId'];
	}
	if (json['source'] != null) {
		data.source = json['source']?.toString();
	}
	if (json['userNo'] != null) {
		data.userNo = json['userNo']?.toString();
	}
	if (json['attentionNum'] != null) {
		data.attentionNum = json['attentionNum']?.toInt();
	}
	if (json['fansNum'] != null) {
		data.fansNum = json['fansNum']?.toInt();
	}
	if (json['postNum'] != null) {
		data.postNum = json['postNum']?.toInt();
	}
	if (json['sessionKey'] != null) {
		data.sessionKey = json['sessionKey'];
	}
	if (json['isVirtual'] != null) {
		data.isVirtual = json['isVirtual']?.toInt();
	}
	if (json['virtualUserPwd'] != null) {
		data.virtualUserPwd = json['virtualUserPwd'];
	}
	if (json['virtualUnionid'] != null) {
		data.virtualUnionid = json['virtualUnionid'];
	}
	if (json['attentionUser'] != null) {
		data.attentionUser = json['attentionUser'];
	}
	if (json['account'] != null) {
		data.account = json['account'];
	}
	if (json['userSkin'] != null) {
		data.userSkin = json['userSkin'];
	}
	if (json['userSkinId'] != null) {
		data.userSkinId = json['userSkinId'];
	}
	if (json['praiseNums'] != null) {
		data.praiseNums = json['praiseNums']?.toInt();
	}
	if (json['isFirstLogin'] != null) {
		data.isFirstLogin = json['isFirstLogin']?.toString();
	}
	if (json['isStaff'] != null) {
		data.isStaff = json['isStaff']?.toInt();
	}
	if (json['updateCount'] != null) {
		data.updateCount = json['updateCount']?.toInt();
	}
	return data;
}

Map<String, dynamic> profileInfoDataUserToJson(ProfileInfoDataUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['gameStatus'] = entity.gameStatus;
	data['consumeAmt'] = entity.consumeAmt;
	data['beautyAmt'] = entity.beautyAmt;
	data['skincardAmt'] = entity.skincardAmt;
	data['time'] = entity.time;
	data['collectionNum'] = entity.collectionNum;
	data['birthdayString'] = entity.birthdayString;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['idNo'] = entity.idNo;
	data['birthday'] = entity.birthday;
	data['sex'] = entity.sex;
	data['mobile'] = entity.mobile;
	data['userAvatar'] = entity.userAvatar;
	data['nick'] = entity.nick;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['status'] = entity.status;
	data['integral'] = entity.integral;
	data['openId'] = entity.openId;
	data['unionId'] = entity.unionId;
	data['source'] = entity.source;
	data['userNo'] = entity.userNo;
	data['attentionNum'] = entity.attentionNum;
	data['fansNum'] = entity.fansNum;
	data['postNum'] = entity.postNum;
	data['sessionKey'] = entity.sessionKey;
	data['isVirtual'] = entity.isVirtual;
	data['virtualUserPwd'] = entity.virtualUserPwd;
	data['virtualUnionid'] = entity.virtualUnionid;
	data['attentionUser'] = entity.attentionUser;
	data['account'] = entity.account;
	data['userSkin'] = entity.userSkin;
	data['userSkinId'] = entity.userSkinId;
	data['praiseNums'] = entity.praiseNums;
	data['isFirstLogin'] = entity.isFirstLogin;
	data['isStaff'] = entity.isStaff;
	data['updateCount'] = entity.updateCount;
	return data;
}