import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postDetail/commentDetail/postCommentDetail.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_entity.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/personal/otherPersonal/otherPersonal.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/resource.dart';

class PostChildCommentView extends StatefulWidget {

  CommentEntity commentEntity;

  Function(CommentModelCommentReplyCommentReplyList) contentOnPress;

  PostChildCommentView({this.commentEntity, this.contentOnPress});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostChildCommentViewState();
  }
}

class PostChildCommentViewState extends State<PostChildCommentView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(this.widget.commentEntity == null) {
      return Container();
    }
    return (this.widget.commentEntity.commentReplyList.isNotValid)
        ? Container(margin: EdgeInsets.only(bottom: this.widget.commentEntity.margin.bottom))
        : Container(
        margin: this.widget.commentEntity.margin,
        decoration: BoxDecoration(
            color: CustomColor.hexColor("0xF5F5F5"),
            borderRadius: BorderRadius.circular(5.dp)
        ),
        height: this.widget.commentEntity.subCommentTotalHeight,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            ListView.separated(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                CommentModelCommentReplyCommentReplyList childComment = this.widget.commentEntity.commentReplyList[index];
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onLongPress: (){
                    if(this.widget.contentOnPress != null) {
                      this.widget.contentOnPress(childComment);
                    }
                  },
                  child: Container(
                    padding: this.widget.commentEntity.padding,
                    height: this.widget.commentEntity.subCommentHeightList[index],
                    width: this.widget.commentEntity.subCommentMaxWidth,
                    child: RichText(
                      maxLines: 10,
                      softWrap: true,
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${childComment.userNick ?? ""}:",
                              style: TextStyle(
                                  color: CustomColor.hexColor("0xDA3F47"),
                                  fontSize: this.widget.commentEntity.subCommentFontSize,
                                  fontWeight: this.widget.commentEntity.subCommentFontWeight,
                                  decoration: TextDecoration.none
                              ),
                            ),
                            TextSpan(
                              text: "${childComment.commentContent ?? ""}",
                              style: TextStyle(
                                  color: CustomColor.hexColor("0x2E2D2D"),
                                  fontSize: this.widget.commentEntity.subCommentFontSize,
                                  fontWeight: this.widget.commentEntity.subCommentFontWeight,
                                  decoration: TextDecoration.none
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: this.widget.commentEntity.commentReplyList.length,
            ),

            Positioned(
              height: this.widget.commentEntity.showMoreCommentsTitleHeight,
              bottom: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  CustomNavigator.push(
                      context: context,
                      page: PostCommentDetail(comment: this.widget.commentEntity.comment)
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: this.widget.commentEntity.padding.left),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${this.widget.commentEntity.showMoreCommentsTitle}',
                    style: TextStyle(
                        color: CustomColor.hexColor("0xA3A3A3"),
                        fontSize: 12.dpFontSize,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}