
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_app/common/extension/extension.dart';

typedef OnSuccess = void Function(Map response);
typedef OnFailure = void Function(Object obj);

class Https {

  Map<String,dynamic> _headers = {
    'clientVersion' : '2.0.0',
    'Authorization' : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI3OTUxIiwiZXhwIjoxNjAxMTc1NTg4LCJpYXQiOjE2MDA5MTYzODh9.pod3e267Tsc-rASOLz3nmlhnA3rKbTgBzr3t2pVcKEqr6AY22q3tC7BgKHspjEvzgq9PB919HWOr5dv_ZF2VBQ"
  };

  String _contentType = '"application/x-www-form-urlencoded"';

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

  post({
    APIPath apiPath,
    Map<String,dynamic> params,
    OnSuccess onSuccess,
    OnFailure onFailure}) async{
    try {
      String url = '$_baseUrl/${apiPath.toString().split('.').last}';
      Response response = await new Dio().post(
        url,
        data: params.isValid ? FormData.fromMap(params) : null,
        onSendProgress: (int progress, int total) {
          print('$progress   =====   $total');
        },
        options: Options(
            method: 'Post',
            sendTimeout: 1000 * 15,
            contentType: _contentType,
            headers: _headers
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        print('======$url======$params============ $response');
        Map data = json.decode(response.toString());
        if(data["resultCode"] == "0000") {
          onSuccess(data);
        }else{
          onFailure(response);
        }
      }else{
        print('$response   =====  response');
        onFailure(response);
      }
    } catch (exception) {
      print('$exception   =====  exception');
      onFailure(exception);
    }
  }
}

enum APIPath {
  home_banner,  /// 首页轮播图
}