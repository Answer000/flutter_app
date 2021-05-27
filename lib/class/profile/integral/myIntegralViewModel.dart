
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/class/profile/integral/myIntegral_data_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/https/https.dart';

class MyIntegralViewModel extends ASBaseViewModel {

  double get headerViewHeight => 254.dp;

  List<MyIntegralDataDataMissionList> list = [];

  getMissionStatus(Function callback) async {
    await Https().post(
      apiPath: APIPath.integral_missionStatus,
      onSuccess: (response) {
        MyIntegralDataEntity entity = MyIntegralDataEntity().fromJson(response);
        this.list = entity.data.missionList;
        callback();
      },
      onFailure: (error) {

      }
    );
  }

  RichText setDesc(MyIntegralDataDataMissionList entity) {
    String text = '';
    switch(entity.type) {
      case 0: text = "赠送"; break;
      case 6: text = "连续签到得到的积分更多哦"; break;
      default:  text = "单次赠送"; break;
    }
    return text.setRich(
      TextStyle(
          color: CustomColor.hexColor("0x999999"),
          fontSize: 12.dp,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none
      ),
      textSpans: [
        TextSpan(
          text: " +${entity.maxIntegral}积分",
          style: TextStyle(
              color: CustomColor.hexColor("0xAACCCB"),
              fontSize: 12.dp,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none
          ),
        )
      ]
    );
  }
}