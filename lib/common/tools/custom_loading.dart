import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/extension/extension.dart';

class CustomLoading {
  static bool _isShow = false;

  static showLoading({BuildContext context}) {
    if(!_isShow) {
      _isShow = true;
      showGeneralDialog(
          context: context ?? LoginUserInfoManager.appContext,
          barrierDismissible: false,
          transitionDuration: const Duration(milliseconds: 150),
          pageBuilder: (BuildContext context,
              Animation animation,
              Animation secondaryAnimation) {
        return Align(
          child: Container(
            width: 60.dp,
            height: 60.dp,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(Radius.circular(5.dp))
            ),
            child: Theme(
              data: ThemeData(
                cupertinoOverrideTheme: CupertinoThemeData(
                  brightness: Brightness.dark,
                ),
              ),
              child: CupertinoActivityIndicator(radius: 10.dp,),
            ),
          ),
        );
      }).then((value) {
        _isShow = false;
      });
    }
  }

  static hideLoading({BuildContext context}) {
    if(_isShow){
      Navigator.of(context ?? LoginUserInfoManager.appContext).pop();
    }
  }
}
