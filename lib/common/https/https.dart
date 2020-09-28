
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';

typedef OnSuccess = void Function(Map response);
typedef OnFailure = void Function(Object obj);

class Https {
  // 注册一个通知 （用于接收iOS的通知）
  static const eventChannel = const EventChannel('ios_flutter/commonParams');

  Map<String,dynamic> headers = {};

  String contentType;

  // 单列
  factory Https() => _share();

  static Https get instance => _share();

  static Https _instance;

  Https._internal() {
    // 监听事件，同事可发送参数
    eventChannel.receiveBroadcastStream('commonParams').listen(_configure);
  }

  static Https _share() {
    if(_instance == null){
      _instance = new Https._internal();
    }
    return _instance;
  }

  Function initRequest;

  /// 配置公共参数
  void _configure(Object obj) {
    var params = Map<String, dynamic>.from(obj);
    print('$params');
    contentType = params['Content-Type'] ?? "application/x-www-form-urlencoded";
    params.forEach((key, value) {
      if(key != 'Content-Type') { headers[key] = value; }
    });
    initRequest();
  }

  post(String url, Map<String,dynamic> params, OnSuccess onSuccess, OnFailure onFailure) async{
    try {
      Response response = await new Dio().post(
        url,
        data: FormData.fromMap(params),
        onSendProgress: (int progress, int total) {
          print('$progress   =====   $total');
        },
        options: Options(
            method: 'Post',
            sendTimeout: 1000 * 15,
            contentType: "application/x-www-form-urlencoded",
            headers: {
              'clientVersion' : '2.0.0',
              'Authorization' : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI3OTUxIiwiZXhwIjoxNjAxMTc1NTg4LCJpYXQiOjE2MDA5MTYzODh9.pod3e267Tsc-rASOLz3nmlhnA3rKbTgBzr3t2pVcKEqr6AY22q3tC7BgKHspjEvzgq9PB919HWOr5dv_ZF2VBQ"
            }
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