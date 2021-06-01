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
		data.picUrl = json['picUrl'];
	}
	if (json['picUrlProportion'] != null) {
		data.picUrlProportion = json['picUrlProportion'];
	}
	if (json['videoUrl'] != null) {
		data.videoUrl = json['videoUrl'];
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'];
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'];
	}
	if (json['subTitle'] != null) {
		data.subTitle = json['subTitle'];
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
	if (json['verifyType'] != null) {
		data.verifyType = json['verifyType'].toString();
	}
	if (json['verifyTypeIcon'] != null) {
		data.verifyTypeIcon = json['verifyTypeIcon'].toString();
	}
	if (json['linkUrl'] != null) {
		data.linkUrl = json['linkUrl'].toString();
	}
	if (json['htmlDetail'] != null) {
		data.htmlDetail = json['htmlDetail'];
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
	if (json['topicName'] != null) {
		data.topicName = json['topicName'];
	}
	if (json['level'] != null) {
		data.level = json['level'] is String
				? int.tryParse(json['level'])
				: json['level'].toInt();
	}
	if (json['postTags'] != null) {
		data.postTags = (json['postTags'] as List).map((v) => PostModelPostTags().fromJson(v)).toList();
	}
	if (json['postTopics'] != null) {
		data.postTopics = (json['postTopics'] as List).map((v) => PostModelPostTopics().fromJson(v)).toList();
	}
	if (json['postGoods'] != null) {
		data.postGoods = (json['postGoods'] as List).map((v) => PostModelPostGoods().fromJson(v)).toList();
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
	data['verifyType'] = entity.verifyType;
	data['verifyTypeIcon'] = entity.verifyTypeIcon;
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
	data['topicName'] = entity.topicName;
	data['level'] = entity.level;
	data['postTags'] =  entity.postTags?.map((v) => v.toJson())?.toList();
	data['postTopics'] =  entity.postTopics?.map((v) => v.toJson())?.toList();
	data['postGoods'] =  entity.postGoods?.map((v) => v.toJson())?.toList();
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

postModelPostTagsFromJson(PostModelPostTags data, Map<String, dynamic> json) {
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
	if (json['pages'] != null) {
		data.pages = json['pages'];
	}
	return data;
}

Map<String, dynamic> postModelPostTagsToJson(PostModelPostTags entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['postTagId'] = entity.postTagId;
	data['postTagName'] = entity.postTagName;
	data['tagIndex'] = entity.tagIndex;
	data['pages'] = entity.pages;
	return data;
}

postModelPostTopicsFromJson(PostModelPostTopics data, Map<String, dynamic> json) {
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

Map<String, dynamic> postModelPostTopicsToJson(PostModelPostTopics entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['topicId'] = entity.topicId;
	data['topicName'] = entity.topicName;
	data['topicIndex'] = entity.topicIndex;
	return data;
}

postModelPostGoodsFromJson(PostModelPostGoods data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['isSell'] != null) {
		data.isSell = json['isSell'] is String
				? int.tryParse(json['isSell'])
				: json['isSell'].toInt();
	}
	if (json['floor'] != null) {
		data.floor = json['floor'];
	}
	if (json['aFew'] != null) {
		data.aFew = json['aFew'];
	}
	if (json['bigSort'] != null) {
		data.bigSort = json['bigSort'];
	}
	if (json['smallSort'] != null) {
		data.smallSort = json['smallSort'];
	}
	if (json['isDelete'] != null) {
		data.isDelete = json['isDelete'] is String
				? int.tryParse(json['isDelete'])
				: json['isDelete'].toInt();
	}
	if (json['goodsBannerImgs'] != null) {
		data.goodsBannerImgs = json['goodsBannerImgs'];
	}
	if (json['goodsDetailImg'] != null) {
		data.goodsDetailImg = json['goodsDetailImg'];
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl'].toString();
	}
	if (json['picUrlProportion'] != null) {
		data.picUrlProportion = json['picUrlProportion'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['species'] != null) {
		data.species = json['species'] is String
				? int.tryParse(json['species'])
				: json['species'].toInt();
	}
	if (json['price'] != null) {
		data.price = json['price'] is String
				? double.tryParse(json['price'])
				: json['price'].toDouble();
	}
	if (json['goodsNo'] != null) {
		data.goodsNo = json['goodsNo'].toString();
	}
	if (json['detail'] != null) {
		data.detail = json['detail'].toString();
	}
	if (json['videoUrl'] != null) {
		data.videoUrl = json['videoUrl'];
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'].toString();
	}
	if (json['createUser'] != null) {
		data.createUser = json['createUser'] is String
				? int.tryParse(json['createUser'])
				: json['createUser'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['remarks'] != null) {
		data.remarks = json['remarks'];
	}
	if (json['collenction'] != null) {
		data.collenction = json['collenction'];
	}
	if (json['vectis'] != null) {
		data.vectis = json['vectis'];
	}
	if (json['videoName'] != null) {
		data.videoName = json['videoName'].toString();
	}
	if (json['goodsNum'] != null) {
		data.goodsNum = json['goodsNum'];
	}
	if (json['type'] != null) {
		data.type = json['type'];
	}
	if (json['createUserName'] != null) {
		data.createUserName = json['createUserName'];
	}
	if (json['classifyName'] != null) {
		data.classifyName = json['classifyName'];
	}
	if (json['brand'] != null) {
		data.brand = json['brand'];
	}
	if (json['goodType'] != null) {
		data.goodType = json['goodType'] is String
				? int.tryParse(json['goodType'])
				: json['goodType'].toInt();
	}
	if (json['appItemId'] != null) {
		data.appItemId = json['appItemId'].toString();
	}
	if (json['goodUrl'] != null) {
		data.goodUrl = json['goodUrl'].toString();
	}
	if (json['numType'] != null) {
		data.numType = json['numType'];
	}
	if (json['shareUrl'] != null) {
		data.shareUrl = json['shareUrl'].toString();
	}
	if (json['route'] != null) {
		data.route = json['route'].toString();
	}
	if (json['batch'] != null) {
		data.batch = json['batch'].toString();
	}
	if (json['batchDesc'] != null) {
		data.batchDesc = json['batchDesc'].toString();
	}
	if (json['pwd'] != null) {
		data.pwd = json['pwd'];
	}
	if (json['videoThumbnailUrl'] != null) {
		data.videoThumbnailUrl = json['videoThumbnailUrl'];
	}
	if (json['goodsDeatil'] != null) {
		data.goodsDeatil = json['goodsDeatil'];
	}
	if (json['tagName'] != null) {
		data.tagName = json['tagName'];
	}
	if (json['tagIds'] != null) {
		data.tagIds = json['tagIds'];
	}
	if (json['tagList'] != null) {
		data.tagList = (json['tagList'] as List).map((v) => PostModelPostGoodsTagList().fromJson(v)).toList();
	}
	if (json['avaliableStockNum'] != null) {
		data.avaliableStockNum = json['avaliableStockNum'] is String
				? int.tryParse(json['avaliableStockNum'])
				: json['avaliableStockNum'].toInt();
	}
	if (json['bannerImgsList'] != null) {
		data.bannerImgsList = json['bannerImgsList'];
	}
	if (json['originalPrice'] != null) {
		data.originalPrice = json['originalPrice'] is String
				? double.tryParse(json['originalPrice'])
				: json['originalPrice'].toDouble();
	}
	if (json['marketPrice'] != null) {
		data.marketPrice = json['marketPrice'] is String
				? double.tryParse(json['marketPrice'])
				: json['marketPrice'].toDouble();
	}
	if (json['classifyId'] != null) {
		data.classifyId = json['classifyId'] is String
				? int.tryParse(json['classifyId'])
				: json['classifyId'].toInt();
	}
	if (json['viedoName'] != null) {
		data.viedoName = json['viedoName'].toString();
	}
	return data;
}

Map<String, dynamic> postModelPostGoodsToJson(PostModelPostGoods entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['isSell'] = entity.isSell;
	data['floor'] = entity.floor;
	data['aFew'] = entity.aFew;
	data['bigSort'] = entity.bigSort;
	data['smallSort'] = entity.smallSort;
	data['isDelete'] = entity.isDelete;
	data['goodsBannerImgs'] = entity.goodsBannerImgs;
	data['goodsDetailImg'] = entity.goodsDetailImg;
	data['picUrl'] = entity.picUrl;
	data['picUrlProportion'] = entity.picUrlProportion;
	data['title'] = entity.title;
	data['species'] = entity.species;
	data['price'] = entity.price;
	data['goodsNo'] = entity.goodsNo;
	data['detail'] = entity.detail;
	data['videoUrl'] = entity.videoUrl;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['createUser'] = entity.createUser;
	data['status'] = entity.status;
	data['remarks'] = entity.remarks;
	data['collenction'] = entity.collenction;
	data['vectis'] = entity.vectis;
	data['videoName'] = entity.videoName;
	data['goodsNum'] = entity.goodsNum;
	data['type'] = entity.type;
	data['createUserName'] = entity.createUserName;
	data['classifyName'] = entity.classifyName;
	data['brand'] = entity.brand;
	data['goodType'] = entity.goodType;
	data['appItemId'] = entity.appItemId;
	data['goodUrl'] = entity.goodUrl;
	data['numType'] = entity.numType;
	data['shareUrl'] = entity.shareUrl;
	data['route'] = entity.route;
	data['batch'] = entity.batch;
	data['batchDesc'] = entity.batchDesc;
	data['pwd'] = entity.pwd;
	data['videoThumbnailUrl'] = entity.videoThumbnailUrl;
	data['goodsDeatil'] = entity.goodsDeatil;
	data['tagName'] = entity.tagName;
	data['tagIds'] = entity.tagIds;
	data['tagList'] =  entity.tagList?.map((v) => v.toJson())?.toList();
	data['avaliableStockNum'] = entity.avaliableStockNum;
	data['bannerImgsList'] = entity.bannerImgsList;
	data['originalPrice'] = entity.originalPrice;
	data['marketPrice'] = entity.marketPrice;
	data['classifyId'] = entity.classifyId;
	data['viedoName'] = entity.viedoName;
	return data;
}

postModelPostGoodsTagListFromJson(PostModelPostGoodsTagList data, Map<String, dynamic> json) {
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
	if (json['pages'] != null) {
		data.pages = json['pages'];
	}
	return data;
}

Map<String, dynamic> postModelPostGoodsTagListToJson(PostModelPostGoodsTagList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['postTagId'] = entity.postTagId;
	data['postTagName'] = entity.postTagName;
	data['tagIndex'] = entity.tagIndex;
	data['pages'] = entity.pages;
	return data;
}