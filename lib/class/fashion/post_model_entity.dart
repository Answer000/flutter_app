import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class PostModelEntity with JsonConvert<PostModelEntity> {
	int id;
	int userId;
	int type;
	String picUrl;
	String picUrlProportion;
	String videoUrl;
	String createTime;
	String updateTime;
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
	List<PostModelPostImgList> postImgList;
	int stick;
	String stickTime;
	int postTagId;
	String postTagName;
	int level;
	List<PostModelPostTag> postTags;
	List<PostModelPostTopic> postTopics;
	String route;
	String strStatus;
}

class PostModelPostImgList with JsonConvert<PostModelPostImgList> {
	int id;
	String picUrl;
	String picUrlProportion;
	int status;
	int postId;
}

class PostModelPostTag with JsonConvert<PostModelPostTag> {
	int postTagId;
	String postTagName;
	int tagIndex;
}

class PostModelPostTopic with JsonConvert<PostModelPostTopic> {
	int topicId;
	String topicName;
	int topicIndex;
}
