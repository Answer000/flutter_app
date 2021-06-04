

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postDetail/PostGoodsScrollView.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';

// ignore: must_be_immutable
class ImagePostDetailHeaderView extends StatefulWidget {

  PostModelEntity post;
  List<ImagePostBannerModel> _bannerModels = [];
  ImagePostDetailHeaderView({this.post}) {
    if(this.post != null) {
      this.post.postImgList.forEach((element) {
        ImagePostBannerModel model = ImagePostBannerModel(element);
        this._bannerModels.add(model);
      });
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImagePostDetailHeaderViewState();
  }
}

class ImagePostDetailHeaderViewState extends State<ImagePostDetailHeaderView> {

  PageController _pageController;

  double _viewHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewHeight = this.widget._bannerModels.first.imageH;
    _pageController = PageController()
      ..addListener(() {

      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(this.widget.post == null) {
      return Container();
    }
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: _viewHeight,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: _createBanners(),
              onPageChanged: (index) {
                this.setState(() {
                  this._viewHeight = this.widget._bannerModels[index].imageH;
                });
              },
            ),
          ),

          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 12.dp, top: 13.dp, right: 12.dp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.dp,
                      height: 40.dp,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.dp)
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: CustomImage.assetNetwork(
                            image: this.widget.post.userAvatar,
                            size: Size(40.dp, 40.dp)
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 11.dp),
                      child: Text(
                        this.widget.post.nick,
                        style: TextStyle(
                          color: CustomColor.hexColor("0x434343"),
                          fontSize: 15.dpFontSize,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none
                        ),
                      ),
                    ),
                  ],
                ),

                (this.widget.post.title == null || this.widget.post.title.length == 0)
                    ? Container()
                    : Container(
                  margin: EdgeInsets.only(top: 22.dp),
                  child: Text(
                    this.widget.post.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),

                (this.widget.post.postGoods == null || this.widget.post.postGoods.length == 0)
                    ? Container()
                    : Container(
                    margin: EdgeInsets.only(top: 19.dp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "超级好物推荐",
                          style: TextStyle(
                              color: CustomColor.hexColor("0x2c2c2c"),
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.dp),
                          child: PostGoodsScrollView(this.widget.post.postGoods),
                        )
                      ],
                    )
                ),

                (this.widget.post.content == null || this.widget.post.content.length == 0)
                    ? Container()
                    : Container(
                  margin: EdgeInsets.only(top: 6.dp),
                  child: Text(
                    this.widget.post.content,
                    style: TextStyle(
                      color: CustomColor.hexColor("0x4D606F"),
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 21.dp),
                  child: Text(
                    this.widget.post.createTime,
                    style: TextStyle(
                      color: CustomColor.hexColor("0xB4B4B4"),
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                
                Container(
                  color: CustomColor.hexColor("0x979797"),
                  height: 1,
                  margin: EdgeInsets.only(top: 8.dp),
                ),

                Container(
                  margin: EdgeInsets.only(left:11.dp, top: 18.dp, bottom: 11.dp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: CustomColor.hexColor("0xDA3F47"),
                        width: 5.dp,
                        height: 10.dp,
                      ),
                      Container(
                        margin: EdgeInsets.only(left:4.dp),
                        child: Text(
                          "共有${this.widget.post.commentNum ?? 0}条评论",
                          style: TextStyle(
                            color: CustomColor.hexColor("0x5E5E5E"),
                            fontSize: 10.dpFontSize,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _createBanners() {
    List<Widget> views = [];
    this.widget._bannerModels.forEach((element) {
      views.add(
        Container(
          child: CustomImage.assetNetwork(
            image: element.imageUrl,
            size: Size(element.imageW, element.imageH),
          ),
        )
      );
    });
    return views;
  }
}


class ImagePostBannerModel {
  final PostModelPostImgList postImgList;
  String imageUrl;
  double imageW;
  double imageH;

  ImagePostBannerModel(this.postImgList) {
    if(this.postImgList != null) {
      this.imageUrl = this.postImgList.picUrl;
      double value = double.parse(this.postImgList.picUrlProportion ?? "1");
      this.imageW = Screen.width;
      if(value.isValid) {
        this.imageH = Screen.width / value;
      }
    }
  }
}