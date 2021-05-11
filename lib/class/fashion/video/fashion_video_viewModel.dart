
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/common/extension/extension.dart';

class FashionVideoViewModel {

  int _pageNo = 1;

  int _pageSize = 10;

  // 侧轴间距
  double get crossAxisSpacing => 11.dp;

  // 主轴间距
  double get mainAxisSpacing => 11.dp;

  // 列数
  int get crossAxisCount => 2;

  loadDatas(bool isDown, Function(List<PostEntity> entitys, bool hasMore) callback) async {
    if (isDown) { this._pageNo = 1; };
    await Https().post(
        apiPath: APIPath.post_videoPost,
        params: {"pageNo":_pageNo, "pageSize":_pageSize},
        onSuccess: (response){
          this._pageNo += response['data']['postList']['pageNum'] + 1;
          List<dynamic> lists = response['data']['postList']['lists'];
          List<PostEntity> entitys = lists.map((e) => PostEntity(post: PostModelEntity().fromJson(e))).toList();
          callback(entitys, lists.length >= _pageSize);
        },
        onFailure: (error){
          callback(null, false);
        });
  }
}