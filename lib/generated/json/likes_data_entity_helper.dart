import 'package:flutter_app/class/profile/likes/likes_data_entity.dart';

likesDataEntityFromJson(LikesDataEntity data, Map<String, dynamic> json) {
	if (json['newHint'] != null) {
		data.newHint = json['newHint'].toString();
	}
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	if (json['newContent'] != null) {
		data.newContent = json['newContent'].toString();
	}
	if (json['num'] != null) {
		data.num = json['num'] is String
				? int.tryParse(json['num'])
				: json['num'].toInt();
	}
	if (json['pastContent'] != null) {
		data.pastContent = LikesDataPastContent().fromJson(json['pastContent']);
	}
	return data;
}

Map<String, dynamic> likesDataEntityToJson(LikesDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['newHint'] = entity.newHint;
	data['total'] = entity.total;
	data['newContent'] = entity.newContent;
	data['num'] = entity.num;
	data['pastContent'] = entity.pastContent?.toJson();
	return data;
}

likesDataPastContentFromJson(LikesDataPastContent data, Map<String, dynamic> json) {
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
		data.lists = (json['lists'] as List).map((v) => LikesDataPastContentLists().fromJson(v)).toList();
	}
	if (json['isFirstPage'] != null) {
		data.isFirstPage = json['isFirstPage'];
	}
	if (json['isLastPage'] != null) {
		data.isLastPage = json['isLastPage'];
	}
	return data;
}

Map<String, dynamic> likesDataPastContentToJson(LikesDataPastContent entity) {
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

likesDataPastContentListsFromJson(LikesDataPastContentLists data, Map<String, dynamic> json) {
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	if (json['num'] != null) {
		data.num = json['num'] is String
				? int.tryParse(json['num'])
				: json['num'].toInt();
	}
	if (json['pastContent'] != null) {
		data.pastContent = json['pastContent'].toString();
	}
	return data;
}

Map<String, dynamic> likesDataPastContentListsToJson(LikesDataPastContentLists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['createTime'] = entity.createTime;
	data['num'] = entity.num;
	data['pastContent'] = entity.pastContent;
	return data;
}