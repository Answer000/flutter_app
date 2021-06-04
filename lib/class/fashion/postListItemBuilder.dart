

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postDetail/imagePostDetail/imagePostDetail.dart';
import 'package:flutter_app/class/fashion/postDetail/videoPostDetail/videoPostDetail.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/profile/personal/otherPersonal/otherPersonal.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/resource.dart';

class PostListItemBuilder extends StatefulWidget {

  final PostEntity postEntity;

  PostListItemBuilder({
    Key key,
    @required this.postEntity
  }) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return PostListItemBuilderState();
  }
}

class PostListItemBuilderState extends State<PostListItemBuilder> {

  EdgeInsets get _margin => EdgeInsets.only(left: 33.dp, right: 33.dp);

  int get _crossAxisCount => 3;
  double get _mainAxisSpacing => 5.dp;
  double get _crossAxisSpacing => 5.dp;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: (){
        switch(this.widget.postEntity.postType) {
          case PostType.image:
            CustomNavigator.push(
                context: context,
                page: ImagePostDetail(post: this.widget.postEntity.post)
            );
            break;
          case PostType.video:
            CustomNavigator.push(
                context: context,
                page: VideoPostDetail(post: this.widget.postEntity.post)
            );
            break;
        }
      },
      child: Container(
        margin: _margin,
        padding: EdgeInsets.only(bottom: 16.dp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60.dp,
                      height: 60.dp,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Color(0xff5f5f5f),
                        borderRadius: BorderRadius.circular(30.dp),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: CustomImage.memoryNetwork(
                          image: this.widget.postEntity.post.userAvatar,
                          size: Size(60.dp, 60.dp),
                        ),
                        onPressed: (){
                          CustomNavigator.push(
                              context: context,
                              page: OtherPersonal(this.widget.postEntity.post.userId)
                          );
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 9.dp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${this.widget.postEntity.post.nick ?? ""}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.dpFontSize,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none
                            ),
                          ),
                          Text(
                            '${this.widget.postEntity.post.createTime ?? ""}',
                            style: TextStyle(
                                color: Color(0xffb4b4b4),
                                fontSize: 10.dpFontSize,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

                GestureDetector(
                  child: Container(
                      width: 10.dp,
                      height: 20.dp,
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 4,
                        child: CustomAssetImage.image(
                          image: ImageName.cjm_fashion_item_menu.imagePath,
                        ),
                      )
                  ),
                  onTap: () {

                  },
                )
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 10.dp),
              child: Text(
                '${this.widget.postEntity.content ?? ""}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 12.dpFontSize,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none
                ),
              ),
            ),

            Container(
                margin: EdgeInsets.only(top: 8.dp),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(this.widget.postEntity.postType == PostType.image ? 5.dp : 0),
                ),
                child: _getImageContainer()
            ),

            Container(
              margin: EdgeInsets.only(top: 15.dp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20.dp,
                    height: 20.dp,
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      child: CustomAssetImage.image(
                          image: this.widget.postEntity.isPraise
                              ? ImageName.cjm_post_list_like.imagePath
                              : ImageName.cjm_post_list_unlike.imagePath
                      ),
                      onPressed: (){
                        this.widget.postEntity.praisePost(callback: (isSucc, postEntity){
                          setState(() {});
                        });
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 5.dp),
                    child: Text(
                      '${this.widget.postEntity.post.praiseNum ?? 0}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.dp,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none
                      ),
                    ),
                  ),

                  Container(
                    width: 20.dp,
                    height: 20.dp,
                    margin: EdgeInsets.only(left: 30.dp),
                    child: CustomAssetImage.image(
                        image: ImageName.cjm_post_list_comment.imagePath
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 5.dp),
                    child: Text(
                      '${this.widget.postEntity.post.commentNum ?? 0}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.dp,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Color(0xfffefefe).withOpacity(0.1),
              margin: EdgeInsets.only(top: 20.dp, left: 25.dp, right: 25.dp),
              height: 0.5,
            )
          ],
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    switch(this.widget.postEntity.postType) {
      case PostType.image:
        if (this.widget.postEntity.post.postImgList.isNotValid) {
          return Container();
        }
        int imgCount = this.widget.postEntity.post.postImgList.length;
        Size containerSize = _getImageContainerSize();
        return imgCount == 1 ?
        Container(
          color: Color(0xff424242),
          width: containerSize.width,
          height: containerSize.height,
          child: CustomImage.memoryNetwork(
            image: this.widget.postEntity.picUrl,
          )
        ) :
        Container(
          width: containerSize.width,
          height: containerSize.height,
          child: GridView.builder(
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                mainAxisSpacing: _mainAxisSpacing,
                crossAxisSpacing: _crossAxisSpacing
            ),
            itemBuilder: (BuildContext context, int index){
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Color(0xff424242),
                  borderRadius: BorderRadius.circular(3.dp),
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: CustomImage.memoryNetwork(
                    image: this.widget.postEntity.post.postImgList[index].picUrl,
                    size: containerSize,
                  ),
                  onPressed: (){
                    print("${this.widget.postEntity.post.postImgList[index].picUrl}");
                  },
                )
              );
            },itemCount: this.widget.postEntity.post.postImgList.length,
          ),
        );

      case PostType.video:
        Size imgSize = _getImageContainerSize();
        return Container(
          width: imgSize.width,
          height: imgSize.height,
          color: Color(0xff424242),
          child: Stack(
            children: [
              Positioned(
                width: imgSize.width,
                height: imgSize.height,
                child: CustomImage.memoryNetwork(
                  image: this.widget.postEntity.picUrl,
                ),
              ),

              Positioned(
                child: Center(
                  child: FlatButton(
                    child: CustomAssetImage.image(
                        image: ImageName.cjm_post_play.imagePath
                    ),
                  ),
                ),
              )
            ],
          )
        );
      default: return Container();
    }
  }

  Size _getImageContainerSize() {
    switch(this.widget.postEntity.postType) {
      case PostType.image:
        int imgCount = this.widget.postEntity.post.postImgList.length;
        if(imgCount == 1) {
          return this.widget.postEntity.getImageSizeWith();
        }else{
          double containerW = Screen.width - _margin.left - _margin.right;
          double itemW = (containerW - (_crossAxisCount - 1) * _crossAxisSpacing) / _crossAxisCount;
          int itemLine = (imgCount / _crossAxisCount).floor() + (imgCount % _crossAxisCount == 0 ? 0 : 1);
          double containerH = (itemLine * itemW) + (itemLine - 1) * _mainAxisSpacing;
          return Size(containerW, containerH);
        }
        break;
      case PostType.video:
        return this.widget.postEntity.getImageSizeWith();
      default: return Size.zero;
    }
  }
}