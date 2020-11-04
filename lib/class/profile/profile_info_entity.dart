import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class ProfileInfoEntity with JsonConvert<ProfileInfoEntity> {
	String resultCode;
	String msg;
	ProfileInfoData data;
}

class ProfileInfoData with JsonConvert<ProfileInfoData> {
	int userAddresses;
	ProfileInfoDataUser user;
}

class ProfileInfoDataUser with JsonConvert<ProfileInfoDataUser> {
	int gameStatus;
	dynamic consumeAmt;
	dynamic beautyAmt;
	dynamic skincardAmt;
	int time;
	int collectionNum;
	dynamic birthdayString;
	int id;
	dynamic name;
	dynamic idNo;
	String birthday;
	int sex;
	String mobile;
	String userAvatar;
	String nick;
	String createTime;
	String updateTime;
	int status;
	int integral;
	dynamic openId;
	dynamic unionId;
	String source;
	String userNo;
	int attentionNum;
	int fansNum;
	int postNum;
	dynamic sessionKey;
	int isVirtual;
	dynamic virtualUserPwd;
	dynamic virtualUnionid;
	dynamic attentionUser;
	dynamic account;
	dynamic userSkin;
	dynamic userSkinId;
	int praiseNums;
	String isFirstLogin;
	int isStaff;
	int updateCount;
}
