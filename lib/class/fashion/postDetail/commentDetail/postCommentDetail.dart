
import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_entity.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/extension/extension.dart';

class PostCommentDetail extends BaseContainer {

  CommentModelEntity comment;

  PostCommentDetail({this.comment});
  
  @override
  // TODO: implement isShowBackground
  bool get isShowBackground => false;
  
  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return PostCommentDetailState();
  }
}

class PostCommentDetailState extends BaseContainerState<PostCommentDetail> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "评论详情";
  }
  
  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Container(
      color: CustomColor.hexColor("0xf5f5f5"),
    );
  }
}