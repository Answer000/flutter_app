

import 'package:flutter_app/class/fashion/attention/fashion_attention_user_entity.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/https/https.dart';

class FashionAttentionViewModel {

  List<FashionAttentionUserDataPostListList> _userAttentionList = [];

  List<PostEntity> _postList = [];

  int _pageNo = 1;

  int _pageSize = 10;

  /// 请求标签数据
  loadUserAttentionList(Function(List<FashionAttentionUserDataPostListList>) callback) async {
    int userId = 0;
    await LoginUserInfoManager().userId.then((value) => userId = value);
    await
    Https().post(
        apiPath: APIPath.user_attentionList,
        params: {'pageSize' : 20, 'pageNo' : 1, 'fansId' : userId},
        onSuccess: (data){
          var entity = FashionAttentionUserEntity().fromJson(data);
          callback(entity.data.postList.lists);
        }, onFailure: (error){
        callback([]);
    });
  }

  getPosts({bool isLoadMore, Function(List<PostEntity> list, bool hasMore) callback}) async {
    Function(List<PostEntity>, bool hasMore) onSuccess = (list, hasMore) async {
      List<PostEntity> tempList = this._postList;
      isLoadMore
          ? tempList.addAll(list)
          : tempList = list;
      if(callback != null) {
        await callback(tempList, hasMore);
      }
    };

    isLoadMore
        ? _loadMorePosts(onSuccess)
        : _loadPosts(onSuccess);
  }

  /// 请求帖子列表数据
  _loadPosts(Function(List<PostEntity> postList, bool hasMore) callback) async {
    this._pageNo = 1;
    await _loadMorePosts(callback);
  }

  _loadMorePosts(Function(List<PostEntity> postList, bool hasMore) callback) async {
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