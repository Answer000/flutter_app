import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class PostModelEntity with JsonConvert<PostModelEntity> {
	int id;
	int userId;
	int type;
	dynamic picUrl;
	dynamic picUrlProportion;
	dynamic videoUrl;
	String createTime;
	dynamic updateTime;
	int status;
	dynamic title;
	dynamic subTitle;
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
	String verifyType;
	String verifyTypeIcon;
	String linkUrl;
	dynamic htmlDetail;
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
	dynamic topicName;
	int level;
	List<PostModelPostTags> postTags;
	List<PostModelPostTopics> postTopics;
	List<PostModelPostGoods> postGoods;
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

class PostModelPostTags with JsonConvert<PostModelPostTags> {
	int postTagId;
	String postTagName;
	int tagIndex;
	dynamic pages;
}

class PostModelPostTopics with JsonConvert<PostModelPostTopics> {
	int topicId;
	String topicName;
	int topicIndex;
}

class PostModelPostGoods with JsonConvert<PostModelPostGoods> {
	int id;
	int isSell;
	dynamic floor;
	dynamic aFew;
	dynamic bigSort;
	dynamic smallSort;
	int isDelete;
	dynamic goodsBannerImgs;
	dynamic goodsDetailImg;
	String picUrl;
	String picUrlProportion;
	String title;
	int species;
	double price;
	String goodsNo;
	String detail;
	dynamic videoUrl;
	String createTime;
	String updateTime;
	int createUser;
	int status;
	dynamic remarks;
	dynamic collenction;
	dynamic vectis;
	String videoName;
	dynamic goodsNum;
	dynamic type;
	dynamic createUserName;
	dynamic classifyName;
	dynamic brand;
	int goodType;
	String appItemId;
	String goodUrl;
	dynamic numType;
	String shareUrl;
	String route;
	String batch;
	String batchDesc;
	dynamic pwd;
	dynamic videoThumbnailUrl;
	dynamic goodsDeatil;
	dynamic tagName;
	dynamic tagIds;
	List<PostModelPostGoodsTagList> tagList;
	int avaliableStockNum;
	dynamic bannerImgsList;
	double originalPrice;
	double marketPrice;
	int classifyId;
	String viedoName;
}

class PostModelPostGoodsTagList with JsonConvert<PostModelPostGoodsTagList> {
	int postTagId;
	String postTagName;
	int tagIndex;
	dynamic pages;
}
