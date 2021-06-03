import 'package:flutter_app/class/fashion/postDetail/comment_entity.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostDetailViewModel extends ASBaseViewModel {


  final int postId;
  PostDetailViewModel({this.postId});

  List<CommentEntity> entitys = [];
  int _pageSize = 10;
  int _pageNo = 1;

  getCommentList({bool isDown, Function callback}) async {
    _pageNo = isDown ? 1 : (_pageNo + 1);
    await Https().post(
      apiPath: APIPath.comment_commentList,
      params: {"pageSize" : _pageSize, "pageNo" : _pageNo, "postId" : this.postId},
      onSuccess: (response) {
        List<dynamic> lists = response["data"]["postList"]["lists"];
        List<CommentEntity> datas = lists.map((e){
          return CommentEntity(comment: CommentModelEntity().fromJson(e));
        }).toList();
        if(isDown) {
          this.entitys = datas;
        }else{
          this.entitys += datas;
        }
        this.loadStatus = (datas.length < _pageSize ? LoadStatus.noMore : LoadStatus.idle);
        this.sourceStatus = (this.entitys.length == 0 ? ASSourceStatus.empty : ASSourceStatus.hasData);
        if(callback != null) { callback(); }
      },
      onFailure: (error) {
        this.sourceStatus = ASSourceStatus.noNetwork;
        if(callback != null) { callback(); }
      }
    );
  }
}