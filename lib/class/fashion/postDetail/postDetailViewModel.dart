import 'package:flutter/cupertino.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_entity.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/common/tools/custom_loading.dart';
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
      }, onSuccessOfOthers: (response){
        this.loadStatus = LoadStatus.idle;
        this.sourceStatus = (this.entitys.length == 0 ? ASSourceStatus.empty : ASSourceStatus.hasData);
        if(callback != null) { callback(); }
      }, onFailure: (error) {
        this.sourceStatus = ASSourceStatus.noNetwork;
        if(callback != null) { callback(); }
      }
    );
  }

  /// 占位文字
  String hintText = '请输入您的评论...';

  /// 评论内容
  String content = '';

  /// 发送子评论时需传的子评论模型
  CommentEntity commentEntity;

  /// 发送评论
  addPostComment(
      BuildContext context,
      Function callback
      ) async {
    if(content.isNotValid) {
      CustomToast.show("评论内容不能为空");
      return;
    }
    String nick = "";
    await LoginUserInfoManager().nickValue.then((value) => nick = value);

    /// commentEntity == null 父评论，反之子评论
    Map<String,dynamic> params = this.commentEntity == null ?
    {
      "postId" : this.postId,
      "selfLevel" : 1,
      "content" : content ?? "",
    } : {
      "postId" : this.postId,
      "level" : "1",
      "selfLevel" : "2",
      "beCommentId" : "${commentEntity.comment.id ?? 0}",
      "beCommentUserId" : "${commentEntity.comment.userId ?? 0}",
      "beCommentContent" : commentEntity.comment.content ?? "",
      "beCommentUserNick" : commentEntity.comment.nick ?? "",
      /// 如果是子评论 则要赋值这个
      "commentContent" : content ?? "",
      "parentCommentId" : "${commentEntity.comment.id ?? 0}",
      "userNick" : nick ?? "",
      "content" : content ?? "",
    };
    await Https().post(
        apiPath: APIPath.comment_addPostComment,
        params: params,
        onSuccess: (response) {
          Map<String,dynamic> data = response["data"];
          if(data['comment'] != null) {
            /// 父评论
            CommentEntity comment = CommentEntity(
                comment: CommentModelEntity().fromJson(data["comment"])
            );
            List<CommentEntity> entitys = this.entitys;
            entitys.insert(0, comment);
            this.entitys = entitys;
          }else if(data['commentReply'] != null) {
            /// 子评论
            CommentModelCommentReplyCommentReplyList replyComment = CommentModelCommentReplyCommentReplyList().fromJson(data["commentReply"]);
            List<CommentModelCommentReplyCommentReplyList> commentReplyList = this.entitys[commentEntity.index].commentReplyList;
            commentReplyList.insert(0, replyComment);
            this.entitys[commentEntity.index].commentReplyList = commentReplyList;
          }
          CustomToast.show("评论成功");
          callback();
        },
        onSuccessOfOthers: (response) {
          CustomToast.show(response["msg"].toString());
          callback();
        },
        onFailure: (error) {
          CustomToast.show("网络错误");
          callback();
        }
    );
  }
}