import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/class/fashion/recommend/fashion_recommend_tagList_entity.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/tools/custom_loading.dart';

class FashionRecommendViewModel {

  // 内边距
  EdgeInsets get itemPadding => EdgeInsets.only(left: 12.dp, right: 12.dp);

  // 侧轴间距
  double get crossAxisSpacing => 11.dp;

  // 主轴间距
  double get mainAxisSpacing => 11.dp;

  // 列数
  int get crossAxisCount => 2;

  // item宽度
  double get itemWidth => (Screen.width - itemPadding.left - itemPadding.right - crossAxisSpacing) / crossAxisCount.toDouble();

  int _pageNo = 1;

  int _pageSize = 10;

  /// 请求标签数据
  loadTagList(Function(List<FashionRecommendTagListDataPostTagsLists>) callback) async {
    await
    Https().post(
        apiPath: APIPath.postTag_list,
        params: {'pageSize' : 30, 'pageNo' : 1},
        onSuccess: (data){
          var entity = FashionRecommendTagListEntity().fromJson(data);
          callback(entity.data.postTags.lists);
        }, onFailure: (error){
          callback([]);
        });
  }

  /// 请求帖子列表数据
  loadPosts(int postTagId, Function(List<PostEntity>, bool hasMore) callback) async {
    this._pageNo = 1;
    await loadMorePosts(postTagId, callback);
  }

  loadMorePosts(int postTagId, Function(List<PostEntity>, bool hasMore) callback) async {
    await Https().post(
        apiPath: APIPath.post_newList,
        params: {'pageSize' : _pageSize, 'pageNo' : _pageNo, 'postTagId' : postTagId},
        onSuccess: (data){
          this._pageNo += 1;
          List<dynamic> list = data['data']['postList']['lists'];
          List<PostEntity> entitys = list.map((e) => PostEntity(post: PostModelEntity().fromJson(e))).toList();
          callback(entitys, list.length >= _pageSize);
        }, onFailure: (error){
          callback([], false);
    });
  }
}