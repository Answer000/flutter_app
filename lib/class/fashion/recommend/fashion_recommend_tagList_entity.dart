import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class FashionRecommendTagListEntity with JsonConvert<FashionRecommendTagListEntity> {
	String resultCode;
	String msg;
	FashionRecommendTagListData data;
}

class FashionRecommendTagListData with JsonConvert<FashionRecommendTagListData> {
	FashionRecommendTagListDataPostTags postTags;
}

class FashionRecommendTagListDataPostTags with JsonConvert<FashionRecommendTagListDataPostTags> {
	int pageNum;
	int pageSize;
	int total;
	int pages;
	List<FashionRecommendTagListDataPostTagsLists> lists;
	bool isFirstPage;
	bool isLastPage;
}

class FashionRecommendTagListDataPostTagsLists with JsonConvert<FashionRecommendTagListDataPostTagsLists> {
	int postTagId;
	String postTagName;
	int tagIndex;
}
