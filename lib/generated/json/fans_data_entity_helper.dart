import 'package:flutter_app/class/profile/fans/fans_data_entity.dart';

fansDataEntityFromJson(FansDataEntity data, Map<String, dynamic> json) {
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
		data.pastContent = FansDataPastContent().fromJson(json['pastContent']);
	}
	return data;
}

Map<String, dynamic> fansDataEntityToJson(FansDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['newHint'] = entity.newHint;
	data['total'] = entity.total;
	data['newContent'] = entity.newContent;
	data['num'] = entity.num;
	data['pastContent'] = entity.pastContent?.toJson();
	return data;
}

fansDataPastContentFromJson(FansDataPastContent data, Map<String, dynamic> json) {
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
		data.lists = (json['lists'] as List).map((v) => FansDataPastContentLists().fromJson(v)).toList();
	}
	if (json['isFirstPage'] != null) {
		data.isFirstPage = json['isFirstPage'];
	}
	if (json['isLastPage'] != null) {
		data.isLastPage = json['isLastPage'];
	}
	return data;
}

Map<String, dynamic> fansDataPastContentToJson(FansDataPastContent entity) {
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

fansDataPastContentListsFromJson(FansDataPastContentLists data, Map<String, dynamic> json) {
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

Map<String, dynamic> fansDataPastContentListsToJson(FansDataPastContentLists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['createTime'] = entity.createTime;
	data['num'] = entity.num;
	data['pastContent'] = entity.pastContent;
	return data;
}