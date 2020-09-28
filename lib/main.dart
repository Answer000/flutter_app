import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/common/base/tabbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
  ScreenUtil.init(designSize: Size(750, 1334), allowFontScaling: true);
  runApp(new MaterialApp(home: ASTabBar()));
}