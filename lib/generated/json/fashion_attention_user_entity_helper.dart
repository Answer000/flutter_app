import 'package:flutter_app/class/fashion/attention/fashion_attention_user_entity.dart';

fashionAttentionUserEntityFromJson(FashionAttentionUserEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode']?.toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new FashionAttentionUserData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> fashionAttentionUserEntityToJson(FashionAttentionUserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

fashionAttentionUserDataFromJson(FashionAttentionUserData data, Map<String, dynamic> json) {
	if (json['postList'] != null) {
		data.postList = new FashionAttentionUserDataPostList().fromJson(json['postList']);
	}
	return data;
}

Map<String, dynamic> fashionAttentionUserDataToJson(FashionAttentionUserData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.postList != null) {
		data['postList'] = entity.postList.toJson();
	}
	return data;
}

fashionAttentionUserDataPostListFromJson(FashionAttentionUserDataPostList data, Map<String, dynamic> json) {
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
		data.lists = new List<FashionAttentionUserDataPostListList>();
		(json['lists'] as List).forEach((v) {
			data.lists.add(new FashionAttentionUserDataPostListList().fromJson(v));
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

Map<String, dynamic> fashionAttentionUserDataPostListToJson(FashionAttentionUserDataPostList entity) {
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

fashionAttentionUserDataPostListListFromJson(FashionAttentionUserDataPostListList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['userAvatar'] != null) {
		data.userAvatar = json['userAvatar']?.toString();
	}
	if (json['nick'] != null) {
		data.nick = json['nick']?.toString();
	}
	if (json['attentionUser'] != null) {
		data.attentionUser = json['attentionUser']?.toString();
	}
	return data;
}

Map<String, dynamic> fashionAttentionUserDataPostListListToJson(FashionAttentionUserDataPostListList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userAvatar'] = entity.userAvatar;
	data['nick'] = entity.nick;
	data['attentionUser'] = entity.attentionUser;
	return data;
}