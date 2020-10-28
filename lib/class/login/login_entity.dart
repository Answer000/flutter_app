import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class LoginEntity with JsonConvert<LoginEntity> {
	String resultCode;
	String msg;
	LoginData data;
}

class LoginData with JsonConvert<LoginData> {
	int tokenExpiryDate;
	String isFirstLogin;
	int systemDate;
	int userId;
	String token;
	String refreshToken;
}
