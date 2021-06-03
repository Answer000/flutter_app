
import 'package:flutter/material.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';

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

  bool _isPraise = false;
  bool get isPraise => _isPraise;

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
}