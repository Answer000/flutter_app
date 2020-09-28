import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class HomeBannerEntity with JsonConvert<HomeBannerEntity> {
	String resultCode;
	String msg;
	HomeBannerData data;
}

class HomeBannerData with JsonConvert<HomeBannerData> {
	List<HomeBannerDataBannerList> bannerList;
}

class HomeBannerDataBannerList with JsonConvert<HomeBannerDataBannerList> {
	int id;
	String title;
	String picUrl;
	int status;
	String createTime;
	String updateTime;
	int type;
	dynamic activityId;
	dynamic createUser;
	String linkUrl;
	String videoUrl;
	int orderStatus;
	String route;
	int postId;
	String createUserName;
	String strStatus;
}
