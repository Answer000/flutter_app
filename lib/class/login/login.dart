import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginViewModel.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {

  final TextEditingController _controller = TextEditingController();

  final LoginViewModel _viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xffda4048),
          child: Stack(
            children: [
              Positioned(
                left: -42,
                top: -24,
                width: Screen.width + 42 + 128,
                height: Screen.height + 24 * 2,
                child: CustomAssetImage.image(
                    image:ImageName.cjm_login_background.imagePath
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 48.dp, right: 48.dp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,

                  children: [
                    Container(
                      width: 58.dp,
                      height: 70.dp,
                      margin: EdgeInsets.only(top: 60.dp),
                      child: CustomAssetImage.image(
                        image: ImageName.cjm_login_logo.imagePath,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 32.dp),
                      height: 80.dp,
                      child: Text(
                        '想变美， \n上超级美~',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.dpFontSize,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.only(top: 16.dp,),
                        height: 170.dp,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular((7.5.dp)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 74.dp,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 32.dp),
                                    width: 13.dp,
                                    height: 20.dp,
                                    child: CustomAssetImage.image(
                                        image: ImageName.cjm_login_phone.imagePath
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20.dp, right: 32.dp),
                                      child: new TextField(
                                        controller: TextEditingController.fromValue(
                                            TextEditingValue(
                                                text: this._viewModel.phoneString ?? "",
                                                selection: TextSelection.fromPosition(
                                                    TextPosition(
                                                        affinity: TextAffinity.downstream,
                                                        offset: "${this._viewModel.phoneString}".length
                                                    )
                                                )
                                            )
                                        ),
                                        decoration: new InputDecoration(
                                          hintText: '请输入登录手机号码',
                                          hintStyle: TextStyle(
                                              color: Color(0xff262626).withOpacity(0.5),
                                              fontSize: 12.dp,
                                              fontWeight: FontWeight.normal
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value){
                                          this.setState(() {
                                            this._viewModel.phoneString = value;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Container(
                              height: 0.5,
                              margin: EdgeInsets.only(left: 20.dp, right: 20.dp),
                              color: Color(0xFF000000).withOpacity(0.2),
                            ),

                            Container(
                              height: 74.dp,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 32.dp),
                                    width: 15.dp,
                                    height: 20.dp,
                                    child: CustomAssetImage.image(
                                        image: ImageName.cjm_login_password.imagePath
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20.dp, right: 32.dp),
                                      child: new TextField(
                                        controller: TextEditingController.fromValue(
                                          TextEditingValue(
                                            text: this._viewModel.codeString ?? "",
                                            selection: TextSelection.fromPosition(
                                              TextPosition(
                                                affinity: TextAffinity.downstream,
                                                offset: "${this._viewModel.codeString}".length
                                              )
                                            )
                                          )
                                        ),
                                        decoration: new InputDecoration(
                                          hintText: '请输入手机验证码',
                                          hintStyle: TextStyle(
                                              color: Color(0xff262626).withOpacity(0.5),
                                              fontSize: 12.dp,
                                              fontWeight: FontWeight.normal
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value){
                                          this.setState(() {
                                            this._viewModel.codeString = value;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 50.dp),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 15.dp,
                                height: 15.dp,
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  child: this._viewModel.isAgree
                                      ? ImageName.cjm_login_agree.assetImage
                                      : ImageName.cjm_login_disagree.assetImage,
                                  onPressed: (){
                                    setState(() {
                                      this._viewModel.isAgree = !this._viewModel.isAgree;
                                    });
                                  },
                                )
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.dp),
                              child: Text(
                                '同意注册协议和隐私政策',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.dpFontSize,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 16.dp),
                          height: 18.dp,
                          width: 60.dp,
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              '取消登录',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.dpFontSize,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                            onPressed: (){
                              CustomNavigator.pop(context: context);
                            },
                          ),
                        )
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20.dp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              height: 1.5.dp,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.white.withOpacity(0),
                                      Colors.white.withOpacity(0.5),
                                    ]
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 15.dp, right: 15.dp),
                            child: Text(
                              '其他方式登录',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.5.dpFontSize,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 1.5.dp,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.white.withOpacity(0.5),
                                      Colors.white.withOpacity(0),
                                    ]
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Positioned(
                height: 50.dp,
                left: 73.dp,
                right: 73.dp,
                top: 408.dp,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.dp),
                    color: Color(0xff9AD6D4),
                  ),
                  child: FlatButton(
                    child: Text(
                      "登录",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.dpFontSize,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    onPressed: () {
                      loginWithPhone();
                    },
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

  void loginWithPhone() async {
    this._viewModel.loginWithPhone(context, (isSucc){
      if(isSucc) {
        CustomNavigator.pop(context: context);
      }
    });
  }
}
