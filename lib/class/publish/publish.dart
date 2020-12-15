import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/tools/custom_route.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';


// ignore: must_be_immutable
class Publish extends BaseContainer {



  @override
  bool get isNeedLogin => true;

  @override
  CustomRouteModalType get modalType => CustomRouteModalType.transparent;

  @override
  bool get isShowNavigationBar => false;

  @override
  // TODO: implement isEnablePopWhenClickEmpty
  bool get isEnablePopWhenClickEmpty => false;

  @override
  BaseContainerState<BaseContainer> getState() {
    return PublishState();
  }


  // @override
  // // TODO: implement routeAnimation
  // CurvedAnimation get routeAnimation {
  //   return CurvedAnimation(
  //       parent: ,
  //       curve: Curves.easeInOut,
  //       reverseCurve: Curves.easeInOut
  //   );
  // }
  //
  // Animation _animation;
}

class PublishState extends BaseContainerState<Publish> with TickerProviderStateMixin {

  Widget _animationView;

  AnimationController _animationController;

  Animation _slideAnimation;

  Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();
    this._animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350)
    );
    // this._slideAnimation = Tween<Offset>(
    //   begin: const Offset(0, 1.0),
    //   end: Offset.zero,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _animationController, curve: Interval(0.0, 1.0)
    //   )
    // );

    this._fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.0, 1.0)
        )
    );
  }

  @override
  Widget setContentView(BuildContext context) {
    _animationController.forward();
    return Container(
      color: Colors.black.withOpacity(1),
      width: Screen.width,
      height: Screen.height,
      padding: EdgeInsets.only(top: Screen.topBarHeight),
      child: Opacity(
        opacity: 1,
        child: Column(
          children: [
            Container(
              width: Screen.width,
              height: 30.dp,
              alignment: Alignment.centerRight,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: CustomAssetImage.image(
                  image: ImageName.cjm_publish_display_close.imagePath,
                ),
                onPressed: () => backCallBack(),
              ),
            ),

            Container(
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text:  "记录",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.dpFontSize,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text:  "越来越美",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27.dpFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:  "的每一刻",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.dpFontSize,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ]
                    )
                )
            ),

            Container(
              margin: EdgeInsets.only(top: 23.dp, left: 53.dp, right: 53.dp),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _creatItems()
              ),
            )
          ],
        ),
      )
    );
  }

  List<Column> _creatItems() {
    List<Column> items = [];
    List<String> titles = ['发布帖子', '参与话题', '发布视频'];
    List<String> iconNames = [ImageName.cjm_publish_display_image.imagePath,
                              ImageName.cjm_publish_display_topic.imagePath,
                              ImageName.cjm_publish_display_video.imagePath];
    for(var i=0; i<3; i++) {
      items.add(
        Column(
          children: [
            Container(
              width: 71.dp,
              height: 71.dp,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: CustomAssetImage.image(
                    image: iconNames[i],
                ),
              ),
            ),
            Container(
              child: Text(
                "${titles[i]}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.dpFontSize,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none
                ),
              ),
            )
          ],
        ),
      );
    }
    return items;
  }
}