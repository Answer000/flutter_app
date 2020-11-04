
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/common/tools/custom_loading.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/class/login/login_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';

class LoginViewModel {

  bool isAgree = true;

  String phoneString = '17665367175';

  String codeString = '223344';

  getCode(BuildContext context) {
    if (this.phoneString.isNotValid) {
      CustomToast.show("手机号不能为空");
      return;
    }
    _sendRequesetOfGetCode(context);
  }

  /// 发送获取手机验证码的请求
  _sendRequesetOfGetCode(BuildContext context) async {
    CustomLoading.showLoading(context);
    await Https().post(
        apiPath: APIPath.message_getverifycode,
        onSuccess: (data){
          String encode = data['data']['code'];
          _handleSecretParams(encode, (code){
            Map<String, dynamic> params = {'phone' : phoneString, 'code' : code, 'areaCode' : '86'};
            _sendCode(context, params);
          });
          CustomLoading.hideLoading(context);
        }, onFailure: (error){
          CustomLoading.hideLoading(context);
    });
  }

  /// 获取验证码
  _sendCode(BuildContext context, Map params) async {
    await Https().post(
      apiPath: APIPath.message_sendverifymessage,
      params: params,
      headers: params,
      onSuccess: (data) {
        CustomLoading.hideLoading(context);
        CustomToast.show(data["msg"]);
      }, onFailure: (error) {
        CustomLoading.hideLoading(context);
    });
  }

  //调用原生方法
  _handleSecretParams(String targetCode, Function(String) callback) async {
    const platform = const MethodChannel('flutter_ios');
    try {
      var argMap = {'encode' : targetCode, 'phone' : phoneString, 'areaCode' : '86'};
      var result = await platform.invokeMethod('func_AES256', argMap);
      callback(result);
    } on PlatformException catch (e) {
      callback(null);
    }
  }

  /// 通过手机号、验证码登录
  loginWithPhone(BuildContext context, Function(bool isSucc) callback) async {
    if (this.phoneString.isNotValid) {
      CustomToast.show("手机号不能为空");
      return;
    }
    if (this.codeString.isNotValid) {
      CustomToast.show("验证码不能为空");
      return;
    }
    if (!this.isAgree) {
      CustomToast.show("没有同意注册协议和隐私政策？");
      return;
    }
    CustomLoading.showLoading(context);
    Map<String,dynamic> params = {'phone' : phoneString, 'code' : codeString};
    await Https().post(
        apiPath: APIPath.user_loginuser,
        params: params,
        contentType: ContentType.json,
        onSuccess: (data) {
          CustomLoading.hideLoading(context);
          var entity = LoginEntity().fromJson(data);
          LoginUserInfoManager().saveUserInfo(entity, context: context);
          callback(true);
        }, onFailure: (error) {
          CustomLoading.hideLoading(context);
          callback(false);
        }
    );
  }
}