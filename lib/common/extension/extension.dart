import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../resource.dart';

extension Screen on ScreenUtil {
  /// 屏幕适配的size
  static Size get designSize => Size(750, 1334);
  /// 状态栏高度
  static double get statusBarHeight => ScreenUtil().statusBarHeight;
  /// 导航栏高度
  static double get navigationBarHeight => 60;
  /// 底部安全距离
  static double get topBarHeight => navigationBarHeight + statusBarHeight;
  /// tabTar高度
  static double get tabBarHeight => 49;
  /// 底部安全距离
  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;
  /// 屏幕宽度
  static double get width => ScreenUtil().screenWidth;
  /// 屏幕高度
  static double get height => ScreenUtil().screenHeight;
}

/// int extension
extension int_extension on int {
  double get dp => ScreenUtil().screenWidth / (Screen.designSize.width / 2.0) * this.toDouble();
  double get dpFontSize => ScreenUtil().screenWidth / (Screen.designSize.width / 2.0) * this.toDouble();

  bool get isValid => (this != null);
  bool get isNotValid => !isValid;

  String setTrans() {
    if(this < 1000) {
      return "$this";
    }else{
      return "${(this/10000).toStringAsFixed(1)}w";
    }
  }
}

/// double extension
extension double_extension on double {
  double get dp => this.toInt().dp;
  double get dpFontSize => this.toInt().dpFontSize;

  bool get isValid => (this != null);
  bool get isNotValid => !isValid;
}

/// string extension
extension String_extension on String {
  bool get isValid => (this != null && ((this.length ?? 0) > 0));
  bool get isNotValid => !isValid;

  /// 计算文本高度
  double calculateTextHeight(double fontSize, FontWeight fontWeight, double maxWidth, int maxLines) {
    TextPainter painter = TextPainter(
      ///AUTO：华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
      locale: Localizations.localeOf(LoginUserInfoManager.appContext, nullOk: true),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: this,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
        )
      )
    );
    painter.layout(maxWidth: maxWidth);
    return painter.height;
  }

  Widget setRichText(String targetText, TextStyle normalStyle, String replaceText, TextStyle replaceTextStyle) {
    if(this.isNotValid || targetText.isNotValid) { return Container(); }
    List<String> result = this.split(targetText);
    if(result.isNotValid) { return Container(); }
    return RichText(
      text: TextSpan(
        text: result.first ?? "",
        style:  normalStyle,
        children: [
          TextSpan(
            text: replaceText,
            style: replaceTextStyle,
          ),

          TextSpan(
            text: result.last ?? "",
            style: normalStyle,
          ),
        ]
      ),
    );
  }

  RichText setRich(TextStyle style, {List<TextSpan> textSpans}) {
    return RichText(
      text: TextSpan(
          text: this,
          style: style,
          children: textSpans,
      ),
    );
  }
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
  bool get isValid => (this != null && ((this.left ?? 0) > 0 || (this.right ?? 0) > 0 || (this.top ?? 0) > 0 || (this.bottom ?? 0) > 0));
  bool get isNotValid => !isValid;
}

extension CustomColor on Color {
  // 背景黑色
  static Color get blackGroundColor => Color(0xff1d1d1d);
  // 主题红色
  static Color get mainRedColor => Color(0xffDA3F47);
  // 随机颜色
  static Color get randomColor => Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1
  );

  /// 颜色创建方法
  /// - [colorString] 颜色值
  /// - [alpha] 透明度(默认1，0-1)
  ///
  /// 可以输入多种格式的颜色代码，如: 0x000000,0xff000000,#000000
  static Color hexColor(String colorString, {double alpha = 1.0}) {
    String colorStr = colorString;
    // colorString未带0xff前缀并且长度为6
    if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
      colorStr = '0xff' + colorStr;
    }
    // colorString为8位，如0x000000
    if(colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    }
    // colorString为7位，如#000000
    if(colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    }
    // 先分别获取色值的RGB通道
    Color color = Color(int.parse(colorStr));
    int red = color.red;
    int green = color.green;
    int blue = color.blue;
    // 通过fromRGBO返回带透明度和RGB值的颜色
    return Color.fromRGBO(red, green, blue, alpha);
  }
}

extension CustomAssetImage on Image {
   static Image image({String image, BoxFit fit = BoxFit.cover, Color color}) {
    return Image(
      image: AssetImage(image),
      fit: fit,
      filterQuality: FilterQuality.high,
      color: color,
    );
  }
}

/// 加载网络图片（渐变动画）
extension CustomImage on FadeInImage {
  static FadeInImage memoryNetwork({
    String image,
    BoxFit fit = BoxFit.cover,
    Size size = Size.zero}) {
    if(image.isValid) {
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: image,
        fit: fit,
        width: size.width,
        height: size.height,
        imageErrorBuilder: (context, object, stackTrace) {
          return CustomAssetImage.image(
            image: ImageName.placeholder.imagePath,
            fit: fit,
          );
        },
      );
    }else{
      return FadeInImage.assetNetwork(
        image: ImageName.placeholder.imagePath,
        fit: fit,
        width: size.width,
        height: size.height,
        imageErrorBuilder: (context, object, stackTrace) {
          return CustomAssetImage.image(
            image: ImageName.placeholder.imagePath,
            fit: fit,
          );
        },
      );
    }
  }

  static Widget assetNetwork({
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

/// 日期时间
extension Date on DateTime {
  // 当前时间戳
  static int get currentTimeStamp => new DateTime.now().millisecondsSinceEpoch;
}