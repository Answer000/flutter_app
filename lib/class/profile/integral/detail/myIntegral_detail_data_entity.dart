import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class MyIntegralDetailDataEntity with JsonConvert<MyIntegralDetailDataEntity> {
	String resultCode;
	String msg;
	MyIntegralDetailDataData data;
}

class MyIntegralDetailDataData with JsonConvert<MyIntegralDetailDataData> {
	MyIntegralDetailDataDataIntegralList integralList;
}

class MyIntegralDetailDataDataIntegralList with JsonConvert<MyIntegralDetailDataDataIntegralList> {
	int pageNum;
	int pageSize;
	int total;
	int pages;
	List<MyIntegralDetailDataDataIntegralListLists> lists;
	bool isFirstPage;
	bool isLastPage;
}

class MyIntegralDetailDataDataIntegralListLists with JsonConvert<MyIntegralDetailDataDataIntegralListLists> {
	int id;
	int userId;
	String createTime;
	String updateTime;
	int type;
	int integral;
	String description;
	dynamic orderId;
	dynamic dbOrderId;
	String ref;
	dynamic notRealAddReason;
	dynamic distinctId;
}
