import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_container.dart';

enum CustomRouteModalType {
  rightLeft,    /// 从右至左推出
  leftRight,    /// 从左至右推出
  bottomTop,    /// 从下至上推出
  transparent,  /// 透明效果
}

class CustomRoute extends PageRouteBuilder {

  @override
  // TODO: implement opaque
  bool get opaque => modalType == CustomRouteModalType.transparent ? false : true;

  @override
  // TODO: implement barrierColor
  Color get barrierColor => modalType == CustomRouteModalType.transparent ? null : super.barrierColor;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => modalType == CustomRouteModalType.transparent ? null : super.barrierLabel;

  @override
  // TODO: implement maintainState
  bool get maintainState => modalType == CustomRouteModalType.transparent ? true : super.maintainState;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: 350);

  final Widget page;
  final CustomRouteModalType modalType;
  CustomRoute({
    @required this.page,
    this.modalType = CustomRouteModalType.rightLeft
  }) : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation)
    => page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,){
      CurvedAnimation curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
          reverseCurve: Curves.easeInOut
      );
      switch (modalType) {
        case CustomRouteModalType.transparent:
          return FadeTransition(
            opacity: curvedAnimation,
            child: child,
          );
        case CustomRouteModalType.rightLeft:
          return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset(0,0),).animate(curvedAnimation),
              child: child
          );
        case CustomRouteModalType.leftRight:
          return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0),
                end: Offset(0,0),).animate(curvedAnimation),
              child: child
          );
        default:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,).animate(curvedAnimation),
            child: child
          );
      }
    }
  );
}