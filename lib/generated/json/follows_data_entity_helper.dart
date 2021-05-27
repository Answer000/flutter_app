import 'package:flutter_app/class/profile/follows/follows_data_entity.dart';

followsDataEntityFromJson(FollowsDataEntity data, Map<String, dynamic> json) {
	if (json['postList'] != null) {
		data.postList = FollowsDataPostList().fromJson(json['postList']);
	}
	return data;
}

Map<String, dynamic> followsDataEntityToJson(FollowsDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['postList'] = entity.postList?.toJson();
	return data;
}

followsDataPostListFromJson(FollowsDataPostList data, Map<String, dynamic> json) {
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
		data.lists = (json['lists'] as List).map((v) => FollowsDataPostListLists().fromJson(v)).toList();
	}
	if (json['isFirstPage'] != null) {
		data.isFirstPage = json['isFirstPage'];
	}
	if (json['isLastPage'] != null) {
		data.isLastPage = json['isLastPage'];
	}
	return data;
}

Map<String, dynamic> followsDataPostListToJson(FollowsDataPostList entity) {
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

followsDataPostListListsFromJson(FollowsDataPostListLists data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['userAvatar'] != null) {
		data.userAvatar = json['userAvatar'].toString();
	}
	if (json['nick'] != null) {
		data.nick = json['nick'].toString();
	}
	if (json['attentionUser'] != null) {
		data.attentionUser = json['attentionUser'].toString();
	}
	if (json['verifyType'] != null) {
		data.verifyType = json['verifyType'].toString();
	}
	if (json['verifyTypeIcon'] != null) {
		data.verifyTypeIcon = json['verifyTypeIcon'].toString();
	}
	return data;
}

Map<String, dynamic> followsDataPostListListsToJson(FollowsDataPostListLists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userAvatar'] = entity.userAvatar;
	data['nick'] = entity.nick;
	data['attentionUser'] = entity.attentionUser;
	data['verifyType'] = entity.verifyType;
	data['verifyTypeIcon'] = entity.verifyTypeIcon;
	return data;
}