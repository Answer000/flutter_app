import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/profile/integral/detail/myIntegralDetail.dart';
import 'package:flutter_app/class/profile/integral/mall/myIntegralMall.dart';
import 'package:flutter_app/class/profile/integral/rule/myIntegralRule.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/ASButton.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/resource.dart';

class MyIntegralHeaderView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyIntegralHeaderViewState();
  }
}

class MyIntegralHeaderViewState extends State<MyIntegralHeaderView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.dp),
                height: 20.dp,
                child: Center(
                  child: Text(
                    '我的积分',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.dpFontSize,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12.dp),
                child: Center(
                  child: Text(
                    '${LoginUserInfoManager().integral}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.dpFontSize,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 52.dp),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ASButton(
                          icon: ImageName.cjm_profile_integral_mall.imagePath,
                          title: "积分商城",
                          titleFontSize: 16.dpFontSize,
                          titleFontWeight: FontWeight.w500,
                          space: 14.dp,
                          onPress: (){
                            CustomNavigator.push(context: context, page: MyIntegralMall());
                          },
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ASButton(
                          icon: ImageName.cjm_profile_integral_detail.imagePath,
                          title: "积分明细",
                          titleFontSize: 16.dpFontSize,
                          titleFontWeight: FontWeight.w500,
                          space: 14.dp,
                          onPress: (){
                            CustomNavigator.push(context: context, page: MyIntegralDetail());
                          },
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ASButton(
                          icon: ImageName.cjm_profile_integral_rule.imagePath,
                          title: "积分规则",
                          titleFontSize: 16.dpFontSize,
                          titleFontWeight: FontWeight.w500,
                          space: 14.dp,
                          onPress: (){
                            CustomNavigator.push(context: context, page: MyIntegralRule());
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]
        )
    );
  }
}