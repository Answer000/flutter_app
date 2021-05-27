import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class MyIntegralDataEntity with JsonConvert<MyIntegralDataEntity> {
	String resultCode;
	String msg;
	MyIntegralDataData data;
}

class MyIntegralDataData with JsonConvert<MyIntegralDataData> {
	List<MyIntegralDataDataMissionList> missionList;
}

class MyIntegralDataDataMissionList with JsonConvert<MyIntegralDataDataMissionList> {
	int currentTime;
	int maxTime;
	String btnText;
	String route;
	int id;
	int type;
	String title;
	int maxIntegral;
	bool isComplete;
}
