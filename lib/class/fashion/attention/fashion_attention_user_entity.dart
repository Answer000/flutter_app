import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class FashionAttentionUserEntity with JsonConvert<FashionAttentionUserEntity> {
	String resultCode;
	String msg;
	FashionAttentionUserData data;
}

class FashionAttentionUserData with JsonConvert<FashionAttentionUserData> {
	FashionAttentionUserDataPostList postList;
}

class FashionAttentionUserDataPostList with JsonConvert<FashionAttentionUserDataPostList> {
	int pageNum;
	int pageSize;
	int total;
	int pages;
	List<FashionAttentionUserDataPostListList> lists;
	bool isFirstPage;
	bool isLastPage;
}

class FashionAttentionUserDataPostListList with JsonConvert<FashionAttentionUserDataPostListList> {
	int id;
	String userAvatar;
	String nick;
	String attentionUser;
}
