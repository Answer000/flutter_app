import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class FashionRecommendPostEntity with JsonConvert<FashionRecommendPostEntity> {
	String resultCode;
	String msg;
	FashionRecommendPostData data;
}

class FashionRecommendPostData with JsonConvert<FashionRecommendPostData> {
	FashionRecommendPostDataPostList postList;
}

class FashionRecommendPostDataPostList with JsonConvert<FashionRecommendPostDataPostList> {
	int pageNum;
	int pageSize;
	int total;
	int pages;
	List<FashionRecommandPostDataPostListLists> lists;
	bool isFirstPage;
	bool isLastPage;
}

class FashionRecommandPostDataPostListLists with JsonConvert<FashionRecommandPostDataPostListLists> {
	int id;
	int userId;
	int type;
	String picUrl;
	String picUrlProportion;
	String videoUrl;
	String createTime;
	dynamic updateTime;
	int status;
	String title;
	String subTitle;
	dynamic postBussType;
	dynamic orderStatus;
	dynamic createUser;
	int postType;
	int viewNum;
	int praiseNum;
	int praiseNumGen;
	int commentNum;
	int collectionNum;
	String content;
	String userAvatar;
	String nick;
	String linkUrl;
	String htmlDetail;
	dynamic authorId;
	dynamic userNo;
	String attentionUser;
	String praisePost;
	String collectionPost;
	List<FashionRecommandPostDataPostListListsPostImgList> postImgList;
	int stick;
	String stickTime;
	int postTagId;
	String postTagName;
	int level;
	List<FashionRecommandPostDataPostListListsPostTags> postTags;
	List<FashionRecommandPostDataPostListListsPostTopics> postTopics;
	String route;
	String strStatus;
}

class FashionRecommandPostDataPostListListsPostImgList with JsonConvert<FashionRecommandPostDataPostListListsPostImgList> {
	int id;
	String picUrl;
	String picUrlProportion;
	int status;
	int postId;
}

class FashionRecommandPostDataPostListListsPostTags with JsonConvert<FashionRecommandPostDataPostListListsPostTags> {
	int postTagId;
	String postTagName;
	int tagIndex;
}

class FashionRecommandPostDataPostListListsPostTopics with JsonConvert<FashionRecommandPostDataPostListListsPostTopics> {
	int topicId;
	String topicName;
	int topicIndex;
}
