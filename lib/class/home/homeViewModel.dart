import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/class/home/home_banner_entity.dart';

class HomeViewModel {

  /// 请求轮播图数据
  loadBannerSources(Function(List<HomeBannerDataBannerList>) callback) async {
    String url = 'home/banner';
    await Https().post(
        apiPath: APIPath.home_banner,
        onSuccess: (data){
          var entity = HomeBannerEntity().fromJson(data);
          callback(entity.data.bannerList);
        }, onFailure: (error){
          callback([]);
        });
  }
}