import 'package:flutter_app/class/fashion/post_model_entity.dart';

postModelEntityFromJson(PostModelEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'] is String
				? int.tryParse(json['userId'])
				: json['userId'].toInt();
	}
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl'].toString();
	}
	if (json['picUrlProportion'] != null) {
		data.picUrlProportion = json['picUrlProportion'].toString();
	}
	if (json['videoUrl'] != null) {
		data.videoUrl = json['videoUrl'].toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['subTitle'] != null) {
		data.subTitle = json['subTitle'].toString();
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
		data.postType = json['postType'] is String
				? int.tryParse(json['postType'])
				: json['postType'].toInt();
	}
	if (json['viewNum'] != null) {
		data.viewNum = json['viewNum'] is String
				? int.tryParse(json['viewNum'])
				: json['viewNum'].toInt();
	}
	if (json['praiseNum'] != null) {
		data.praiseNum = json['praiseNum'] is String
				? int.tryParse(json['praiseNum'])
				: json['praiseNum'].toInt();
	}
	if (json['praiseNumGen'] != null) {
		data.praiseNumGen = json['praiseNumGen'] is String
				? int.tryParse(json['praiseNumGen'])
				: json['praiseNumGen'].toInt();
	}
	if (json['commentNum'] != null) {
		data.commentNum = json['commentNum'] is String
				? int.tryParse(json['commentNum'])
				: json['commentNum'].toInt();
	}
	if (json['collectionNum'] != null) {
		data.collectionNum = json['collectionNum'] is String
				? int.tryParse(json['collectionNum'])
				: json['collectionNum'].toInt();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['userAvatar'] != null) {
		data.userAvatar = json['userAvatar'].toString();
	}
	if (json['nick'] != null) {
		data.nick = json['nick'].toString();
	}
	if (json['linkUrl'] != null) {
		data.linkUrl = json['linkUrl'].toString();
	}
	if (json['htmlDetail'] != null) {
		data.htmlDetail = json['htmlDetail'].toString();
	}
	if (json['authorId'] != null) {
		data.authorId = json['authorId'];
	}
	if (json['userNo'] != null) {
		data.userNo = json['userNo'];
	}
	if (json['attentionUser'] != null) {
		data.attentionUser = json['attentionUser'].toString();
	}
	if (json['praisePost'] != null) {
		data.praisePost = json['praisePost'].toString();
	}
	if (json['collectionPost'] != null) {
		data.collectionPost = json['collectionPost'].toString();
	}
	if (json['postImgList'] != null) {
		data.postImgList = (json['postImgList'] as List).map((v) => PostModelPostImgList().fromJson(v)).toList();
	}
	if (json['stick'] != null) {
		data.stick = json['stick'] is String
				? int.tryParse(json['stick'])
				: json['stick'].toInt();
	}
	if (json['stickTime'] != null) {
		data.stickTime = json['stickTime'].toString();
	}
	if (json['postTagId'] != null) {
		data.postTagId = json['postTagId'] is String
				? int.tryParse(json['postTagId'])
				: json['postTagId'].toInt();
	}
	if (json['postTagName'] != null) {
		data.postTagName = json['postTagName'].toString();
	}
	if (json['level'] != null) {
		data.level = json['level'] is String
				? int.tryParse(json['level'])
				: json['level'].toInt();
	}
	if (json['postTags'] != null) {
		data.postTags = (json['postTags'] as List).map((v) => PostModelPostTag().fromJson(v)).toList();
	}
	if (json['postTopics'] != null) {
		data.postTopics = (json['postTopics'] as List).map((v) => PostModelPostTopic().fromJson(v)).toList();
	}
	if (json['route'] != null) {
		data.route = json['route'].toString();
	}
	if (json['strStatus'] != null) {
		data.strStatus = json['strStatus'].toString();
	}
	return data;
}

Map<String, dynamic> postModelEntityToJson(PostModelEntity entity) {
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
	data['postImgList'] =  entity.postImgList?.map((v) => v.toJson())?.toList();
	data['stick'] = entity.stick;
	data['stickTime'] = entity.stickTime;
	data['postTagId'] = entity.postTagId;
	data['postTagName'] = entity.postTagName;
	data['level'] = entity.level;
	data['postTags'] =  entity.postTags?.map((v) => v.toJson())?.toList();
	data['postTopics'] =  entity.postTopics?.map((v) => v.toJson())?.toList();
	data['route'] = entity.route;
	data['strStatus'] = entity.strStatus;
	return data;
}

postModelPostImgListFromJson(PostModelPostImgList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl'].toString();
	}
	if (json['picUrlProportion'] != null) {
		data.picUrlProportion = json['picUrlProportion'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['postId'] != null) {
		data.postId = json['postId'] is String
				? int.tryParse(json['postId'])
				: json['postId'].toInt();
	}
	return data;
}

Map<String, dynamic> postModelPostImgListToJson(PostModelPostImgList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['picUrl'] = entity.picUrl;
	data['picUrlProportion'] = entity.picUrlProportion;
	data['status'] = entity.status;
	data['postId'] = entity.postId;
	return data;
}

postModelPostTagFromJson(PostModelPostTag data, Map<String, dynamic> json) {
	if (json['postTagId'] != null) {
		data.postTagId = json['postTagId'] is String
				? int.tryParse(json['postTagId'])
				: json['postTagId'].toInt();
	}
	if (json['postTagName'] != null) {
		data.postTagName = json['postTagName'].toString();
	}
	if (json['tagIndex'] != null) {
		data.tagIndex = json['tagIndex'] is String
				? int.tryParse(json['tagIndex'])
				: json['tagIndex'].toInt();
	}
	return data;
}

Map<String, dynamic> postModelPostTagToJson(PostModelPostTag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['postTagId'] = entity.postTagId;
	data['postTagName'] = entity.postTagName;
	data['tagIndex'] = entity.tagIndex;
	return data;
}

postModelPostTopicFromJson(PostModelPostTopic data, Map<String, dynamic> json) {
	if (json['topicId'] != null) {
		data.topicId = json['topicId'] is String
				? int.tryParse(json['topicId'])
				: json['topicId'].toInt();
	}
	if (json['topicName'] != null) {
		data.topicName = json['topicName'].toString();
	}
	if (json['topicIndex'] != null) {
		data.topicIndex = json['topicIndex'] is String
				? int.tryParse(json['topicIndex'])
				: json['topicIndex'].toInt();
	}
	return data;
}

Map<String, dynamic> postModelPostTopicToJson(PostModelPostTopic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['topicId'] = entity.topicId;
	data['topicName'] = entity.topicName;
	data['topicIndex'] = entity.topicIndex;
	return data;
}