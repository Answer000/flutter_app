
import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/common/tools/custom_loading.dart';

class CommentEntity {

  CommentModelEntity _comment;
  CommentModelEntity get comment => _comment;

  CommentEntity({
    CommentModelEntity comment,
  }) {
    this._comment = comment;
    if(comment.commentReply != null) {
      this.commentReplyList = comment.commentReply.commentReplyList;
    }
  }

  /// 二级评论模型数组
  set commentReplyList(List<CommentModelCommentReplyCommentReplyList> value) {
    if(value.isNotValid) { return; }
    _subCommentTotalHeight = 0;
    _subCommentHeightList = [];
    _subCommentHeightList = this.commentReplyList.map((e){
      double height = (e.userNick + e.commentContent).calculateTextHeight(
          this.subCommentFontSize,
          this.subCommentFontWeight,
          this.subCommentMaxWidth,
          10
      ) + padding.top + padding.bottom;
      _subCommentTotalHeight += height;
      return height;
    }).toList();
    _showMoreCommentsTitleHeight = showMoreCommentsTitle.calculateTextHeight(
        this.subCommentFontSize,
        this.subCommentFontWeight,
        this.subCommentMaxWidth,
        10
    ) + padding.top + padding.bottom;
    _subCommentTotalHeight += showMoreCommentsTitleHeight;
  }
  List<CommentModelCommentReplyCommentReplyList> get commentReplyList {
    if(comment.commentReply != null && comment.commentReply.commentReplyList != null) {
      return comment.commentReply.commentReplyList;
    }
    return [];
  }

  /// 一级评论ID
  int get commentId => this.comment.id;

  bool get isPraise => this._comment.isPraise == 1 ? true : false;
  set isPraise(bool value) {
    if(value) {
      this._comment.isPraise = 1;
      this._comment.praiseNum += 1;
    }else{
      this._comment.isPraise = 2;
      this._comment.praiseNum -= 1;
    }
  }

  /// 二级评论高度数组
  List<double> _subCommentHeightList = [];
  List<double> get subCommentHeightList => _subCommentHeightList;

  /// 二级评轮容器组件总高度
  double _subCommentTotalHeight = 0;
  set subCommentTotalHeight(double value) {
    _subCommentTotalHeight = value;
  }
  double get subCommentTotalHeight {
    if(_subCommentTotalHeight == 0) {
      _subCommentHeightList.forEach((element) {
        _subCommentTotalHeight += element;
      });
      _subCommentTotalHeight += showMoreCommentsTitleHeight;
    }
    return _subCommentTotalHeight;
  }

  /// 是否显示更多子评论
  bool get isShowMoreComments => comment.commentReply.total > commentReplyList.length;

  /// 是否显示更多子评论-标题
  String get showMoreCommentsTitle => "查看所有 ${comment.commentReply.total ?? 0} 条回复";

  double _showMoreCommentsTitleHeight = 0;
  double get showMoreCommentsTitleHeight => (isShowMoreComments ? _showMoreCommentsTitleHeight : 0);

  /// 二级评论fontsize
  double get subCommentFontSize => 12.dpFontSize;

  /// 二级评论fontweight
  FontWeight get subCommentFontWeight => FontWeight.normal;

  /// 二级评论最大宽度
  double get subCommentMaxWidth => Screen.width - margin.left - margin.right - padding.left - padding.right;

  /// 二级评论容器组件内边距
  EdgeInsets get padding => EdgeInsets.only(top: 5.dp, left: 8.dp, right: 8.dp, bottom: 5.dp);

  /// 二级评论容器组件外边距
  EdgeInsets get margin => EdgeInsets.only(left: 23.dp, right: 23.dp, bottom: 8.dp);

  /// 是否正在执行点赞请求
  bool _isPraisePost = false;

  /// 在列表中的序号值
  int index;
}

/// 点赞
extension CommentEntityPraise on CommentEntity {
  praisePost({Function callback}) async{
    bool isNeedsLogin = false;
    await CustomNavigator.isNeedsToLogin(
        context: LoginUserInfoManager.appContext).then((value) => isNeedsLogin = value
    );
    if(isNeedsLogin) { return; }

    if(_isPraisePost) {
      if (callback != null) { callback(); }
      return;
    }
    _isPraisePost = true;
    await Https().post(
        apiPath: APIPath.commentPraise_isUserraise,
        params: {'commentId' : this.comment.id, 'type' : this.isPraise ? '1' : '0'},
        onSuccess: (response) {
          if(this.isPraise) {
            isPraise = false;
            CustomToast.show('已取消点赞');
          }else{
            isPraise = true;
            CustomToast.show('点赞成功');
          }
          _isPraisePost = false;
          if (callback != null) { callback(); }
        },
        onSuccessOfOthers: (response){
          CustomToast.show('${response['msg'].toString()}');
          _isPraisePost = false;
          if (callback != null) { callback(); }
        },
        onFailure: (error) {
          _isPraisePost = false;
          if (callback != null) { callback(); }
        }
    );
  }
}

/// 删除父评论
extension CommentEntityDelete on CommentEntity {
  deleteParentComment(Function(bool isSucc) callback) async{
    await Https().post(
        apiPath: APIPath.comment_deletePostComment,
        params: {"commentId" : commentId},
        onSuccess: (response) {
          callback(true);
        },
        onSuccessOfOthers: (response){
          CustomToast.show(response["msg"].toString());
          callback(false);
        },
        onFailure: (error) {
          CustomToast.show("网络错误");
          callback(false);
        }
    );
  }
}

/// 删除子评论
extension ReplyCommentEntity on CommentModelCommentReplyCommentReplyList {
  deleteChildComment(Function(bool isSucc) callback) async{
    await Https().post(
        apiPath: APIPath.comment_deletePostComment2,
        params: {"commentId" : id},
        onSuccess: (response) {
          callback(true);
        },
        onSuccessOfOthers: (response){
          CustomToast.show(response["msg"].toString());
          callback(false);
        },
        onFailure: (error) {
          CustomToast.show("网络错误");
          callback(false);
        }
    );
  }
}