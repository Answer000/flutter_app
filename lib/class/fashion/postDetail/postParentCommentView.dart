import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_entity.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';
import 'package:flutter_app/class/profile/personal/otherPersonal/otherPersonal.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/resource.dart';

class PostParentCommentView extends StatefulWidget {

  CommentEntity commentEntity;

  Function contentOnPress;

  PostParentCommentView({this.commentEntity, this.contentOnPress});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostParentCommentViewState();
  }
}

class PostParentCommentViewState extends State<PostParentCommentView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(this.widget.commentEntity == null){
      return Container();
    }
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30.dp,
                        height: 30.dp,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: CustomColor.mainRedColor,
                          borderRadius: BorderRadius.circular(15.dp),
                        ),
                        child: RawMaterialButton(
                          child: CustomImage.assetNetwork(
                            image: this.widget.commentEntity.comment.userAvatar,
                            size: Size(30.dp, 30.dp),
                          ),
                          onPressed: (){
                            CustomNavigator.push(
                                context: context,
                                page: OtherPersonal(this.widget.commentEntity.comment.userId)
                            );
                          },
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 6.dp),
                        height: 30.dp,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              this.widget.commentEntity.comment.nick ?? "",
                              style: TextStyle(
                                color: CustomColor.hexColor("0x2E2D2D"),
                                fontSize: 12.dpFontSize,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),

                            Text(
                              this.widget.commentEntity.comment.createTime ?? "",
                              style: TextStyle(
                                color: CustomColor.hexColor("0xB4B4B4"),
                                fontSize: 10.dpFontSize,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 4.dp),
                          child: Text(
                            this.widget.commentEntity.comment.praiseNum.setTrans() ?? "0",
                            style: TextStyle(
                              color: this.widget.commentEntity.isPraise
                                  ? CustomColor.hexColor("0xDA3F47")
                                  : CustomColor.hexColor("0xB9B9B9"),
                              fontSize: 13.dpFontSize,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),

                        Container(
                          width: 16.dp,
                          height: 16.dp,
                          margin: EdgeInsets.only(left: 5.dp),
                          child: RawMaterialButton(
                            child: CustomAssetImage.image(
                                color: this.widget.commentEntity.isPraise ? null : Colors.grey,
                                image: this.widget.commentEntity.isPraise
                                    ? ImageName.cjm_post_list_like.imagePath
                                    : ImageName.cjm_post_list_unlike.imagePath
                            ),
                            onPressed: ()=> this.widget.commentEntity.praisePost(
                                callback: ()=> this.setState(() {})
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Container(
                margin: EdgeInsets.only(left: 36.dp, top: 0.dp, right: 36.dp),
                padding: EdgeInsets.all(0),
                child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                      minimumSize: MaterialStateProperty.all(Size(0, 20.dp)),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      backgroundColor: MaterialStateProperty.resolveWith((states){
                        if(states.contains(MaterialState.pressed)){
                          return CustomColor.hexColor("0xf5f5f5");
                        }
                        return null;
                      })
                  ),
                  child: Container(
                    width: Screen.width - 36.dp - 48.dp,
                    child: Text(
                      this.widget.commentEntity.comment.content ?? "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: CustomColor.hexColor("0x2E2D2D"),
                        fontSize: 13.dpFontSize,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  onPressed: (){
                    if(this.widget.contentOnPress != null) {
                      this.widget.contentOnPress();
                    }
                  },
                )
            ),
          ],
        )
    );
  }
}