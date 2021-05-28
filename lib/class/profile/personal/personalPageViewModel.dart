import 'package:flutter/cupertino.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PersonalPageViewModel extends ASBaseViewModel {

  int type;
  int userId;
  PersonalPageViewModel({this.type, this.userId});

  int _pageSize = 10;
  int _pageNo = 1;
  List<PostEntity> items = [];

  loadDatas({@required bool isDown, Function callback}) async{
    _pageNo = isDown ? 1 : (_pageNo + 1);
    // int userId = 0;
    // await LoginUserInfoManager().userId.then((value) => userId = value);
    await Https().post(
        apiPath: APIPath.post_othersPublishPost,
        params: {
          'pageNo' : _pageNo,
          'pageSize': _pageSize,
          'othersUserId' : "$userId",
          "type" : type
        },
        onSuccess: (response) {
          List<dynamic> lists = response['data']['postList']['lists'];
          List<PostEntity> entitys = lists.map((e) =>
              PostEntity(
                  post: PostModelEntity().fromJson(e),
                  postStyle: PostStyle.list
              )
          ).toList();
          if (isDown) {
            this.items = entitys;
          }else{
            this.items.addAll(entitys);
            this.loadStatus = entitys.length >= this._pageSize ? LoadStatus.idle : LoadStatus.noMore;
          }
          this.sourceStatus = this.items.length > 0 ? ASSourceStatus.hasData : ASSourceStatus.empty;

          if (callback != null) { callback(); }
        },
        onFailure: (error){
          this.sourceStatus = ASSourceStatus.noNetwork;
          if (callback != null) { callback(); }
        }
    );
  }
}