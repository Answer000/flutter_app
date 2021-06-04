
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
    this._commentReplyList = comment.commentReply.commentReplyList;
    this._subCommentHeightList = this._commentReplyList.map((e){
      double height = (e.userNick + e.commentContent).calculateTextHeight(
          this.subCommentFontSize,
          this.subCommentFontWeight,
          this.subCommentMaxWidth,
          10
      ) + 10.dp;
      _subCommentTotalHeight += height;
      return height;
    }).toList();
  }

  /// 二级评论模型数组
  List<CommentModelCommentReplyCommentReplyList>  _commentReplyList = [];
  List<CommentModelCommentReplyCommentReplyList> get commentReplyList => _commentReplyList;

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
  double get subCommentTotalHeight => _subCommentTotalHeight;

  /// 二级评论fontsize
  double get subCommentFontSize => 12.dpFontSize;

  /// 二级评论fontweight
  FontWeight get subCommentFontWeight => FontWeight.normal;

  /// 二级评论最大宽度
  double get subCommentMaxWidth => Screen.width - margin.left - margin.right - padding.left - padding.right;

  /// 二级评论容器组件内边距
  EdgeInsets get padding => EdgeInsets.only(top: 5.dp, left: 8.dp, right: 8.dp, bottom: 5.dp);

  /// 二级评论容器组件外边距
  EdgeInsets get margin => EdgeInsets.only(top: 11.dp, left: 35.dp, right: 35.dp, bottom: 8.dp);

  /// 是否正在执行点赞请求
  bool _isPraisePost = false;
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
    CustomLoading.showLoading();
    await Https().post(
        apiPath: APIPath.commentPraise_isUserraise,
        params: {'commentId' : this.comment.id, 'type' : this.isPraise ? '1' : '0'},
        onSuccess: (response) {
          bool isSucc = response['resultCode'] == '0000';
          if(isSucc) {
            if(this.isPraise) {
              isPraise = false;
              CustomToast.show('已取消点赞');
            }else{
              isPraise = true;
              CustomToast.show('点赞成功');
            }
          }else{
            CustomToast.show('${response['msg'].toString()}');
          }
          _isPraisePost = false;
          CustomLoading.hideLoading();
          if (callback != null) { callback(); }
        },
        onFailure: (error) {
          _isPraisePost = false;
          CustomLoading.hideLoading();
          if (callback != null) { callback(); }
        }
    );
  }
}