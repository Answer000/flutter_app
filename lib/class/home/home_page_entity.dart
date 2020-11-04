import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class HomePageEntity with JsonConvert<HomePageEntity> {
	String resultCode;
	String msg;
	HomePageData data;
}

class HomePageData with JsonConvert<HomePageData> {
	HomePageDataRecommendList recommendList;
}

class HomePageDataRecommendList with JsonConvert<HomePageDataRecommendList> {
	int pageNum;
	int pageSize;
	int total;
	int pages;
	List<HomePageDataRecommandListLists> lists;
	bool isFirstPage;
	bool isLastPage;
}

class HomePageDataRecommandListLists with JsonConvert<HomePageDataRecommandListLists> {
	int id;
	int createUser;
	String title;
	String picUrl;
	String videoUrl;
	String createTime;
	String updateTime;
	int status;
	int orderStatus;
	dynamic remarks;
	int type;
	String linkUrl;
	int postId;
	bool isVideo;
	String route;
	String strStatus;
}
