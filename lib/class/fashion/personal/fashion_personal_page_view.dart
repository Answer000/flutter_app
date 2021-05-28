import 'package:flutter/material.dart';
import 'package:flutter_app/common/tools/base_page_view.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/personal/personal.dart';
import 'package:flutter_app/common/extension/extension.dart';

// ignore: must_be_immutable
class FashionPersonalPageView extends BasePageView {

  @override
  BasePageViewState<BasePageView> getState() {
    return FashionPersonalPageViewState();
  }
}

class FashionPersonalPageViewState extends BasePageViewState<FashionPersonalPageView> {

  int userId;

  @override
  void initState() {
    super.initState();
    LoginUserInfoManager().userId.then((value) => {
      this.setState(() {
        this.userId = value;
      })
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    return this.userId.isNotValid
        ? Container()
        : Personal(userId: this.userId);
  }
}
