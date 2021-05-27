import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/resource.dart';

class SignInViewModel extends ASBaseViewModel {

  /// 连续签到次数
  int cycleTimes = 0;

  /// 是否已签到
  bool isSignIn = false;

  /// 查看连续签到次数
  getCycleTimes(Function callback) async {
    await Https().post(
      apiPath: APIPath.signin_cycleTimes,
      onSuccess: (response) {
        this.cycleTimes = response['data']['times'];
        callback();
      },
      onFailure: (error) {

      }
    );
  }

  /// 查看是否已经签到
  checkSignIn(Function callback) async {
    await Https().post(
        apiPath: APIPath.signin_checkSignin,
        onSuccess: (response) {
          this.isSignIn = response['data']['isSignin'];
          callback();
        },
        onFailure: (error) {

        }
    );
  }

  /// 签到
  doSign(Function callback) async {
    await Https().post(
        apiPath: APIPath.signin_doSign,
        onSuccess: (response) {
          if(response['resultCode'].toString() == "0000") {
            this.isSignIn = true;
          }
          callback();
        },
        onFailure: (error) {

        }
    );
  }
}