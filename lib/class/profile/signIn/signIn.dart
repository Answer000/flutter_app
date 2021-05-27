import 'package:flutter/material.dart';
import 'package:flutter_app/class/profile/signIn/signInViewModel.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/common/tools/custom_route.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class SignIn extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  bool get isShowNavigationBar => false;

  @override
  // TODO: implement isShowBackground
  bool get isShowBackground => false;

  CustomRouteModalType get modalType => CustomRouteModalType.bottomTop;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return SignInState();
  }
}

class SignInState extends BaseContainerState<SignIn> {

  SignInViewModel _viewModel = SignInViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "签到";

    _viewModel.getCycleTimes(()=> this.setState(() {}) );
    _viewModel.checkSignIn(()=> this.setState(() {}) );
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    double bgWidth = Screen.width - 48.dp;
    double bgHeight = bgWidth / 0.618;
    double topSpace = 88.dp;
    double itemLeftEdge = 16.dp;
    double itemSpace = 16.dp;
    double itemLineSpace = 16.dp;
    double itemWH = (bgWidth - itemLeftEdge * 2 - itemSpace * 2) / 3;
    return Container(
      child: Stack(
        children: [
          Positioned(
            right: 24.dp,
            height: 38.dp,
            width: 38.dp,
            top: (Screen.height - bgHeight) * 0.5 - 30,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: CustomAssetImage.image(
                image: ImageName.cjm_profile_sign_close.imagePath,
              ),
              onPressed: () => CustomNavigator.pop(),
            )
          ),
          Center(
            child: Container(
              width: bgWidth,
              height: bgHeight,
              child: Stack(
                children: [
                  Positioned(
                    width: bgWidth,
                    height: bgHeight,
                    child: CustomAssetImage.image(
                        image: ImageName.cjm_profile_sign_background.imagePath,
                    ),
                  ),
                  Positioned(
                    top: topSpace,
                    width: itemWH,
                    height: itemWH,
                    left: itemLeftEdge,
                    child: CustomAssetImage.image(
                        image: this._viewModel.cycleTimes >= 1
                            ? ImageName.cjm_profile_sign_finished_1.imagePath
                            : ImageName.cjm_profile_sign_unFinished_1.imagePath
                    ),
                  ),
                  Positioned(
                    top: topSpace,
                    width: itemWH,
                    height: itemWH,
                    left: itemLeftEdge + itemWH + itemSpace,
                    child: CustomAssetImage.image(
                        image: this._viewModel.cycleTimes >= 2
                            ? ImageName.cjm_profile_sign_finished_2.imagePath
                            : ImageName.cjm_profile_sign_unFinished_2.imagePath
                    ),
                  ),
                  Positioned(
                    top: topSpace,
                    width: itemWH,
                    height: itemWH,
                    left: itemLeftEdge + (itemWH + itemSpace) * 2,
                    child: CustomAssetImage.image(
                        image: this._viewModel.cycleTimes >= 3
                            ? ImageName.cjm_profile_sign_finished_3.imagePath
                            : ImageName.cjm_profile_sign_unFinished_3.imagePath
                    ),
                  ),
                  Positioned(
                    top: topSpace + itemWH + itemLineSpace,
                    width: itemWH,
                    height: itemWH,
                    left: itemLeftEdge,
                    child: CustomAssetImage.image(
                        image: this._viewModel.cycleTimes >= 4
                            ? ImageName.cjm_profile_sign_finished_4.imagePath
                            : ImageName.cjm_profile_sign_unFinished_4.imagePath
                    ),
                  ),
                  Positioned(
                    top: topSpace + itemWH + itemLineSpace,
                    width: itemWH,
                    height: itemWH,
                    left: itemLeftEdge + itemWH + itemSpace,
                    child: CustomAssetImage.image(
                        image: this._viewModel.cycleTimes >= 5
                            ? ImageName.cjm_profile_sign_finished_5.imagePath
                            : ImageName.cjm_profile_sign_unFinished_5.imagePath
                    ),
                  ),
                  Positioned(
                    top: topSpace + itemWH + itemLineSpace,
                    width: itemWH,
                    height: itemWH,
                    left: itemLeftEdge + (itemWH + itemSpace) * 2,
                    child: CustomAssetImage.image(
                        image: this._viewModel.cycleTimes >= 6
                            ? ImageName.cjm_profile_sign_finished_6.imagePath
                            : ImageName.cjm_profile_sign_unFinished_6.imagePath
                    ),
                  ),

                  Positioned(
                    top: topSpace + (itemWH + itemLineSpace) * 2,
                    height: (bgWidth - itemLeftEdge * 2) / 2.1,
                    left: itemLeftEdge,
                    right: itemLeftEdge,
                    child: CustomAssetImage.image(
                        image: this._viewModel.cycleTimes >= 7
                            ? ImageName.cjm_profile_sign_finished_7.imagePath
                            : ImageName.cjm_profile_sign_unFinished_7.imagePath
                    ),
                  ),

                  Positioned(
                    // top: topSpace + (itemWH + itemLineSpace) * 3,
                    bottom: 32.dp,
                    height: 40.dp,
                    width: 156.dp,
                    left: (bgWidth - 156.dp) * 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: this._viewModel.isSignIn
                            ? CustomColor.hexColor("0xc9c9c9")
                            : CustomColor.hexColor("0xDA3E46"),
                        borderRadius: BorderRadius.circular(20.dp)
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Text(
                          this._viewModel.isSignIn ? '已签到'  : "立即签到",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.dpFontSize,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none
                          ),
                        ),
                        onPressed: (){
                          if(!this._viewModel.isSignIn) {
                            this._viewModel.doSign(()=> this.setState(() {}) );
                          }
                        },
                      )
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

}