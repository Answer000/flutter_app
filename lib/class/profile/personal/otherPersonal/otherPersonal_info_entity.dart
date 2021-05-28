import 'package:flutter_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_app/generated/json/base/json_field.dart';

class OtherPersonalInfoEntity with JsonConvert<OtherPersonalInfoEntity> {
	String resultCode;
	String msg;
	OtherPersonalInfoData data;
}

class OtherPersonalInfoData with JsonConvert<OtherPersonalInfoData> {
	String attention;
	OtherPersonalInfoDataUser user;
}

class OtherPersonalInfoDataUser with JsonConvert<OtherPersonalInfoDataUser> {
	int id;
	dynamic name;
	@JSONField(name: "id_no")
	dynamic idNo;
	String birthday;
	int sex;
	@JSONField(name: "user_avatar")
	String userAvatar;
	String nick;
	int status;
	int integral;
	@JSONField(name: "attention_num")
	int attentionNum;
	@JSONField(name: "fans_num")
	int fansNum;
	@JSONField(name: "post_num")
	int postNum;
	@JSONField(name: "collection_num")
	int collectionNum;
	int praiseNums;
	@JSONField(name: "consume_amt")
	dynamic consumeAmt;
	@JSONField(name: "user_skin")
	String userSkin;
	@JSONField(name: "user_skin_id")
	int userSkinId;
	@JSONField(name: "user_no")
	String userNo;
}
