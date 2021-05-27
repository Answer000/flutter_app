import 'package:flutter/cupertino.dart';
import 'package:flutter_app/class/fashion/fashion.dart';
import 'package:flutter_app/class/login/login.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/signIn/signIn.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/tabbar.dart';
import 'package:flutter_app/common/tools/custom_route.dart';


enum CustomRouteNamed {
  chaojimei_postList, /// 潮区
  chaojimei_signin,   /// 签到
}

/// 导航
extension CustomNavigator on Navigator {

  static pop({context}) {
    context ??= LoginUserInfoManager.appContext;
    if(Navigator.canPop(context )) {
      Navigator.pop(context);
    }
  }

  static push({context, BaseContainer page}) async {
    context ??= LoginUserInfoManager.appContext;
    bool isLogin;
    await LoginUserInfoManager()
        .isLogin
        .then((value) => isLogin = value);
    if(page.isNeedLogin && !isLogin) {
      Navigator.push(
          context,
          CustomRoute(
              page: Login(),
              modalType: CustomRouteModalType.bottomTop
          )
      );
      return;
    }
    Navigator.push(
        context,
        CustomRoute(
            page: page,
            modalType: page.modalType
        )
    );
  }

  static Future<bool> isNeedsToLogin({context}) async {
    context ??= LoginUserInfoManager.appContext;
    bool isLogin;
    await LoginUserInfoManager()
        .isLogin
        .then((value) => isLogin = value);
    if(!isLogin) {
      Navigator.push(context, new CustomRoute(page: Login(), modalType: CustomRouteModalType.bottomTop));
      return true;
    }
    return false;
  }

  static pushNamed({context, CustomRouteNamed routeNamed,  String routeStr}) {
    String route = routeStr.replaceFirst("://", "_");
    if(route == null) { return; }
    List<dynamic> paramList = route.split("?");
    String paramStr = paramList.last;
    List paramObjs = paramStr.split("&");
    Map params = {};
    paramObjs.forEach((element) {
      List temp = element.toString().split("=");
      params["${temp.first.toString()}"] = temp.last;
    });
    if(route.startsWith("chaojimei_postList") ||
        routeNamed == CustomRouteNamed.chaojimei_postList) {
      ASTabBar().selectItem(ASTabBarItemType.fashion, index: int.parse(params["type"]));
      return;
    }

    context ??= LoginUserInfoManager.appContext;
    if(routeNamed != null) {
      String result = routeNamed.toString().split(".").last;
      Navigator.pushNamed(context, result);

    }else if(route != null) {
      int startIndex = route.indexOf("?");

      if(startIndex >= 0) {
        /// URL后拼接了参数

        if(paramList.first == null) { return; }
        Navigator.pushNamed(context, paramList.first, arguments: params);

      }else{
        /// URL后未拼接参数
        Navigator.pushNamed(context, route);
      }
    }
  }
}