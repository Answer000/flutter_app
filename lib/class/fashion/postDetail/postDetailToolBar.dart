import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/class/profile/personal/otherPersonal/otherPersonal.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/resource.dart';

class PostDetailToolBar extends StatefulWidget {

  final PostModelEntity post;
  final Function commentItemCallback;
  PostDetailToolBar(this.post, this.commentItemCallback) {
    _postEntity = PostEntity(post: this.post);
  }

  PostEntity _postEntity;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostDetailToolBarState();
  }
}

class PostDetailToolBarState extends State<PostDetailToolBar> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: CustomColor.mainRedColor,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(left: 24.dp, right: 24.dp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 36.dp,
                            height: 36.dp,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.dp)
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              child: CustomImage.assetNetwork(
                                  image: this.widget.post.userAvatar,
                                  size: Size(36.dp, 36.dp)
                              ),
                              onPressed: ()=> CustomNavigator.push(
                                  context: context,
                                  page: OtherPersonal(this.widget.post.userId)
                              ),
                            ),
                          ),

                          Container(
                            width: 70.dp,
                            height: 24.dp,
                            margin: EdgeInsets.only(left: 8.dp),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.dp)
                            ),
                            child: FlatButton(
                                padding: EdgeInsets.all(0),
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Center(
                                  child: Text(
                                    this.widget._postEntity.isFollow ? "已关注" : "+ 关注",
                                    style: TextStyle(
                                        color: CustomColor.hexColor("0xDA3F47"),
                                        fontSize: 12.dpFontSize,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none
                                    ),
                                  ),
                                ),
                              onPressed: ()=> this.widget._postEntity.followPost(
                                  callback: ()=> this.setState(() {})
                              ),
                            ),
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _createItem(
                              this.widget._postEntity.isPraise
                                  ? ImageName.cjm_post_detail_praise_select
                                  : ImageName.cjm_post_detail_praise_normal,
                              "${this.widget._postEntity.post.praiseNum ?? 0}",
                              ()=> this.widget._postEntity.praisePost(callback: ()=> this.setState(() {}))
                          ),

                          Padding(padding: EdgeInsets.only(left: 20.dp)),

                          _createItem(
                              ImageName.cjm_post_detail_comment,
                              "${this.widget.post.commentNum ?? 0}",
                              ()=> this.widget.commentItemCallback(),
                          ),

                          Padding(padding: EdgeInsets.only(left: 20.dp)),

                          _createItem(
                              this.widget._postEntity.isCollect
                                  ? ImageName.cjm_post_detail_collect_select
                                  : ImageName.cjm_post_detail_collect_normal,
                              "${this.widget.post.collectionNum ?? 0}",
                              ()=> this.widget._postEntity.collectPost(callback: ()=> this.setState(() {}))
                          )
                        ],
                      )
                    ],
                  )
              ),
            ),

            Container(
              height: Screen.bottomBarHeight,
            ),
          ],
        )
    );
  }

  Widget _createItem(ImageName imageName, String title, Function callback) {
    return Container(
      width: 40.dp,
      height: 40.dp,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: CustomColor.hexColor("0x000000", alpha: 0.1),
          borderRadius: BorderRadius.circular(20.dp)
      ),
      child: FlatButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: CustomAssetImage.image(
                  image: imageName.imagePath
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3.dp),
              child: Text(
                "$title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.dpFontSize,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none
                ),
              ),
            )
          ],
        ),
        onPressed: ()=> callback(),
      ),
    );
  }
}