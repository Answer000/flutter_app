import 'package:flutter_app/class/fashion/fashion_recommend_post_entity.dart';

fashionRecommendPostEntityFromJson(FashionRecommendPostEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode']?.toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new FashionRecommendPostData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> fashionRecommendPostEntityToJson(FashionRecommendPostEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

fashionRecommendPostDataFromJson(FashionRecommendPostData data, Map<String, dynamic> json) {
	if (json['postList'] != null) {
		data.postList = new FashionRecommendPostDataPostList().fromJson(json['postList']);
	}
	return data;
}

Map<String, dynamic> fashionRecommendPostDataToJson(FashionRecommendPostData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.postList != null) {
		data['postList'] = entity.postList.toJson();
	}
	return data;
}

fashionRecommendPostDataPostListFromJson(FashionRecommendPostDataPostList data, Map<String, dynamic> json) {
	if (json['pageNum'] != null) {
		data.pageNum = json['pageNum']?.toInt();
	}
	if (json['pageSize'] != null) {
		data.pageSize = json['pageSize']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['pages'] != null) {
		data.pages = json['pages']?.toInt();
	}
	if (json['lists'] != null) {
		data.lists = new List<FashionRecommandPostDataPostListLists>();
		(json['lists'] as List).forEach((v) {
			data.lists.add(new FashionRecommandPostDataPostListLists().fromJson(v));
		});
	}
	if (json['isFirstPage'] != null) {
		data.isFirstPage = json['isFirstPage'];
	}
	if (json['isLastPage'] != null) {
		data.isLastPage = json['isLastPage'];
	}
	return data;
}

Map<String, dynamic> fashionRecommendPostDataPostListToJson(FashionRecommendPostDataPostList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pageNum'] = entity.pageNum;
	data['pageSize'] = entity.pageSize;
	data['total'] = entity.total;
	data['pages'] = entity.pages;
	if (entity.lists != null) {
		data['lists'] =  entity.lists.map((v) => v.toJson()).toList();
	}
	data['isFirstPage'] = entity.isFirstPage;
	data['isLastPage'] = entity.isLastPage;
	return data;
}

fashionRecommandPostDataPostListListsFromJson(FashionRecommandPostDataPostListLists data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['picUrlProportion'] != null) {
		data.picUrlProportion = json['picUrlProportion']?.toString();
	}
	if (json['videoUrl'] != null) {
		data.videoUrl = json['videoUrl']?.toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'];
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['subTitle'] != null) {
		data.subTitle = json['subTitle']?.toString();
	}
	if (json['postBussType'] != null) {
		data.postBussType = json['postBussType'];
	}
	if (json['orderStatus'] != null) {
		data.orderStatus = json['orderStatus'];
	}
	if (json['createUser'] != null) {
		data.createUser = json['createUser'];
	}
	if (json['postType'] != null) {
		data.postType = json['postType']?.toInt();
	}
	if (json['viewNum'] != null) {
		data.viewNum = json['viewNum']?.toInt();
	}
	if (json['praiseNum'] != null) {
		data.praiseNum = json['praiseNum']?.toInt();
	}
	if (json['praiseNumGen'] != null) {
		data.praiseNumGen = json['praiseNumGen']?.toInt();
	}
	if (json['commentNum'] != null) {
		data.commentNum = json['commentNum']?.toInt();
	}
	if (json['collectionNum'] != null) {
		data.collectionNum = json['collectionNum']?.toInt();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['userAvatar'] != null) {
		data.userAvatar = json['userAvatar']?.toString();
	}
	if (json['nick'] != null) {
		data.nick = json['nick']?.toString();
	}
	if (json['linkUrl'] != null) {
		data.linkUrl = json['linkUrl']?.toString();
	}
	if (json['htmlDetail'] != null) {
		data.htmlDetail = json['htmlDetail']?.toString();
	}
	if (json['authorId'] != null) {
		data.authorId = json['authorId'];
	}
	if (json['userNo'] != null) {
		data.userNo = json['userNo'];
	}
	if (json['attentionUser'] != null) {
		data.attentionUser = json['attentionUser']?.toString();
	}
	if (json['praisePost'] != null) {
		data.praisePost = json['praisePost']?.toString();
	}
	if (json['collectionPost'] != null) {
		data.collectionPost = json['collectionPost']?.toString();
	}
	if (json['postImgList'] != null) {
		data.postImgList = new List<FashionRecommandPostDataPostListListsPostImgList>();
		(json['postImgList'] as List).forEach((v) {
			data.postImgList.add(new FashionRecommandPostDataPostListListsPostImgList().fromJson(v));
		});
	}
	if (json['stick'] != null) {
		data.stick = json['stick']?.toInt();
	}
	if (json['stickTime'] != null) {
		data.stickTime = json['stickTime']?.toString();
	}
	if (json['postTagId'] != null) {
		data.postTagId = json['postTagId']?.toInt();
	}
	if (json['postTagName'] != null) {
		data.postTagName = json['postTagName']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	if (json['postTags'] != null) {
		data.postTags = new List<FashionRecommandPostDataPostListListsPostTags>();
		(json['postTags'] as List).forEach((v) {
			data.postTags.add(new FashionRecommandPostDataPostListListsPostTags().fromJson(v));
		});
	}
	if (json['postTopics'] != null) {
		data.postTopics = new List<FashionRecommandPostDataPostListListsPostTopics>();
		(json['postTopics'] as List).forEach((v) {
			data.postTopics.add(new FashionRecommandPostDataPostListListsPostTopics().fromJson(v));
		});
	}
	if (json['route'] != null) {
		data.route = json['route']?.toString();
	}
	if (json['strStatus'] != null) {
		data.strStatus = json['strStatus']?.toString();
	}
	return data;
}

Map<String, dynamic> fashionRecommandPostDataPostListListsToJson(FashionRecommandPostDataPostListLists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['type'] = entity.type;
	data['picUrl'] = entity.picUrl;
	data['picUrlProportion'] = entity.picUrlProportion;
	data['videoUrl'] = entity.videoUrl;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['status'] = entity.status;
	data['title'] = entity.title;
	data['subTitle'] = entity.subTitle;
	data['postBussType'] = entity.postBussType;
	data['orderStatus'] = entity.orderStatus;
	data['createUser'] = entity.createUser;
	data['postType'] = entity.postType;
	data['viewNum'] = entity.viewNum;
	data['praiseNum'] = entity.praiseNum;
	data['praiseNumGen'] = entity.praiseNumGen;
	data['commentNum'] = entity.commentNum;
	data['collectionNum'] = entity.collectionNum;
	data['content'] = entity.content;
	data['userAvatar'] = entity.userAvatar;
	data['nick'] = entity.nick;
	data['linkUrl'] = entity.linkUrl;
	data['htmlDetail'] = entity.htmlDetail;
	data['authorId'] = entity.authorId;
	data['userNo'] = entity.userNo;
	data['attentionUser'] = entity.attentionUser;
	data['praisePost'] = entity.praisePost;
	data['collectionPost'] = entity.collectionPost;
	if (entity.postImgList != null) {
		data['postImgList'] =  entity.postImgList.map((v) => v.toJson()).toList();
	}
	data['stick'] = entity.stick;
	data['stickTime'] = entity.stickTime;
	data['postTagId'] = entity.postTagId;
	data['postTagName'] = entity.postTagName;
	data['level'] = entity.level;
	if (entity.postTags != null) {
		data['postTags'] =  entity.postTags.map((v) => v.toJson()).toList();
	}
	if (entity.postTopics != null) {
		data['postTopics'] =  entity.postTopics.map((v) => v.toJson()).toList();
	}
	data['route'] = entity.route;
	data['strStatus'] = entity.strStatus;
	return data;
}

fashionRecommandPostDataPostListListsPostImgListFromJson(FashionRecommandPostDataPostListListsPostImgList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['picUrlProportion'] != null) {
		data.picUrlProportion = json['picUrlProportion']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['postId'] != null) {
		data.postId = json['postId']?.toInt();
	}
	return data;
}

Map<String, dynamic> fashionRecommandPostDataPostListListsPostImgListToJson(FashionRecommandPostDataPostListListsPostImgList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['picUrl'] = entity.picUrl;
	data['picUrlProportion'] = entity.picUrlProportion;
	data['status'] = entity.status;
	data['postId'] = entity.postId;
	return data;
}

fashionRecommandPostDataPostListListsPostTagsFromJson(FashionRecommandPostDataPostListListsPostTags data, Map<String, dynamic> json) {
	if (json['postTagId'] != null) {
		data.postTagId = json['postTagId']?.toInt();
	}
	if (json['postTagName'] != null) {
		data.postTagName = json['postTagName']?.toString();
	}
	if (json['tagIndex'] != null) {
		data.tagIndex = json['tagIndex']?.toInt();
	}
	return data;
}

Map<String, dynamic> fashionRecommandPostDataPostListListsPostTagsToJson(FashionRecommandPostDataPostListListsPostTags entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['postTagId'] = entity.postTagId;
	data['postTagName'] = entity.postTagName;
	data['tagIndex'] = entity.tagIndex;
	return data;
}

fashionRecommandPostDataPostListListsPostTopicsFromJson(FashionRecommandPostDataPostListListsPostTopics data, Map<String, dynamic> json) {
	if (json['topicId'] != null) {
		data.topicId = json['topicId']?.toInt();
	}
	if (json['topicName'] != null) {
		data.topicName = json['topicName']?.toString();
	}
	if (json['topicIndex'] != null) {
		data.topicIndex = json['topicIndex']?.toInt();
	}
	return data;
}

Map<String, dynamic> fashionRecommandPostDataPostListListsPostTopicsToJson(FashionRecommandPostDataPostListListsPostTopics entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['topicId'] = entity.topicId;
	data['topicName'] = entity.topicName;
	data['topicIndex'] = entity.topicIndex;
	return data;
}