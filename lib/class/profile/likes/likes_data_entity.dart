import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class LikesDataEntity with JsonConvert<LikesDataEntity> {
	String newHint;
	int total;
	String newContent;
	int num;
	LikesDataPastContent pastContent;
}

class LikesDataPastContent with JsonConvert<LikesDataPastContent> {
	int pageNum;
	int pageSize;
	int total;
	int pages;
	List<LikesDataPastContentLists> lists;
	bool isFirstPage;
	bool isLastPage;
}

class LikesDataPastContentLists with JsonConvert<LikesDataPastContentLists> {
	String createTime;
	int num;
	String pastContent;
}
