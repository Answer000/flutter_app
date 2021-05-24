import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class FollowsDataEntity with JsonConvert<FollowsDataEntity> {
	FollowsDataPostList postList;
}

class FollowsDataPostList with JsonConvert<FollowsDataPostList> {
	int pageNum;
	int pageSize;
	int total;
	int pages;
	List<FollowsDataPostListLists> lists;
	bool isFirstPage;
	bool isLastPage;
}

class FollowsDataPostListLists with JsonConvert<FollowsDataPostListLists> {
	int id;
	String userAvatar;
	String nick;
	String attentionUser;
	String verifyType;
	String verifyTypeIcon;
}
