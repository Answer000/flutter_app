

import 'package:flutter_app/class/fashion/attention/fashion_attention_user_entity.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/https/https.dart';

class FashionAttentionViewModel {

  int _pageNo = 1;

  int _pageSize = 10;

  /// 请求标签数据
  loadUserAttentionList(Function(List<FashionAttentionUserDataPostListList>) callback) async {
    // int userId = 0;
    // await LoginUserInfoManager().userId.then((value) => userId = value);
    await
    Https().post(
        apiPath: APIPath.user_attentionList,
        params: {'pageSize' : 20, 'pageNo' : 1, 'fansId' : LoginUserInfoManager().userId},
        onSuccess: (data){
          var entity = FashionAttentionUserEntity().fromJson(data);
          callback(entity.data.postList.lists);
        }, onFailure: (error){
        callback([]);
    });
  }



  /// 请求帖子列表数据
  loadPosts(Function(List<PostEntity> postList, bool hasMore) callback) async {
    this._pageNo = 1;
    await loadMorePosts(callback);
  }

  loadMorePosts(Function(List<PostEntity> postList, bool hasMore) callback) async {
    await Https().post(
        apiPath: APIPath.post_attentionList,
        params: {'pageSize' : _pageSize, 'pageNo' : _pageNo},
        onSuccess: (data){
          this._pageNo += 1;
          List<dynamic> list = data['data']['postList']['lists'];
          List<PostEntity> entityList = list.map((e) =>
              PostEntity(
                  post: PostModelEntity().fromJson(e),
                  postStyle: PostStyle.list
              )
          ).toList();
          callback(entityList, list.length >= _pageSize);
        }, onFailure: (error){
      callback([], false);
    });
  }
}