import 'package:flutter_app/class/profile/integral/detail/myIntegral_detail_data_entity.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

class MyIntegralDetailViewModel extends ASBaseViewModel {

  List<MyIntegralDetailDataDataIntegralListLists> list = [];
  int _pageSize = 10;
  int _pageNo = 1;

  loadDatas(bool isDown, Function callback) async {
    _pageNo = isDown ? 1 : (_pageNo + 1);
    await Https().post(
      apiPath: APIPath.integral_integralList,
      params: {"pageSize" : this._pageSize, "pageNo" : _pageNo},
      onSuccess: (response) {
        MyIntegralDetailDataEntity entity = MyIntegralDetailDataEntity().fromJson(response);
        if(isDown) {
          this.list = entity.data.integralList.lists;
        }else{
          this.list += entity.data.integralList.lists;
        }
        this.sourceStatus = this.list.isValid ? ASSourceStatus.hasData : ASSourceStatus.empty;
        this.loadStatus = entity.data.integralList.lists.length < this._pageSize ? LoadStatus.noMore : LoadStatus.idle;
        callback();
      },
      onFailure: (error) {
        this.sourceStatus = ASSourceStatus.noNetwork;
        this.loadStatus = LoadStatus.idle;
        callback();
      }
    );
  }

  RichText setDesc(MyIntegralDetailDataDataIntegralListLists entity) {
    String text = '';
    String integralText = '';
    if(entity.integral < 0) {
      integralText = " -${entity.integral.abs()}积分";
      text = entity.type == 0 ? "扣除" : "单次扣除";
    }else{
      integralText = " +${entity.integral.abs()}积分";
      text = entity.type == 0 ? "赠送" : "单次赠送";
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
            text: integralText,
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