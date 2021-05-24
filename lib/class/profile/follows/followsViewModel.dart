import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/follows/follows_data_entity.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FollowsViewModel extends ASBaseViewModel {

  List<FollowsDataPostListLists> lists = [];

  int _pageSize = 10;

  int _pageNo = 1;

  getDatas(bool isDown, Function(bool isSucc) callback) async {
    if(isDown) { _pageNo = 1; }
    await Https().post(
        apiPath: APIPath.user_attentionList,
        params: {"pageSize" : _pageSize, "pageNo" : _pageNo},
        onSuccess: (response) {
          this._pageNo += 1;
          FollowsDataEntity entity = FollowsDataEntity().fromJson(response["data"]);
          if(isDown) {
            this.lists = entity.postList.lists;
          }else{
            this.lists += entity.postList.lists;
          }
          this.loadStatus = entity.postList.lists.length < this._pageSize ? LoadStatus.noMore : LoadStatus.idle;
          this.sourceStatus = this.lists.isEmpty ? ASSourceStatus.empty : ASSourceStatus.hasData;
          callback(true);
        },
        onFailure: (error) {
          this.sourceStatus = ASSourceStatus.noNetwork;
          callback(false);
        }
    );
  }

  isFollow(FollowsDataPostListLists entity, Function callback) async {
    bool isFollow = (entity.attentionUser == "1" ? false : true);
    await entity.id.isFollow(isFollow, (){
      entity.attentionUser = isFollow ? "1" : "2";
      callback();
    });
  }
}