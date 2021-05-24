import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class FansDataEntity with JsonConvert<FansDataEntity> {
	String newHint;
	int total;
	String newContent;
	int num;
	FansDataPastContent pastContent;
}

class FansDataPastContent with JsonConvert<FansDataPastContent> {
	int pageNum;
	int pageSize;
	int total;
	int pages;
	List<FansDataPastContentLists> lists;
	bool isFirstPage;
	bool isLastPage;
}

class FansDataPastContentLists with JsonConvert<FansDataPastContentLists> {
	String createTime;
	int num;
	String pastContent;
}
