import 'package:flutter_app/class/profile/integral/detail/myIntegral_detail_data_entity.dart';

myIntegralDetailDataEntityFromJson(MyIntegralDetailDataEntity data, Map<String, dynamic> json) {
	if (json['resultCode'] != null) {
		data.resultCode = json['resultCode'].toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = MyIntegralDetailDataData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> myIntegralDetailDataEntityToJson(MyIntegralDetailDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['resultCode'] = entity.resultCode;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

myIntegralDetailDataDataFromJson(MyIntegralDetailDataData data, Map<String, dynamic> json) {
	if (json['integralList'] != null) {
		data.integralList = MyIntegralDetailDataDataIntegralList().fromJson(json['integralList']);
	}
	return data;
}

Map<String, dynamic> myIntegralDetailDataDataToJson(MyIntegralDetailDataData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['integralList'] = entity.integralList?.toJson();
	return data;
}

myIntegralDetailDataDataIntegralListFromJson(MyIntegralDetailDataDataIntegralList data, Map<String, dynamic> json) {
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
		data.lists = (json['lists'] as List).map((v) => MyIntegralDetailDataDataIntegralListLists().fromJson(v)).toList();
	}
	if (json['isFirstPage'] != null) {
		data.isFirstPage = json['isFirstPage'];
	}
	if (json['isLastPage'] != null) {
		data.isLastPage = json['isLastPage'];
	}
	return data;
}

Map<String, dynamic> myIntegralDetailDataDataIntegralListToJson(MyIntegralDetailDataDataIntegralList entity) {
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

myIntegralDetailDataDataIntegralListListsFromJson(MyIntegralDetailDataDataIntegralListLists data, Map<String, dynamic> json) {
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
	if (json['integral'] != null) {
		data.integral = json['integral'] is String
				? int.tryParse(json['integral'])
				: json['integral'].toInt();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['orderId'] != null) {
		data.orderId = json['orderId'];
	}
	if (json['dbOrderId'] != null) {
		data.dbOrderId = json['dbOrderId'];
	}
	if (json['ref'] != null) {
		data.ref = json['ref'].toString();
	}
	if (json['notRealAddReason'] != null) {
		data.notRealAddReason = json['notRealAddReason'];
	}
	if (json['distinctId'] != null) {
		data.distinctId = json['distinctId'];
	}
	return data;
}

Map<String, dynamic> myIntegralDetailDataDataIntegralListListsToJson(MyIntegralDetailDataDataIntegralListLists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['type'] = entity.type;
	data['integral'] = entity.integral;
	data['description'] = entity.description;
	data['orderId'] = entity.orderId;
	data['dbOrderId'] = entity.dbOrderId;
	data['ref'] = entity.ref;
	data['notRealAddReason'] = entity.notRealAddReason;
	data['distinctId'] = entity.distinctId;
	return data;
}