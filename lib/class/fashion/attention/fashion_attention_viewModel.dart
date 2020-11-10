

import 'package:flutter_app/class/fashion/attention/fashion_attention_user_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/https/https.dart';

class FashionAttentionViewModel {

  /// 请求标签数据
  loadUserAttentionList(Function(List<FashionAttentionUserDataPostListList>) callback) async {
    int userId = 0;
    await LoginUserInfoManager().userId.then((value) => userId = value);
    await
    Https().post(
        apiPath: APIPath.user_attentionList,
        params: {'pageSize' : 20, 'pageNo' : 1, 'fansId' : userId},
        onSuccess: (data){
          var entity = FashionAttentionUserEntity().fromJson(data);
          callback(entity.data.postList.lists);
        }, onFailure: (error){
        callback([]);
    });
  }
}