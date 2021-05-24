import 'package:flutter_app/class/home/home_banner_entity.dart';

homeBannerEntityFromJson(HomeBannerEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode'].toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = HomeBannerData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> homeBannerEntityToJson(HomeBannerEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

homeBannerDataFromJson(HomeBannerData data, Map<String, dynamic> json) {
	if (json['bannerList'] != null) {
		data.bannerList = (json['bannerList'] as List).map((v) => HomeBannerDataBannerList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> homeBannerDataToJson(HomeBannerData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['bannerList'] =  entity.bannerList?.map((v) => v.toJson())?.toList();
	return data;
}

homeBannerDataBannerListFromJson(HomeBannerDataBannerList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['activityId'] != null) {
		data.activityId = json['activityId'];
	}
	if (json['createUser'] != null) {
		data.createUser = json['createUser'];
	}
	if (json['linkUrl'] != null) {
		data.linkUrl = json['linkUrl'].toString();
	}
	if (json['videoUrl'] != null) {
		data.videoUrl = json['videoUrl'].toString();
	}
	if (json['orderStatus'] != null) {
		data.orderStatus = json['orderStatus'] is String
				? int.tryParse(json['orderStatus'])
				: json['orderStatus'].toInt();
	}
	if (json['route'] != null) {
		data.route = json['route'].toString();
	}
	if (json['postId'] != null) {
		data.postId = json['postId'] is String
				? int.tryParse(json['postId'])
				: json['postId'].toInt();
	}
	if (json['createUserName'] != null) {
		data.createUserName = json['createUserName'].toString();
	}
	if (json['strStatus'] != null) {
		data.strStatus = json['strStatus'].toString();
	}
	return data;
}

Map<String, dynamic> homeBannerDataBannerListToJson(HomeBannerDataBannerList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['picUrl'] = entity.picUrl;
	data['status'] = entity.status;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['type'] = entity.type;
	data['activityId'] = entity.activityId;
	data['createUser'] = entity.createUser;
	data['linkUrl'] = entity.linkUrl;
	data['videoUrl'] = entity.videoUrl;
	data['orderStatus'] = entity.orderStatus;
	data['route'] = entity.route;
	data['postId'] = entity.postId;
	data['createUserName'] = entity.createUserName;
	data['strStatus'] = entity.strStatus;
	return data;
}