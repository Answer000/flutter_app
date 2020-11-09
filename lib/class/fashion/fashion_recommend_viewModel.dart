import 'package:flutter_app/class/fashion/fashion_recommend_post_entity.dart';
import 'package:flutter_app/class/fashion/fashion_recommend_tagList_entity.dart';
import 'package:flutter_app/common/base/base_post_entity.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter/material.dart';

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

  /// 请求标签数据
  loadTagList(Function(List<FashionRecommandTagListDataPostTagsLists>) callback) async {
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
  loadPostList(int postTagId, Function(List<PostEntity>) callback) async {
    await
    Https().post(
        apiPath: APIPath.post_newList,
        params: {'pageSize' : 10, 'pageNo' : _pageNo, 'postTagId' : postTagId ?? 0},
        onSuccess: (data){
          var entity = FashionRecommendPostEntity()
              .fromJson(data)
              .data.postList.lists
              .map((e) => PostEntity(post: e))
              .toList();
          callback(entity);
        }, onFailure: (error){
      callback([]);
    });
  }
}