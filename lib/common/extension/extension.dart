import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/common/tools/custom_route.dart';
import 'package:flutter_app/common/base/base_container.dart';
import '../../resource.dart';
import 'package:flutter_app/class/login/login.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';

extension Screen on ScreenUtil {
  /// 状态栏高度
  static double get statusBarHeight => ScreenUtil().statusBarHeight;
  /// 导航栏高度
  static double get navigationBarHeight => 60;
  /// 底部安全距离
  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;
  /// 屏幕宽度
  static double get width => ScreenUtil().screenWidth;
  /// 屏幕高度
  static double get height => ScreenUtil().screenHeight;
}

/// int extension
extension int_extension on int {
  double get dp => ScreenUtil().pixelRatio * ScreenUtil().setWidth(this.toDouble());
  double get dpFontSize => ScreenUtil().setSp(this) * ScreenUtil().pixelRatio;

  bool get isValid => (this != null);
  bool get isNotValid => !isValid;
}

/// double extension
extension double_extension on double {
  double get dp => ScreenUtil().pixelRatio * ScreenUtil().setWidth(this.toDouble());
  double get dpFontSize => ScreenUtil().setSp(this) * ScreenUtil().pixelRatio;

  bool get isValid => (this != null);
  bool get isNotValid => !isValid;
}

/// string extension
extension String_extension on String {
  bool get isValid => (this != null && ((this.length ?? 0) > 0));
  bool get isNotValid => !isValid;
}

/// List extension
extension List_extension on List {
  bool get isValid => (this != null && ((this.length ?? 0) > 0));
  bool get isNotValid => !isValid;
}

/// Map extension
extension Map_extension on Map {
  bool get isValid => (this != null && ((this.length ?? 0) > 0));
  bool get isNotValid => !isValid;
}

/// Size extension
extension Size_extension on Size {
  bool get isValid => (this != null && ((this.width ?? 0) > 0) && ((this.height ?? 0) > 0));
  bool get isNotValid => !isValid;
}

/// EdgeInsets extension
extension EdgeInsets_extension on EdgeInsets {
  bool get isValid => (this != null && ((this.left ?? 0) > 0) ) && ((this.right ?? 0) > 0 && ((this.top ?? 0) > 0) && ((this.bottom ?? 0) > 0));
  bool get isNotValid => !isValid;
}

extension CustomColor on Color {
  // 背景黑色
  static Color get blackGroundColor => Color(0xff1d1d1d);
  // 主题红色
  static Color get mainRedColor => Color(0xffDA3F47);
}

extension CustomAssetImage on Image {
   static Image image({String image, BoxFit fit = BoxFit.cover}) {
    return Image(
      image: AssetImage(image),
      fit: fit,
      filterQuality: FilterQuality.high,
    );
  }
}

/// 加载网络图片（渐变动画）
extension CustomImage on FadeInImage {
  static FadeInImage memoryNetwork({
    String image,
    BoxFit fit = BoxFit.cover,
    Size size = Size.zero}) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: image,
      fit: fit,
      width: size.width,
      height: size.height,
    );
  }

  static FadeInImage assetNetwork({
    String image,
    BoxFit fit = BoxFit.cover,
    Size size = Size.zero}) {
    return FadeInImage.assetNetwork(
      placeholder: ImageName.placeholder.imagePath,
      image: image,
      fit: fit,
      width: size.width,
      height: size.height,
    );
  }
}

/// 提示框
extension CustomToast on Fluttertoast {
  static show(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15,
    );
  }
}

/// 导航
extension CustomNavigator on Navigator {
  static pop(context) {
    if(Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static push(context, BaseContainer page) async {
    bool isLogin;
    await LoginUserInfoManager()
        .isLogin
        .then((value) => isLogin = value);
    if(page.isNeedLogin && !isLogin) {
      Navigator.push(context, new CustomRoute(page: Login(), modalType: CustomRouteModalType.bottomTop),);
      return;
    }
    Navigator.push(context, new CustomRoute(page: page, modalType: page.modalType));
  }
}

/// 日期时间
extension Date on DateTime {
  // 当前时间戳
  static int get currentTimeStamp => new DateTime.now().millisecondsSinceEpoch;
}