// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_app/class/fashion/attention/fashion_attention_user_entity.dart';
import 'package:flutter_app/generated/json/fashion_attention_user_entity_helper.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';
import 'package:flutter_app/generated/json/comment_model_entity_helper.dart';
import 'package:flutter_app/class/profile/follows/follows_data_entity.dart';
import 'package:flutter_app/generated/json/follows_data_entity_helper.dart';
import 'package:flutter_app/class/fashion/recommend/fashion_recommend_tagList_entity.dart';
import 'package:flutter_app/generated/json/fashion_recommend_tagList_entity_helper.dart';
import 'package:flutter_app/class/login/login_entity.dart';
import 'package:flutter_app/generated/json/login_entity_helper.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/generated/json/post_model_entity_helper.dart';
import 'package:flutter_app/class/profile/profile_info_entity.dart';
import 'package:flutter_app/generated/json/profile_info_entity_helper.dart';
import 'package:flutter_app/class/profile/likes/likes_data_entity.dart';
import 'package:flutter_app/generated/json/likes_data_entity_helper.dart';
import 'package:flutter_app/class/profile/integral/detail/myIntegral_detail_data_entity.dart';
import 'package:flutter_app/generated/json/myIntegral_detail_data_entity_helper.dart';
import 'package:flutter_app/class/profile/integral/myIntegral_data_entity.dart';
import 'package:flutter_app/generated/json/myIntegral_data_entity_helper.dart';
import 'package:flutter_app/class/home/home_page_entity.dart';
import 'package:flutter_app/generated/json/home_page_entity_helper.dart';
import 'package:flutter_app/class/profile/fans/fans_data_entity.dart';
import 'package:flutter_app/generated/json/fans_data_entity_helper.dart';
import 'package:flutter_app/class/home/home_banner_entity.dart';
import 'package:flutter_app/generated/json/home_banner_entity_helper.dart';
import 'package:flutter_app/class/profile/personal/otherPersonal/otherPersonal_info_entity.dart';
import 'package:flutter_app/generated/json/otherPersonal_info_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case FashionAttentionUserEntity:
				return fashionAttentionUserEntityFromJson(data as FashionAttentionUserEntity, json) as T;
			case FashionAttentionUserData:
				return fashionAttentionUserDataFromJson(data as FashionAttentionUserData, json) as T;
			case FashionAttentionUserDataPostList:
				return fashionAttentionUserDataPostListFromJson(data as FashionAttentionUserDataPostList, json) as T;
			case FashionAttentionUserDataPostListList:
				return fashionAttentionUserDataPostListListFromJson(data as FashionAttentionUserDataPostListList, json) as T;
			case CommentModelEntity:
				return commentModelEntityFromJson(data as CommentModelEntity, json) as T;
			case CommentModelCommentReply:
				return commentModelCommentReplyFromJson(data as CommentModelCommentReply, json) as T;
			case CommentModelCommentReplyCommentReplyList:
				return commentModelCommentReplyCommentReplyListFromJson(data as CommentModelCommentReplyCommentReplyList, json) as T;
			case FollowsDataEntity:
				return followsDataEntityFromJson(data as FollowsDataEntity, json) as T;
			case FollowsDataPostList:
				return followsDataPostListFromJson(data as FollowsDataPostList, json) as T;
			case FollowsDataPostListLists:
				return followsDataPostListListsFromJson(data as FollowsDataPostListLists, json) as T;
			case FashionRecommendTagListEntity:
				return fashionRecommendTagListEntityFromJson(data as FashionRecommendTagListEntity, json) as T;
			case FashionRecommendTagListData:
				return fashionRecommendTagListDataFromJson(data as FashionRecommendTagListData, json) as T;
			case FashionRecommendTagListDataPostTags:
				return fashionRecommendTagListDataPostTagsFromJson(data as FashionRecommendTagListDataPostTags, json) as T;
			case FashionRecommendTagListDataPostTagsLists:
				return fashionRecommendTagListDataPostTagsListsFromJson(data as FashionRecommendTagListDataPostTagsLists, json) as T;
			case LoginEntity:
				return loginEntityFromJson(data as LoginEntity, json) as T;
			case LoginData:
				return loginDataFromJson(data as LoginData, json) as T;
			case PostModelEntity:
				return postModelEntityFromJson(data as PostModelEntity, json) as T;
			case PostModelPostImgList:
				return postModelPostImgListFromJson(data as PostModelPostImgList, json) as T;
			case PostModelPostTags:
				return postModelPostTagsFromJson(data as PostModelPostTags, json) as T;
			case PostModelPostTopics:
				return postModelPostTopicsFromJson(data as PostModelPostTopics, json) as T;
			case PostModelPostGoods:
				return postModelPostGoodsFromJson(data as PostModelPostGoods, json) as T;
			case PostModelPostGoodsTagList:
				return postModelPostGoodsTagListFromJson(data as PostModelPostGoodsTagList, json) as T;
			case ProfileInfoEntity:
				return profileInfoEntityFromJson(data as ProfileInfoEntity, json) as T;
			case ProfileInfoData:
				return profileInfoDataFromJson(data as ProfileInfoData, json) as T;
			case ProfileInfoDataUser:
				return profileInfoDataUserFromJson(data as ProfileInfoDataUser, json) as T;
			case LikesDataEntity:
				return likesDataEntityFromJson(data as LikesDataEntity, json) as T;
			case LikesDataPastContent:
				return likesDataPastContentFromJson(data as LikesDataPastContent, json) as T;
			case LikesDataPastContentLists:
				return likesDataPastContentListsFromJson(data as LikesDataPastContentLists, json) as T;
			case MyIntegralDetailDataEntity:
				return myIntegralDetailDataEntityFromJson(data as MyIntegralDetailDataEntity, json) as T;
			case MyIntegralDetailDataData:
				return myIntegralDetailDataDataFromJson(data as MyIntegralDetailDataData, json) as T;
			case MyIntegralDetailDataDataIntegralList:
				return myIntegralDetailDataDataIntegralListFromJson(data as MyIntegralDetailDataDataIntegralList, json) as T;
			case MyIntegralDetailDataDataIntegralListLists:
				return myIntegralDetailDataDataIntegralListListsFromJson(data as MyIntegralDetailDataDataIntegralListLists, json) as T;
			case MyIntegralDataEntity:
				return myIntegralDataEntityFromJson(data as MyIntegralDataEntity, json) as T;
			case MyIntegralDataData:
				return myIntegralDataDataFromJson(data as MyIntegralDataData, json) as T;
			case MyIntegralDataDataMissionList:
				return myIntegralDataDataMissionListFromJson(data as MyIntegralDataDataMissionList, json) as T;
			case HomePageEntity:
				return homePageEntityFromJson(data as HomePageEntity, json) as T;
			case HomePageData:
				return homePageDataFromJson(data as HomePageData, json) as T;
			case HomePageDataRecommendList:
				return homePageDataRecommendListFromJson(data as HomePageDataRecommendList, json) as T;
			case HomePageDataRecommandListLists:
				return homePageDataRecommandListListsFromJson(data as HomePageDataRecommandListLists, json) as T;
			case FansDataEntity:
				return fansDataEntityFromJson(data as FansDataEntity, json) as T;
			case FansDataPastContent:
				return fansDataPastContentFromJson(data as FansDataPastContent, json) as T;
			case FansDataPastContentLists:
				return fansDataPastContentListsFromJson(data as FansDataPastContentLists, json) as T;
			case HomeBannerEntity:
				return homeBannerEntityFromJson(data as HomeBannerEntity, json) as T;
			case HomeBannerData:
				return homeBannerDataFromJson(data as HomeBannerData, json) as T;
			case HomeBannerDataBannerList:
				return homeBannerDataBannerListFromJson(data as HomeBannerDataBannerList, json) as T;
			case OtherPersonalInfoEntity:
				return otherPersonalInfoEntityFromJson(data as OtherPersonalInfoEntity, json) as T;
			case OtherPersonalInfoData:
				return otherPersonalInfoDataFromJson(data as OtherPersonalInfoData, json) as T;
			case OtherPersonalInfoDataUser:
				return otherPersonalInfoDataUserFromJson(data as OtherPersonalInfoDataUser, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case FashionAttentionUserEntity:
				return fashionAttentionUserEntityToJson(data as FashionAttentionUserEntity);
			case FashionAttentionUserData:
				return fashionAttentionUserDataToJson(data as FashionAttentionUserData);
			case FashionAttentionUserDataPostList:
				return fashionAttentionUserDataPostListToJson(data as FashionAttentionUserDataPostList);
			case FashionAttentionUserDataPostListList:
				return fashionAttentionUserDataPostListListToJson(data as FashionAttentionUserDataPostListList);
			case CommentModelEntity:
				return commentModelEntityToJson(data as CommentModelEntity);
			case CommentModelCommentReply:
				return commentModelCommentReplyToJson(data as CommentModelCommentReply);
			case CommentModelCommentReplyCommentReplyList:
				return commentModelCommentReplyCommentReplyListToJson(data as CommentModelCommentReplyCommentReplyList);
			case FollowsDataEntity:
				return followsDataEntityToJson(data as FollowsDataEntity);
			case FollowsDataPostList:
				return followsDataPostListToJson(data as FollowsDataPostList);
			case FollowsDataPostListLists:
				return followsDataPostListListsToJson(data as FollowsDataPostListLists);
			case FashionRecommendTagListEntity:
				return fashionRecommendTagListEntityToJson(data as FashionRecommendTagListEntity);
			case FashionRecommendTagListData:
				return fashionRecommendTagListDataToJson(data as FashionRecommendTagListData);
			case FashionRecommendTagListDataPostTags:
				return fashionRecommendTagListDataPostTagsToJson(data as FashionRecommendTagListDataPostTags);
			case FashionRecommendTagListDataPostTagsLists:
				return fashionRecommendTagListDataPostTagsListsToJson(data as FashionRecommendTagListDataPostTagsLists);
			case LoginEntity:
				return loginEntityToJson(data as LoginEntity);
			case LoginData:
				return loginDataToJson(data as LoginData);
			case PostModelEntity:
				return postModelEntityToJson(data as PostModelEntity);
			case PostModelPostImgList:
				return postModelPostImgListToJson(data as PostModelPostImgList);
			case PostModelPostTags:
				return postModelPostTagsToJson(data as PostModelPostTags);
			case PostModelPostTopics:
				return postModelPostTopicsToJson(data as PostModelPostTopics);
			case PostModelPostGoods:
				return postModelPostGoodsToJson(data as PostModelPostGoods);
			case PostModelPostGoodsTagList:
				return postModelPostGoodsTagListToJson(data as PostModelPostGoodsTagList);
			case ProfileInfoEntity:
				return profileInfoEntityToJson(data as ProfileInfoEntity);
			case ProfileInfoData:
				return profileInfoDataToJson(data as ProfileInfoData);
			case ProfileInfoDataUser:
				return profileInfoDataUserToJson(data as ProfileInfoDataUser);
			case LikesDataEntity:
				return likesDataEntityToJson(data as LikesDataEntity);
			case LikesDataPastContent:
				return likesDataPastContentToJson(data as LikesDataPastContent);
			case LikesDataPastContentLists:
				return likesDataPastContentListsToJson(data as LikesDataPastContentLists);
			case MyIntegralDetailDataEntity:
				return myIntegralDetailDataEntityToJson(data as MyIntegralDetailDataEntity);
			case MyIntegralDetailDataData:
				return myIntegralDetailDataDataToJson(data as MyIntegralDetailDataData);
			case MyIntegralDetailDataDataIntegralList:
				return myIntegralDetailDataDataIntegralListToJson(data as MyIntegralDetailDataDataIntegralList);
			case MyIntegralDetailDataDataIntegralListLists:
				return myIntegralDetailDataDataIntegralListListsToJson(data as MyIntegralDetailDataDataIntegralListLists);
			case MyIntegralDataEntity:
				return myIntegralDataEntityToJson(data as MyIntegralDataEntity);
			case MyIntegralDataData:
				return myIntegralDataDataToJson(data as MyIntegralDataData);
			case MyIntegralDataDataMissionList:
				return myIntegralDataDataMissionListToJson(data as MyIntegralDataDataMissionList);
			case HomePageEntity:
				return homePageEntityToJson(data as HomePageEntity);
			case HomePageData:
				return homePageDataToJson(data as HomePageData);
			case HomePageDataRecommendList:
				return homePageDataRecommendListToJson(data as HomePageDataRecommendList);
			case HomePageDataRecommandListLists:
				return homePageDataRecommandListListsToJson(data as HomePageDataRecommandListLists);
			case FansDataEntity:
				return fansDataEntityToJson(data as FansDataEntity);
			case FansDataPastContent:
				return fansDataPastContentToJson(data as FansDataPastContent);
			case FansDataPastContentLists:
				return fansDataPastContentListsToJson(data as FansDataPastContentLists);
			case HomeBannerEntity:
				return homeBannerEntityToJson(data as HomeBannerEntity);
			case HomeBannerData:
				return homeBannerDataToJson(data as HomeBannerData);
			case HomeBannerDataBannerList:
				return homeBannerDataBannerListToJson(data as HomeBannerDataBannerList);
			case OtherPersonalInfoEntity:
				return otherPersonalInfoEntityToJson(data as OtherPersonalInfoEntity);
			case OtherPersonalInfoData:
				return otherPersonalInfoDataToJson(data as OtherPersonalInfoData);
			case OtherPersonalInfoDataUser:
				return otherPersonalInfoDataUserToJson(data as OtherPersonalInfoDataUser);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (FashionAttentionUserEntity).toString()){
			return FashionAttentionUserEntity().fromJson(json);
		}	else if(type == (FashionAttentionUserData).toString()){
			return FashionAttentionUserData().fromJson(json);
		}	else if(type == (FashionAttentionUserDataPostList).toString()){
			return FashionAttentionUserDataPostList().fromJson(json);
		}	else if(type == (FashionAttentionUserDataPostListList).toString()){
			return FashionAttentionUserDataPostListList().fromJson(json);
		}	else if(type == (CommentModelEntity).toString()){
			return CommentModelEntity().fromJson(json);
		}	else if(type == (CommentModelCommentReply).toString()){
			return CommentModelCommentReply().fromJson(json);
		}	else if(type == (CommentModelCommentReplyCommentReplyList).toString()){
			return CommentModelCommentReplyCommentReplyList().fromJson(json);
		}	else if(type == (FollowsDataEntity).toString()){
			return FollowsDataEntity().fromJson(json);
		}	else if(type == (FollowsDataPostList).toString()){
			return FollowsDataPostList().fromJson(json);
		}	else if(type == (FollowsDataPostListLists).toString()){
			return FollowsDataPostListLists().fromJson(json);
		}	else if(type == (FashionRecommendTagListEntity).toString()){
			return FashionRecommendTagListEntity().fromJson(json);
		}	else if(type == (FashionRecommendTagListData).toString()){
			return FashionRecommendTagListData().fromJson(json);
		}	else if(type == (FashionRecommendTagListDataPostTags).toString()){
			return FashionRecommendTagListDataPostTags().fromJson(json);
		}	else if(type == (FashionRecommendTagListDataPostTagsLists).toString()){
			return FashionRecommendTagListDataPostTagsLists().fromJson(json);
		}	else if(type == (LoginEntity).toString()){
			return LoginEntity().fromJson(json);
		}	else if(type == (LoginData).toString()){
			return LoginData().fromJson(json);
		}	else if(type == (PostModelEntity).toString()){
			return PostModelEntity().fromJson(json);
		}	else if(type == (PostModelPostImgList).toString()){
			return PostModelPostImgList().fromJson(json);
		}	else if(type == (PostModelPostTags).toString()){
			return PostModelPostTags().fromJson(json);
		}	else if(type == (PostModelPostTopics).toString()){
			return PostModelPostTopics().fromJson(json);
		}	else if(type == (PostModelPostGoods).toString()){
			return PostModelPostGoods().fromJson(json);
		}	else if(type == (PostModelPostGoodsTagList).toString()){
			return PostModelPostGoodsTagList().fromJson(json);
		}	else if(type == (ProfileInfoEntity).toString()){
			return ProfileInfoEntity().fromJson(json);
		}	else if(type == (ProfileInfoData).toString()){
			return ProfileInfoData().fromJson(json);
		}	else if(type == (ProfileInfoDataUser).toString()){
			return ProfileInfoDataUser().fromJson(json);
		}	else if(type == (LikesDataEntity).toString()){
			return LikesDataEntity().fromJson(json);
		}	else if(type == (LikesDataPastContent).toString()){
			return LikesDataPastContent().fromJson(json);
		}	else if(type == (LikesDataPastContentLists).toString()){
			return LikesDataPastContentLists().fromJson(json);
		}	else if(type == (MyIntegralDetailDataEntity).toString()){
			return MyIntegralDetailDataEntity().fromJson(json);
		}	else if(type == (MyIntegralDetailDataData).toString()){
			return MyIntegralDetailDataData().fromJson(json);
		}	else if(type == (MyIntegralDetailDataDataIntegralList).toString()){
			return MyIntegralDetailDataDataIntegralList().fromJson(json);
		}	else if(type == (MyIntegralDetailDataDataIntegralListLists).toString()){
			return MyIntegralDetailDataDataIntegralListLists().fromJson(json);
		}	else if(type == (MyIntegralDataEntity).toString()){
			return MyIntegralDataEntity().fromJson(json);
		}	else if(type == (MyIntegralDataData).toString()){
			return MyIntegralDataData().fromJson(json);
		}	else if(type == (MyIntegralDataDataMissionList).toString()){
			return MyIntegralDataDataMissionList().fromJson(json);
		}	else if(type == (HomePageEntity).toString()){
			return HomePageEntity().fromJson(json);
		}	else if(type == (HomePageData).toString()){
			return HomePageData().fromJson(json);
		}	else if(type == (HomePageDataRecommendList).toString()){
			return HomePageDataRecommendList().fromJson(json);
		}	else if(type == (HomePageDataRecommandListLists).toString()){
			return HomePageDataRecommandListLists().fromJson(json);
		}	else if(type == (FansDataEntity).toString()){
			return FansDataEntity().fromJson(json);
		}	else if(type == (FansDataPastContent).toString()){
			return FansDataPastContent().fromJson(json);
		}	else if(type == (FansDataPastContentLists).toString()){
			return FansDataPastContentLists().fromJson(json);
		}	else if(type == (HomeBannerEntity).toString()){
			return HomeBannerEntity().fromJson(json);
		}	else if(type == (HomeBannerData).toString()){
			return HomeBannerData().fromJson(json);
		}	else if(type == (HomeBannerDataBannerList).toString()){
			return HomeBannerDataBannerList().fromJson(json);
		}	else if(type == (OtherPersonalInfoEntity).toString()){
			return OtherPersonalInfoEntity().fromJson(json);
		}	else if(type == (OtherPersonalInfoData).toString()){
			return OtherPersonalInfoData().fromJson(json);
		}	else if(type == (OtherPersonalInfoDataUser).toString()){
			return OtherPersonalInfoDataUser().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<FashionAttentionUserEntity>[] is M){
			return data.map<FashionAttentionUserEntity>((e) => FashionAttentionUserEntity().fromJson(e)).toList() as M;
		}	else if(<FashionAttentionUserData>[] is M){
			return data.map<FashionAttentionUserData>((e) => FashionAttentionUserData().fromJson(e)).toList() as M;
		}	else if(<FashionAttentionUserDataPostList>[] is M){
			return data.map<FashionAttentionUserDataPostList>((e) => FashionAttentionUserDataPostList().fromJson(e)).toList() as M;
		}	else if(<FashionAttentionUserDataPostListList>[] is M){
			return data.map<FashionAttentionUserDataPostListList>((e) => FashionAttentionUserDataPostListList().fromJson(e)).toList() as M;
		}	else if(<CommentModelEntity>[] is M){
			return data.map<CommentModelEntity>((e) => CommentModelEntity().fromJson(e)).toList() as M;
		}	else if(<CommentModelCommentReply>[] is M){
			return data.map<CommentModelCommentReply>((e) => CommentModelCommentReply().fromJson(e)).toList() as M;
		}	else if(<CommentModelCommentReplyCommentReplyList>[] is M){
			return data.map<CommentModelCommentReplyCommentReplyList>((e) => CommentModelCommentReplyCommentReplyList().fromJson(e)).toList() as M;
		}	else if(<FollowsDataEntity>[] is M){
			return data.map<FollowsDataEntity>((e) => FollowsDataEntity().fromJson(e)).toList() as M;
		}	else if(<FollowsDataPostList>[] is M){
			return data.map<FollowsDataPostList>((e) => FollowsDataPostList().fromJson(e)).toList() as M;
		}	else if(<FollowsDataPostListLists>[] is M){
			return data.map<FollowsDataPostListLists>((e) => FollowsDataPostListLists().fromJson(e)).toList() as M;
		}	else if(<FashionRecommendTagListEntity>[] is M){
			return data.map<FashionRecommendTagListEntity>((e) => FashionRecommendTagListEntity().fromJson(e)).toList() as M;
		}	else if(<FashionRecommendTagListData>[] is M){
			return data.map<FashionRecommendTagListData>((e) => FashionRecommendTagListData().fromJson(e)).toList() as M;
		}	else if(<FashionRecommendTagListDataPostTags>[] is M){
			return data.map<FashionRecommendTagListDataPostTags>((e) => FashionRecommendTagListDataPostTags().fromJson(e)).toList() as M;
		}	else if(<FashionRecommendTagListDataPostTagsLists>[] is M){
			return data.map<FashionRecommendTagListDataPostTagsLists>((e) => FashionRecommendTagListDataPostTagsLists().fromJson(e)).toList() as M;
		}	else if(<LoginEntity>[] is M){
			return data.map<LoginEntity>((e) => LoginEntity().fromJson(e)).toList() as M;
		}	else if(<LoginData>[] is M){
			return data.map<LoginData>((e) => LoginData().fromJson(e)).toList() as M;
		}	else if(<PostModelEntity>[] is M){
			return data.map<PostModelEntity>((e) => PostModelEntity().fromJson(e)).toList() as M;
		}	else if(<PostModelPostImgList>[] is M){
			return data.map<PostModelPostImgList>((e) => PostModelPostImgList().fromJson(e)).toList() as M;
		}	else if(<PostModelPostTags>[] is M){
			return data.map<PostModelPostTags>((e) => PostModelPostTags().fromJson(e)).toList() as M;
		}	else if(<PostModelPostTopics>[] is M){
			return data.map<PostModelPostTopics>((e) => PostModelPostTopics().fromJson(e)).toList() as M;
		}	else if(<PostModelPostGoods>[] is M){
			return data.map<PostModelPostGoods>((e) => PostModelPostGoods().fromJson(e)).toList() as M;
		}	else if(<PostModelPostGoodsTagList>[] is M){
			return data.map<PostModelPostGoodsTagList>((e) => PostModelPostGoodsTagList().fromJson(e)).toList() as M;
		}	else if(<ProfileInfoEntity>[] is M){
			return data.map<ProfileInfoEntity>((e) => ProfileInfoEntity().fromJson(e)).toList() as M;
		}	else if(<ProfileInfoData>[] is M){
			return data.map<ProfileInfoData>((e) => ProfileInfoData().fromJson(e)).toList() as M;
		}	else if(<ProfileInfoDataUser>[] is M){
			return data.map<ProfileInfoDataUser>((e) => ProfileInfoDataUser().fromJson(e)).toList() as M;
		}	else if(<LikesDataEntity>[] is M){
			return data.map<LikesDataEntity>((e) => LikesDataEntity().fromJson(e)).toList() as M;
		}	else if(<LikesDataPastContent>[] is M){
			return data.map<LikesDataPastContent>((e) => LikesDataPastContent().fromJson(e)).toList() as M;
		}	else if(<LikesDataPastContentLists>[] is M){
			return data.map<LikesDataPastContentLists>((e) => LikesDataPastContentLists().fromJson(e)).toList() as M;
		}	else if(<MyIntegralDetailDataEntity>[] is M){
			return data.map<MyIntegralDetailDataEntity>((e) => MyIntegralDetailDataEntity().fromJson(e)).toList() as M;
		}	else if(<MyIntegralDetailDataData>[] is M){
			return data.map<MyIntegralDetailDataData>((e) => MyIntegralDetailDataData().fromJson(e)).toList() as M;
		}	else if(<MyIntegralDetailDataDataIntegralList>[] is M){
			return data.map<MyIntegralDetailDataDataIntegralList>((e) => MyIntegralDetailDataDataIntegralList().fromJson(e)).toList() as M;
		}	else if(<MyIntegralDetailDataDataIntegralListLists>[] is M){
			return data.map<MyIntegralDetailDataDataIntegralListLists>((e) => MyIntegralDetailDataDataIntegralListLists().fromJson(e)).toList() as M;
		}	else if(<MyIntegralDataEntity>[] is M){
			return data.map<MyIntegralDataEntity>((e) => MyIntegralDataEntity().fromJson(e)).toList() as M;
		}	else if(<MyIntegralDataData>[] is M){
			return data.map<MyIntegralDataData>((e) => MyIntegralDataData().fromJson(e)).toList() as M;
		}	else if(<MyIntegralDataDataMissionList>[] is M){
			return data.map<MyIntegralDataDataMissionList>((e) => MyIntegralDataDataMissionList().fromJson(e)).toList() as M;
		}	else if(<HomePageEntity>[] is M){
			return data.map<HomePageEntity>((e) => HomePageEntity().fromJson(e)).toList() as M;
		}	else if(<HomePageData>[] is M){
			return data.map<HomePageData>((e) => HomePageData().fromJson(e)).toList() as M;
		}	else if(<HomePageDataRecommendList>[] is M){
			return data.map<HomePageDataRecommendList>((e) => HomePageDataRecommendList().fromJson(e)).toList() as M;
		}	else if(<HomePageDataRecommandListLists>[] is M){
			return data.map<HomePageDataRecommandListLists>((e) => HomePageDataRecommandListLists().fromJson(e)).toList() as M;
		}	else if(<FansDataEntity>[] is M){
			return data.map<FansDataEntity>((e) => FansDataEntity().fromJson(e)).toList() as M;
		}	else if(<FansDataPastContent>[] is M){
			return data.map<FansDataPastContent>((e) => FansDataPastContent().fromJson(e)).toList() as M;
		}	else if(<FansDataPastContentLists>[] is M){
			return data.map<FansDataPastContentLists>((e) => FansDataPastContentLists().fromJson(e)).toList() as M;
		}	else if(<HomeBannerEntity>[] is M){
			return data.map<HomeBannerEntity>((e) => HomeBannerEntity().fromJson(e)).toList() as M;
		}	else if(<HomeBannerData>[] is M){
			return data.map<HomeBannerData>((e) => HomeBannerData().fromJson(e)).toList() as M;
		}	else if(<HomeBannerDataBannerList>[] is M){
			return data.map<HomeBannerDataBannerList>((e) => HomeBannerDataBannerList().fromJson(e)).toList() as M;
		}	else if(<OtherPersonalInfoEntity>[] is M){
			return data.map<OtherPersonalInfoEntity>((e) => OtherPersonalInfoEntity().fromJson(e)).toList() as M;
		}	else if(<OtherPersonalInfoData>[] is M){
			return data.map<OtherPersonalInfoData>((e) => OtherPersonalInfoData().fromJson(e)).toList() as M;
		}	else if(<OtherPersonalInfoDataUser>[] is M){
			return data.map<OtherPersonalInfoDataUser>((e) => OtherPersonalInfoDataUser().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}