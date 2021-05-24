import 'package:flutter_app/class/fashion/recommend/fashion_recommend_tagList_entity.dart';

fashionRecommendTagListEntityFromJson(FashionRecommendTagListEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode'].toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = FashionRecommendTagListData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> fashionRecommendTagListEntityToJson(FashionRecommendTagListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

fashionRecommendTagListDataFromJson(FashionRecommendTagListData data, Map<String, dynamic> json) {
	if (json['postTags'] != null) {
		data.postTags = FashionRecommendTagListDataPostTags().fromJson(json['postTags']);
	}
	return data;
}

Map<String, dynamic> fashionRecommendTagListDataToJson(FashionRecommendTagListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['postTags'] = entity.postTags?.toJson();
	return data;
}

fashionRecommendTagListDataPostTagsFromJson(FashionRecommendTagListDataPostTags data, Map<String, dynamic> json) {
	if (json['pageNum'] != null) {
		data.pageNum = json['pageNum'] is String
				? int.tryParse(json['pageNum'])
				: json['pageNum'].toInt();
	}
	if (json['pageSize'] != null) {
		data.pageSize = json['pageSize'] is String
				? int.tryParse(json['pageSize'])
				: json['pageSize'].toInt();
	}
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	if (json['pages'] != null) {
		data.pages = json['pages'] is String
				? int.tryParse(json['pages'])
				: json['pages'].toInt();
	}
	if (json['lists'] != null) {
		data.lists = (json['lists'] as List).map((v) => FashionRecommendTagListDataPostTagsLists().fromJson(v)).toList();
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
	data['lists'] =  entity.lists?.map((v) => v.toJson())?.toList();
	data['isFirstPage'] = entity.isFirstPage;
	data['isLastPage'] = entity.isLastPage;
	return data;
}

fashionRecommendTagListDataPostTagsListsFromJson(FashionRecommendTagListDataPostTagsLists data, Map<String, dynamic> json) {
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

Map<String, dynamic> fashionRecommendTagListDataPostTagsListsToJson(FashionRecommendTagListDataPostTagsLists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['postTagId'] = entity.postTagId;
	data['postTagName'] = entity.postTagName;
	data['tagIndex'] = entity.tagIndex;
	return data;
}