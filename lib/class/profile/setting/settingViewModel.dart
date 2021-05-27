import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/base/base_webView.dart';
import 'package:flutter_app/common/base/constant.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/common/tools/custom_loading.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class SettingViewModel {

  String _cacheSize = '0.0';

  Future<List<SettingItemEntity>> get dataSource async {
    String version;
    await getVersion().then((value) => version = value);

    List<SettingItemEntity> source = [];
    [{'title' : "清除缓存",
        'isShowMore' : true,
        'descText' : _cacheSize,
        'paddingRight' : 12.0,
        'function' : (){
          CustomLoading.showLoading();
          _clearCache().then((value) {
            CustomLoading.hideLoading();
          });
        }
      },
      {'title' : "当前版本",
        'isShowMore' : false,
        'descText' : version,
        'paddingRight' : 0.0,
      },
      {'title' : "绑定微信号",
        'isShowMore' : true,
        'descText' : '未绑定',
        'paddingRight' : 12.0,
        'function' : (){

        }
      },
      {'title' : "用户注册协议",
        'isShowMore' : false,
        'descText' : '',
        'paddingRight' : 0.0,
        'function' : (){
          CustomNavigator.push(
              page: BaseWebView.init(url: kRegistrationPolicy, title: '用户注册协议')
          );
        }
      },
      {'title' : "用户隐私协议",
        'isShowMore' : false,
        'descText' : '',
        'paddingRight' : 0.0,
        'function' : (){
          CustomNavigator.push(
              page: BaseWebView.init(url: kPrivacyPolicy, title: '用户隐私协议')
          );
        }
      }].forEach((element) {
        source.add(SettingItemEntity().fromJson(element));
      });
    return source;
  }

  Future<String> getVersion() async {
    // 获取APP版本号信息
    PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  }

  ///加载缓存
  Future<String> loadCache() async {
    try {
      double totalSize = 0;
      Directory tempDir = await getTemporaryDirectory();
      double tempValue = await _getTotalSizeOfFilesInDir(tempDir);
      /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
      if (tempValue != null){
        totalSize += tempValue;
      }
      Directory docDir = await getApplicationDocumentsDirectory();
      double docValue = await _getTotalSizeOfFilesInDir(docDir);
      if (docValue != null){
        totalSize += docValue;
      }

      print('临时目录大小: ' + totalSize.toString());
      this._cacheSize = _renderSize(totalSize);
      return this._cacheSize;
    } catch(error) {
      this._cacheSize = '0.0';
      return this._cacheSize;
    }
  }

  /// 递归方式 计算文件的大小
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        if (children != null)
          for (final FileSystemEntity child in children)
            total += await _getTotalSizeOfFilesInDir(child);
        return total;
      }
      return 0;
    } catch (e) {
      return null;
    }
  }

  /// 格式化缓存文件大小
  _renderSize(double value) {
    if (null == value) { return 0; }
    List<String> unitArr = List()
      ..add('B')
      ..add('K')
      ..add('M')
      ..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  Future _clearCache() async {
    Directory tempDir = await getTemporaryDirectory();
    double tempValue = await _getTotalSizeOfFilesInDir(tempDir);
    if (tempValue != null){
      await delDir(tempDir);
    }
    Directory docDir = await getApplicationDocumentsDirectory();
    double docValue = await _getTotalSizeOfFilesInDir(docDir);
    if (docValue != null){
      await delDir(docDir);
    }
    //删除缓存目录
    await loadCache();
  }

  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    if(file != null) {
      await file.delete();
    }
  }
}

class SettingItemEntity {
  String title;
  bool isShowMore;
  String descText;
  Function function;
  double paddingRight;

  SettingItemEntity fromJson(Map<String,dynamic> data) {
    this.title = data['title'].toString();
    this.isShowMore = data['isShowMore'];
    this.descText = data['descText'].toString();
    this.function = data['function'];
    this.paddingRight = data['paddingRight'];
    return this;
  }
}