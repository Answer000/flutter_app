import 'package:flutter/material.dart';
import 'package:flutter_app/class/profile/likes/likes_data_entity.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_app/common/extension/extension.dart';

class LikesViewModel extends ASBaseViewModel {

  LikesDataEntity dataEntity;

  List<LikesDataPastContentLists> lists = [];

  int _pageSize = 10;

  int _pageNo = 1;

  getDatas(bool isDown, Function(bool isSucc) callback) async {
    if(isDown) { _pageNo = 1; }
    await Https().post(
        apiPath: APIPath.post_praiseStatisticsList,
        params: {"pageSize" : _pageSize, "pageNo" : _pageNo},
        onSuccess: (response) {
          this._pageNo += 1;
          LikesDataEntity entity = LikesDataEntity().fromJson(response["data"]);
          this.dataEntity = entity;
          if(isDown) {
            this.lists = entity.pastContent.lists;
          }else{
            this.lists += entity.pastContent.lists;
          }
          this.loadStatus = entity.pastContent.lists.length < this._pageSize ? LoadStatus.noMore : LoadStatus.idle;
          this.sourceStatus = this.lists.isEmpty ? ASSourceStatus.empty : ASSourceStatus.hasData;
          callback(true);
        },
        onFailure: (error) {
          this.sourceStatus = ASSourceStatus.noNetwork;
          callback(false);
        }
    );
  }
}