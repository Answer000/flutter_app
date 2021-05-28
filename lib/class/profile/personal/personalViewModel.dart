import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/personal/otherPersonal/otherPersonal_info_entity.dart';
import 'package:flutter_app/class/profile/profile_info_entity.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/common/extension/extension.dart';

class PersonalViewModel {

  int userId;

  PersonalViewModel({this.userId});

  OtherPersonalInfoData userData;

  bool isSelf() {
    bool isSelf = false;
    LoginUserInfoManager().userId.then((userId){
      isSelf = (this.userId == userId && userId.isValid);
    });
    return isSelf;
  }

  getUserInfo({Function callback}) async {
    await Https().post(
        apiPath: APIPath.user_ohtersUserInfo,
        params: {'othersUserId': this.userId},
        onSuccess: (response) {
          OtherPersonalInfoEntity infoEntity = OtherPersonalInfoEntity().fromJson(response);
          this.userData = infoEntity.data;
          if (callback != null) {
            callback();
          }
        }, onFailure: (error) {});
  }
}