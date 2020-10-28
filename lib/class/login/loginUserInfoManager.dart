import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/class/login/login_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';

class LoginUserInfoManager {

  /// 单例对象
  factory LoginUserInfoManager() => _instance();
  static LoginUserInfoManager get manager => _instance();
  static LoginUserInfoManager _manager;

  LoginUserInfoManager._internal();

  static LoginUserInfoManager _instance() {
    if (_manager == null) {
      _manager = new LoginUserInfoManager._internal();
    }
    return _manager;
  }

  static const kUserId = "kUserId";
  static const kPhoneNumber = "kPhoneNumber";
  static const kAccessToken = "kAccessToken";
  static const kRefreshToken = "kRefreshToken";
  static const kTokenExpiryDate = "kTokenExpiryDate";
  static const kTimeDifference = "kTimeDifference";

  /// 用户是否登录状态
  Future<bool> get isLogin async {
    String _userIdStr;
    await userId
        .then((value) => _userIdStr = value.isValid ? "$value" : null);
    String _accessToken = '';
    await accessToken
        .then((value) => _accessToken = value);
    return _userIdStr.isValid && _accessToken.isValid;
  }

  /// 用户id
  Future<int> get userId => _getIntValue(kUserId);

  /// 只會用作私人接口時請求所用的, 3天內會過期
  Future<String> get accessToken => _getStringValue(kAccessToken);

  /// 用作定期更新access_token之用, 45天內會過期
  Future<String> get refreshToken => _getStringValue(kRefreshToken);

  /// access_token 是否有效
  Future<bool> get isValidOfAccessToken => _isValidOfAccessToken();

  /// 持久化用户信息
  Future saveUserInfo(LoginEntity entity) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(kAccessToken, entity.data.token.toString());
    preferences.setString(kRefreshToken, entity.data.refreshToken.toString());
    preferences.setInt(kTokenExpiryDate, entity.data.tokenExpiryDate);

    // 计算时间差
    if (entity.data.systemDate != null) {
      int currentTimeStamp = Date.currentTimeStamp;
      int timeDifference = entity.data.systemDate - currentTimeStamp;
      preferences.setInt(kTimeDifference, timeDifference);
    }

    preferences.setInt(kUserId, entity.data.userId);
  }

  /// 获取持久化用户信息
  Future<int> _getIntValue(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getInt(key);
  }

  Future<String> _getStringValue(String key) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getString(key);
  }

  /// access_token 是否有效
  Future<bool> _isValidOfAccessToken() async {
    bool _isLogin;
    await isLogin
        .then((value) => _isLogin = value);
    if(!_isLogin) { return false; }

    int timeDifference;
    await _getIntValue(kTimeDifference)
        .then((value) => timeDifference = value);
    int currentTimeStamp = Date.currentTimeStamp;

    int expiryTimeStamp;
    await _getIntValue(kTokenExpiryDate)
        .then((value) => expiryTimeStamp = value);

    bool result = (expiryTimeStamp + timeDifference) >= currentTimeStamp;
    return result;
  }
}