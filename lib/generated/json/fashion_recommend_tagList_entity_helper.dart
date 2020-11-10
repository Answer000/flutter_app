import 'package:flutter_app/class/fashion/recommend/fashion_recommend_tagList_entity.dart';

fashionRecommendTagListEntityFromJson(FashionRecommendTagListEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode']?.toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new FashionRecommendTagListData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> fashionRecommendTagListEntityToJson(FashionRecommendTagListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

fashionRecommendTagListDataFromJson(FashionRecommendTagListData data, Map<String, dynamic> json) {
	if (json['postTags'] != null) {
		data.postTags = new FashionRecommendTagListDataPostTags().fromJson(json['postTags']);
	}
	return data;
}

Map<String, dynamic> fashionRecommendTagListDataToJson(FashionRecommendTagListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.postTags != null) {
		data['postTags'] = entity.postTags.toJson();
	}
	return data;
}

fashionRecommendTagListDataPostTagsFromJson(FashionRecommendTagListDataPostTags data, Map<String, dynamic> json) {
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
		data.lists = new List<FashionRecommandTagListDataPostTagsLists>();
		(json['lists'] as List).forEach((v) {
			data.lists.add(new FashionRecommandTagListDataPostTagsLists().fromJson(v));
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

Map<String, dynamic> fashionRecommendTagListDataPostTagsToJson(FashionRecommendTagListDataPostTags entity) {
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

fashionRecommandTagListDataPostTagsListsFromJson(FashionRecommandTagListDataPostTagsLists data, Map<String, dynamic> json) {
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

Map<String, dynamic> fashionRecommandTagListDataPostTagsListsToJson(FashionRecommandTagListDataPostTagsLists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['postTagId'] = entity.postTagId;
	data['postTagName'] = entity.postTagName;
	data['tagIndex'] = entity.tagIndex;
	return data;
}