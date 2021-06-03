import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class CommentModelEntity with JsonConvert<CommentModelEntity> {
	int id;
	int userId;
	String content;
	int postId;
	int praiseNum;
	String createTime;
	String updateTime;
	String createUser;
	int status;
	int isPraise;
	int beCommentUserId;
	int beCommentId;
	int parentCommentId;
	int level;
	int selfLevel;
	String commentContent;
	String beCommentContent;
	String userNick;
	String beCommentUserNick;
	String nick;
	String userAvatar;
	String postContent;
	String postTitle;
	String userNo;
	int readType;
	String name;
	int commentReplyId;
	int replyId;
	String verifyType;
	String verifyTypeIcon;
	CommentModelCommentReply commentReply;
	String strStatus;
}

class CommentModelCommentReply with JsonConvert<CommentModelCommentReply> {
	int total;
	List<CommentModelCommentReplyCommentReplyList> commentReplyList;
}

class CommentModelCommentReplyCommentReplyList with JsonConvert<CommentModelCommentReplyCommentReplyList> {
	int id;
	int postId;
	int userId;
	int commentId;
	String createTime;
	String updateTime;
	int status;
	int beCommentUserId;
	int level;
	int parentCommentId;
	String userNick;
	String beCommentUserNick;
	int selfLevel;
	String userAvatar;
	int beCommentStatus;
	String commentContent;
	String beCommentContent;
	String verifyType;
	String verifyTypeIcon;
	String beVerifyType;
	String beVerifyTypeIcon;
}
