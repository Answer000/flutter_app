
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/class/login/login_entity.dart';

typedef OnSuccess = void Function(Map response);
typedef OnFailure = void Function(Object obj);


class Https {

  Map<String,dynamic> _headers = {
    'clientVersion' : '2.0.0',
//    'Authorization' : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI3OTUxIiwiZXhwIjoxNjAxMTc1NTg4LCJpYXQiOjE2MDA5MTYzODh9.pod3e267Tsc-rASOLz3nmlhnA3rKbTgBzr3t2pVcKEqr6AY22q3tC7BgKHspjEvzgq9PB919HWOr5dv_ZF2VBQ"
  };

  // 单列
  factory Https() => _share();

  static Https get instance => _share();

  static Https _instance;

  Https._internal();

  static Https _share() {
    if(_instance == null){
      _instance = new Https._internal();
    }
    return _instance;
  }
  /// 接口域名
  String _baseUrl = 'http://dev-api.chaojimei.cn';

  /// 校验 AccessToken 是否过期
  checkAccessToken(Function(bool) callback) async {
    bool _isValidOfAccessToken;
    await LoginUserInfoManager().isValidOfAccessToken
        .then((value) => _isValidOfAccessToken = value);
    String _refreshToken;
    await LoginUserInfoManager().refreshToken
        .then((value) => _refreshToken = value);
    if(!_isValidOfAccessToken &&
        _refreshToken.isValid) {
      // 如果过期，且 refreshToken 不为nil，根据 refreshToken 请求新的 AccessToken
      await getAccessTokenWithRefreshToken(callback);
    }else{
      callback(true);
    }
  }

  /// 请求新的 AccessToken
  getAccessTokenWithRefreshToken(Function(bool) callback) async {
    _request(
      apiPath: APIPath.user_refreshToken,
      headers: {
        'Authorization' : 'Bearer ${LoginUserInfoManager().refreshToken}'
      },
      onSuccess: (data){
        var entity = LoginEntity().fromJson(data);
        LoginUserInfoManager().saveUserInfo(entity);
        callback(true);
      },onFailure: (error){
        callback(false);
    });
  }

  /// Post请求
  post({
    APIPath apiPath,
    Map<String,dynamic> params,
    Map<String,dynamic> headers,
    ContentType contentType = ContentType.urlEncoded,
    OnSuccess onSuccess,
    OnFailure onFailure}) async{
    String accessToken;
    await LoginUserInfoManager().accessToken.then((value) => accessToken = value);
    _headers['Authorization'] = 'Bearer $accessToken';

    if (headers.isValid) {
      _headers.addAll(headers);
    }
    await checkAccessToken((isValid) async {
      _request(
        apiPath: apiPath,
        params: params,
        headers: _headers,
        contentType: contentType,
        onSuccess: onSuccess,
        onFailure: onFailure
      );
    });
  }

  _request({
    APIPath apiPath,
    Map<String,dynamic> params,
    Map<String,dynamic> headers,
    ContentType contentType = ContentType.urlEncoded,
    OnSuccess onSuccess,
    OnFailure onFailure}) async {
    String url = '$_baseUrl/${apiPath.toString().split('.').last.replaceAll('_', '/')}';
    try {
      Response response = await new Dio().post(
        url,
        data: contentType == ContentType.urlEncoded ? FormData.fromMap(params) : params,
        onSendProgress: (int progress, int total) { },
        options: Options(
            method: 'Post',
            sendTimeout: 1000 * 15,
            contentType: contentType == ContentType.urlEncoded
                ? 'application/x-www-form-urlencoded'
                : 'application/json',
            headers: headers
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        print('$url  =========> \n$response');
        Map data = json.decode(response.toString());
        if(data["resultCode"] == "0000") {
          onSuccess(data);
        }else if(data["resultCode"] == "0201") {
          // 登录验证码发送成功
          onSuccess(data);
        }else{
          onFailure(response);
        }
      }else{
        onFailure(response);
      }
    } catch (exception) {
      print('$url  =========> \n$exception.toString()');
      onFailure(exception);
    }
  }
}

enum ContentType {
  urlEncoded,
  json
}

enum APIPath {
  /// 系统
  user_refreshToken,          // 刷新AccessToken
  /// 登录
  message_getverifycode,      // 请求获取验证码时的秘钥
  message_sendverifymessage,  // 获取手机验证码
  user_loginuser,             // 手机号登录

  /// 首页
  home_banner,                // 首页轮播图
  home_saveBeauty,            // 美丽救急列表
  home_nightBeauty,           // 超级夜美人列表

  /// 个人中心
  user_getUserDetail,         // 获取用户资料
}