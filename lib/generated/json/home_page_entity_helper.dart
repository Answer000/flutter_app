import 'package:flutter_app/class/home/home_page_entity.dart';

homePageEntityFromJson(HomePageEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode'].toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = HomePageData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> homePageEntityToJson(HomePageEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

homePageDataFromJson(HomePageData data, Map<String, dynamic> json) {
	if (json['recommendList'] != null) {
		data.recommendList = HomePageDataRecommendList().fromJson(json['recommendList']);
	}
	return data;
}

Map<String, dynamic> homePageDataToJson(HomePageData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['recommendList'] = entity.recommendList?.toJson();
	return data;
}

homePageDataRecommendListFromJson(HomePageDataRecommendList data, Map<String, dynamic> json) {
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
		data.lists = (json['lists'] as List).map((v) => HomePageDataRecommandListLists().fromJson(v)).toList();
	}
	if (json['isFirstPage'] != null) {
		data.isFirstPage = json['isFirstPage'];
	}
	if (json['isLastPage'] != null) {
		data.isLastPage = json['isLastPage'];
	}
	return data;
}

Map<String, dynamic> homePageDataRecommendListToJson(HomePageDataRecommendList entity) {
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

homePageDataRecommandListListsFromJson(HomePageDataRecommandListLists data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['createUser'] != null) {
		data.createUser = json['createUser'] is String
				? int.tryParse(json['createUser'])
				: json['createUser'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl'].toString();
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
	if (json['orderStatus'] != null) {
		data.orderStatus = json['orderStatus'] is String
				? int.tryParse(json['orderStatus'])
				: json['orderStatus'].toInt();
	}
	if (json['remarks'] != null) {
		data.remarks = json['remarks'];
	}
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['linkUrl'] != null) {
		data.linkUrl = json['linkUrl'].toString();
	}
	if (json['postId'] != null) {
		data.postId = json['postId'] is String
				? int.tryParse(json['postId'])
				: json['postId'].toInt();
	}
	if (json['isVideo'] != null) {
		data.isVideo = json['isVideo'];
	}
	if (json['route'] != null) {
		data.route = json['route'].toString();
	}
	if (json['strStatus'] != null) {
		data.strStatus = json['strStatus'].toString();
	}
	return data;
}

Map<String, dynamic> homePageDataRecommandListListsToJson(HomePageDataRecommandListLists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['createUser'] = entity.createUser;
	data['title'] = entity.title;
	data['picUrl'] = entity.picUrl;
	data['videoUrl'] = entity.videoUrl;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['status'] = entity.status;
	data['orderStatus'] = entity.orderStatus;
	data['remarks'] = entity.remarks;
	data['type'] = entity.type;
	data['linkUrl'] = entity.linkUrl;
	data['postId'] = entity.postId;
	data['isVideo'] = entity.isVideo;
	data['route'] = entity.route;
	data['strStatus'] = entity.strStatus;
	return data;
}