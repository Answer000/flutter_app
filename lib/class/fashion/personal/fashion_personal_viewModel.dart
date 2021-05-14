import 'package:flutter_app/class/profile/profile_info_entity.dart';
import 'package:flutter_app/common/https/https.dart';

class FashionPersonalViewModel {

  ProfileInfoDataUser userData;

  String get userAvatar => userData == null ? "" : userData.userAvatar;
  String get nickName => userData == null ? "" : userData.nick;
  String get userNo => userData == null ? "" : userData.userNo;
  int get sex => userData == null ? 0 : userData.sex;
  int get fansNum => userData == null ? 0 : userData.fansNum;
  int get praiseNums => userData == null ? 0 : userData.praiseNums;
  int get attentionNum => userData == null ? 0 : userData.attentionNum;

  getUserInfo({Function callback}) async {
    await Https().post(
        apiPath: APIPath.user_getUserDetail,
        onSuccess: (response) {
          ProfileInfoEntity infoEntity = ProfileInfoEntity().fromJson(response);
          this.userData = infoEntity.data.user;
          if (callback != null) {
            callback();
          }
        },onFailure: (error) {

        });
  }
}