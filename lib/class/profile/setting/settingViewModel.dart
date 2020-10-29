import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class SettingViewModel {

  Future<String> getVersion() async {
    // 获取APP版本号信息
    PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  }

  ///加载缓存
  Future<String> loadCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double tempValue = await _getTotalSizeOfFilesInDir(tempDir);
      /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
      Directory docDir = await getApplicationDocumentsDirectory();
      double docValue = await _getTotalSizeOfFilesInDir(docDir);

      print('临时目录大小: ' + (tempValue + docValue).toString());
      return _renderSize(tempValue + docValue);
    } catch(error) {
      return '0.0';
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
      return 0;
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
}