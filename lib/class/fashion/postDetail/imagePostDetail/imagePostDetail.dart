import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postDetail/imagePostDetail/imagePostDetailHeaderView.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';
import 'package:flutter_app/common/extension/extension.dart';

class ImagePostDetail extends BaseContainer {

  PostModelEntity post;
  ImagePostDetail({this.post});

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return ImagePostDetailState();
  }

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => false;

  @override
  // TODO: implement isShowBackground
  bool get isShowBackground => false;

  @override
  // TODO: implement isShowNavigationBar
  bool get isShowNavigationBar => false;
}

class ImagePostDetailState extends BaseContainerState<ImagePostDetail> {

  ScrollController _controller;

  double _toolBarHeight = Screen.bottomBarHeight + 49;

  Color _navigationBarColor = Colors.transparent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.isShowLogo = false;
    this.navigationBar.navigationBarColor = Colors.white;

    _controller = ScrollController(initialScrollOffset: 0)
      ..addListener(() {
        double value = _controller.offset / 150.0;
        if(value > 1.0) { value = 1.0; }
        if(value < 0.0) { value = 0.0; }
        this.setState(() {
          this._navigationBarColor = CustomColor.hexColor("0x1d1d1d", alpha: value);
        });
      });
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    if(this.widget.post == null) {
      return Container();
    }
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: _toolBarHeight,
            child: ListView.separated(
                controller: _controller,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index){
                  if(index == 0) {
                    return ImagePostDetailHeaderView(post: this.widget.post);
                  }else {
                    return _setRow();
                  }
                },
                separatorBuilder: (context, index) {
                  if(index == 0) {
                    return Container(
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
                              "共有${this.widget.post.commentNum}条评论",
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
                    );
                  }
                  return Container(
                    color: Colors.black,
                    height: 10,
                  );
                },
                itemCount: 20)
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: Screen.topBarHeight,
            child: NavigationBar(
              barType: NavigationBarType.child,
              isShowLogo: false,
              navigationBarColor: this._navigationBarColor,
              backCallback: () => this.backCallBack(),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: _toolBarHeight,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      )
    );
  }

  Widget _setRow(){
    return Container(
      color: Colors.yellow,
      height: 50,
    );
  }
}

