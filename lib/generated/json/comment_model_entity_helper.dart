import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';

commentModelEntityFromJson(CommentModelEntity data, Map<String, dynamic> json) {
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
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['postId'] != null) {
		data.postId = json['postId'] is String
				? int.tryParse(json['postId'])
				: json['postId'].toInt();
	}
	if (json['praiseNum'] != null) {
		data.praiseNum = json['praiseNum'] is String
				? int.tryParse(json['praiseNum'])
				: json['praiseNum'].toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'].toString();
	}
	if (json['createUser'] != null) {
		data.createUser = json['createUser'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['isPraise'] != null) {
		data.isPraise = json['isPraise'] is String
				? int.tryParse(json['isPraise'])
				: json['isPraise'].toInt();
	}
	if (json['beCommentUserId'] != null) {
		data.beCommentUserId = json['beCommentUserId'] is String
				? int.tryParse(json['beCommentUserId'])
				: json['beCommentUserId'].toInt();
	}
	if (json['beCommentId'] != null) {
		data.beCommentId = json['beCommentId'] is String
				? int.tryParse(json['beCommentId'])
				: json['beCommentId'].toInt();
	}
	if (json['parentCommentId'] != null) {
		data.parentCommentId = json['parentCommentId'] is String
				? int.tryParse(json['parentCommentId'])
				: json['parentCommentId'].toInt();
	}
	if (json['level'] != null) {
		data.level = json['level'] is String
				? int.tryParse(json['level'])
				: json['level'].toInt();
	}
	if (json['selfLevel'] != null) {
		data.selfLevel = json['selfLevel'] is String
				? int.tryParse(json['selfLevel'])
				: json['selfLevel'].toInt();
	}
	if (json['commentContent'] != null) {
		data.commentContent = json['commentContent'].toString();
	}
	if (json['beCommentContent'] != null) {
		data.beCommentContent = json['beCommentContent'].toString();
	}
	if (json['userNick'] != null) {
		data.userNick = json['userNick'].toString();
	}
	if (json['beCommentUserNick'] != null) {
		data.beCommentUserNick = json['beCommentUserNick'].toString();
	}
	if (json['nick'] != null) {
		data.nick = json['nick'].toString();
	}
	if (json['userAvatar'] != null) {
		data.userAvatar = json['userAvatar'].toString();
	}
	if (json['postContent'] != null) {
		data.postContent = json['postContent'].toString();
	}
	if (json['postTitle'] != null) {
		data.postTitle = json['postTitle'].toString();
	}
	if (json['userNo'] != null) {
		data.userNo = json['userNo'].toString();
	}
	if (json['readType'] != null) {
		data.readType = json['readType'] is String
				? int.tryParse(json['readType'])
				: json['readType'].toInt();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['commentReplyId'] != null) {
		data.commentReplyId = json['commentReplyId'] is String
				? int.tryParse(json['commentReplyId'])
				: json['commentReplyId'].toInt();
	}
	if (json['replyId'] != null) {
		data.replyId = json['replyId'] is String
				? int.tryParse(json['replyId'])
				: json['replyId'].toInt();
	}
	if (json['verifyType'] != null) {
		data.verifyType = json['verifyType'].toString();
	}
	if (json['verifyTypeIcon'] != null) {
		data.verifyTypeIcon = json['verifyTypeIcon'].toString();
	}
	if (json['commentReply'] != null) {
		data.commentReply = CommentModelCommentReply().fromJson(json['commentReply']);
	}
	if (json['strStatus'] != null) {
		data.strStatus = json['strStatus'].toString();
	}
	return data;
}

Map<String, dynamic> commentModelEntityToJson(CommentModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['userId'] = entity.userId;
	data['content'] = entity.content;
	data['postId'] = entity.postId;
	data['praiseNum'] = entity.praiseNum;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['createUser'] = entity.createUser;
	data['status'] = entity.status;
	data['isPraise'] = entity.isPraise;
	data['beCommentUserId'] = entity.beCommentUserId;
	data['beCommentId'] = entity.beCommentId;
	data['parentCommentId'] = entity.parentCommentId;
	data['level'] = entity.level;
	data['selfLevel'] = entity.selfLevel;
	data['commentContent'] = entity.commentContent;
	data['beCommentContent'] = entity.beCommentContent;
	data['userNick'] = entity.userNick;
	data['beCommentUserNick'] = entity.beCommentUserNick;
	data['nick'] = entity.nick;
	data['userAvatar'] = entity.userAvatar;
	data['postContent'] = entity.postContent;
	data['postTitle'] = entity.postTitle;
	data['userNo'] = entity.userNo;
	data['readType'] = entity.readType;
	data['name'] = entity.name;
	data['commentReplyId'] = entity.commentReplyId;
	data['replyId'] = entity.replyId;
	data['verifyType'] = entity.verifyType;
	data['verifyTypeIcon'] = entity.verifyTypeIcon;
	data['commentReply'] = entity.commentReply?.toJson();
	data['strStatus'] = entity.strStatus;
	return data;
}

commentModelCommentReplyFromJson(CommentModelCommentReply data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	if (json['commentReplyList'] != null) {
		data.commentReplyList = (json['commentReplyList'] as List).map((v) => CommentModelCommentReplyCommentReplyList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> commentModelCommentReplyToJson(CommentModelCommentReply entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['commentReplyList'] =  entity.commentReplyList?.map((v) => v.toJson())?.toList();
	return data;
}

commentModelCommentReplyCommentReplyListFromJson(CommentModelCommentReplyCommentReplyList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['postId'] != null) {
		data.postId = json['postId'] is String
				? int.tryParse(json['postId'])
				: json['postId'].toInt();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'] is String
				? int.tryParse(json['userId'])
				: json['userId'].toInt();
	}
	if (json['commentId'] != null) {
		data.commentId = json['commentId'] is String
				? int.tryParse(json['commentId'])
				: json['commentId'].toInt();
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
	if (json['beCommentUserId'] != null) {
		data.beCommentUserId = json['beCommentUserId'] is String
				? int.tryParse(json['beCommentUserId'])
				: json['beCommentUserId'].toInt();
	}
	if (json['level'] != null) {
		data.level = json['level'] is String
				? int.tryParse(json['level'])
				: json['level'].toInt();
	}
	if (json['parentCommentId'] != null) {
		data.parentCommentId = json['parentCommentId'] is String
				? int.tryParse(json['parentCommentId'])
				: json['parentCommentId'].toInt();
	}
	if (json['userNick'] != null) {
		data.userNick = json['userNick'].toString();
	}
	if (json['beCommentUserNick'] != null) {
		data.beCommentUserNick = json['beCommentUserNick'].toString();
	}
	if (json['selfLevel'] != null) {
		data.selfLevel = json['selfLevel'] is String
				? int.tryParse(json['selfLevel'])
				: json['selfLevel'].toInt();
	}
	if (json['userAvatar'] != null) {
		data.userAvatar = json['userAvatar'].toString();
	}
	if (json['beCommentStatus'] != null) {
		data.beCommentStatus = json['beCommentStatus'] is String
				? int.tryParse(json['beCommentStatus'])
				: json['beCommentStatus'].toInt();
	}
	if (json['commentContent'] != null) {
		data.commentContent = json['commentContent'].toString();
	}
	if (json['beCommentContent'] != null) {
		data.beCommentContent = json['beCommentContent'].toString();
	}
	if (json['verifyType'] != null) {
		data.verifyType = json['verifyType'].toString();
	}
	if (json['verifyTypeIcon'] != null) {
		data.verifyTypeIcon = json['verifyTypeIcon'].toString();
	}
	if (json['beVerifyType'] != null) {
		data.beVerifyType = json['beVerifyType'].toString();
	}
	if (json['beVerifyTypeIcon'] != null) {
		data.beVerifyTypeIcon = json['beVerifyTypeIcon'].toString();
	}
	return data;
}

Map<String, dynamic> commentModelCommentReplyCommentReplyListToJson(CommentModelCommentReplyCommentReplyList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['postId'] = entity.postId;
	data['userId'] = entity.userId;
	data['commentId'] = entity.commentId;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['status'] = entity.status;
	data['beCommentUserId'] = entity.beCommentUserId;
	data['level'] = entity.level;
	data['parentCommentId'] = entity.parentCommentId;
	data['userNick'] = entity.userNick;
	data['beCommentUserNick'] = entity.beCommentUserNick;
	data['selfLevel'] = entity.selfLevel;
	data['userAvatar'] = entity.userAvatar;
	data['beCommentStatus'] = entity.beCommentStatus;
	data['commentContent'] = entity.commentContent;
	data['beCommentContent'] = entity.beCommentContent;
	data['verifyType'] = entity.verifyType;
	data['verifyTypeIcon'] = entity.verifyTypeIcon;
	data['beVerifyType'] = entity.beVerifyType;
	data['beVerifyTypeIcon'] = entity.beVerifyTypeIcon;
	return data;
}