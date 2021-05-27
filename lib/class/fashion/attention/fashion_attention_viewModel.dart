import 'package:flutter_app/class/fashion/attention/fashion_attention_user_entity.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FashionAttentionViewModel extends ASBaseViewModel {

  List<FashionAttentionUserDataPostListList> userAttentionList = [];
  List<PostEntity> entityList = [];

  int _pageNo = 1;
  int _pageSize = 10;

  /// 请求标签数据
  loadUserAttentionList(Function() callback) async {
    int userId;
    await LoginUserInfoManager().userId.then((value){
      userId = value;
    });
    await Https().post(
        apiPath: APIPath.user_attentionList,
        params: {'pageSize' : 20, 'pageNo' : 1, 'fansId' : userId},
        onSuccess: (data){
          var entity = FashionAttentionUserEntity().fromJson(data);
          this.userAttentionList = entity.data.postList.lists;
          callback();
        },
        onFailure: (error){
          callback();
        });
  }

  /// 请求帖子列表数据
  loadPosts(bool isDown, Function() callback) async {
    this._pageNo = isDown ? 1 : (this._pageNo + 1);
    await Https().post(
        apiPath: APIPath.post_attentionList,
        params: {'pageSize' : _pageSize, 'pageNo' : _pageNo},
        onSuccess: (data){
          List<dynamic> list = data['data']['postList']['lists'];
          List<PostEntity> entityList = list.map((e) =>
              PostEntity(
                  post: PostModelEntity().fromJson(e),
                  postStyle: PostStyle.list
              )
          ).toList();
          if(isDown) {
            this.entityList = entityList;
          }else{
            this.entityList += entityList;
          }
          this.sourceStatus = entityList.length == 0 ? ASSourceStatus.empty : ASSourceStatus.hasData;
          this.loadStatus = entityList.length < this._pageSize ? LoadStatus.noMore : LoadStatus.idle;
          callback();
        },
        onFailure: (error){
          this.sourceStatus = ASSourceStatus.noNetwork;
          this.loadStatus = LoadStatus.idle;
          callback();
        });
  }
}