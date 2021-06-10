
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/https/https.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/common/tools/custom_loading.dart';

enum PostType {
  image,  /// 图文帖子
  video,  /// 视频帖子
}

enum PostStyle {
  waterfall,  /// 瀑布流
  list,       /// 列表
}

class PostEntity {
  // 封面图链接
  String get picUrl {
    switch (this.postType) {
      case PostType.image:  return this._post.postImgList.isValid ? this._post.postImgList.first.picUrl : null;
      case PostType.video:  return this._post.picUrl;
      default: return null;
    }
  }

  // 封面图size
  // ignore: missing_return
  Size getImageSizeWith({double width}) {
    switch(this._postStyle) {
      case PostStyle.waterfall:
        switch (this.postType) {
          case PostType.image:
            double h = 0.0;
            double picProportion = double.parse(
                this._post.postImgList.isValid
                    ? this._post.postImgList.first.picUrlProportion
                    : '0.0'
            ) ?? 0.0;
            if (picProportion <= 1.1 && picProportion >= 0.9) {
              h = width * 1.1;
            } else if (picProportion < 0.9) {                     // 竖图 宽<高
              h = width * 1.2;
            } else{                                             // 横图 宽>高
              h = width * 0.6;
            }
            return Size(width, h);

          case PostType.video:  return Size(width, width * 0.6);
          default:  return Size.zero;
        }
        break;
      case PostStyle.list:
        switch (this.postType) {
          case PostType.image:
            if(_post.postImgList.isValid) {
              // 单图
              if(_post.postImgList.length == 1) {
                double imgHeight = 204.dp;
                double picProportion = double.parse(this._post.postImgList.first.picUrlProportion) ?? 0.0;
                double imgWidth = imgHeight * picProportion;
                return Size(imgWidth, imgHeight);
              }
              // 多图
              else{
                return Size(width, width);
              }
            }else{
              return Size.zero;
            }
            break;
          case PostType.video:
            return Size(306.dp, 172.dp);
        }
        break;
      default: return Size.zero;
    }

  }

  // 话题
  String get topicName => this._post.postTopics.isValid ? this._post.postTopics.first.topicName : null;

  // 正文
  String get content => postType == PostType.image ? this._post.content : this._post.title;

  // 是否点赞
  bool get isPraise => this._post.praisePost == '2' ? false : true;
  set isPraise(bool value) {
    if(value) {
      this._post.praisePost = '1';
      this._post.praiseNum += 1;
    }else{
      this._post.praisePost = '2';
      this._post.praiseNum -= 1;
    }
  }

  // 是否收藏
  bool get isCollect => this._post.collectionPost == '2' ? false : true;
  set isCollect(bool value) {
    if(value) {
      this._post.collectionPost = '1';
      this._post.collectionNum += 1;
    }else{
      this._post.collectionPost = '2';
      this._post.collectionNum -= 1;
    }
  }

  // 是否关注
  bool get isFollow => this._post.attentionUser == '2' ? false : true;
  set isFollow(bool value) {
    if(value) {
      this._post.attentionUser = '1';
    }else{
      this._post.attentionUser = '2';
    }
  }

  // 帖子ID
  int get postId => this._post.id;

  // 帖子类型
  PostType postType = PostType.image;

  PostModelEntity _post;
  PostModelEntity get post => _post;

  // 帖子样式
  PostStyle _postStyle;

  PostEntity({
    PostModelEntity post,
    PostStyle postStyle = PostStyle.waterfall
  }) {
    this._postStyle = postStyle;
    this._post = post;
    this.postType = post.type == 1 ? PostType.image : PostType.video;
  }

  /// 是否正在执行点赞请求
  bool _isPraisePost = false;
  /// 是否正在执行收藏请求
  bool _isCollectPost = false;
  /// 是否正在执行关注请求
  bool _isFollowPost = false;
}

/// 点赞
extension PostEntityPraise on PostEntity {
  praisePost({Function callback}) async{
    bool isNeedsLogin = false;
    await CustomNavigator.isNeedsToLogin(
        context: LoginUserInfoManager.appContext).then((value) => isNeedsLogin = value
    );
    if(isNeedsLogin) { return; }

    if(_isPraisePost) {
      if (callback != null) { callback(); }
      return;
    }
    _isPraisePost = true;
    await Https().post(
        apiPath: APIPath.post_praisePost,
        params: {'postId' : this.postId, 'operationType' : this.isPraise ? '2' : '1'},
        onSuccess: (response) {
          if(this.isPraise) {
            isPraise = false;
            CustomToast.show('已取消点赞');
          }else{
            isPraise = true;
            CustomToast.show('点赞成功');
          }
          _isPraisePost = false;
          if (callback != null) { callback(); }
        },
        onSuccessOfOthers: (response) {
          CustomToast.show('${response['msg'].toString()}');
          _isPraisePost = false;
          if (callback != null) { callback(); }
        },
        onFailure: (error) {
          _isPraisePost = false;
          if (callback != null) { callback(); }
        }
    );
  }
}

/// 收藏
extension PostEntityCollect on PostEntity {
  collectPost({Function callback}) async{
    bool isNeedsLogin = false;
    await CustomNavigator.isNeedsToLogin(
        context: LoginUserInfoManager.appContext).then((value) => isNeedsLogin = value
    );
    if(isNeedsLogin) { return; }

    if(_isCollectPost) {
      if (callback != null) { callback(); }
      return;
    }
    _isCollectPost = true;
    await Https().post(
        apiPath: APIPath.post_collectionPost,
        params: {'postId' : this.postId, 'operationType' : this.isCollect ? '2' : '1'},
        onSuccess: (response) {
          if(this.isCollect) {
            isCollect = false;
            CustomToast.show('已取消收藏');
          }else{
            isCollect = true;
            CustomToast.show('收藏成功');
          }
          _isCollectPost = false;
          if (callback != null) { callback(); }
        },
        onSuccessOfOthers: (response){
          CustomToast.show('${response['msg'].toString()}');
          _isCollectPost = false;
          if (callback != null) { callback(); }
        },
        onFailure: (error) {
          _isCollectPost = false;
          if (callback != null) { callback(); }
        }
    );
  }
}

/// 关注
extension PostEntityFollow on PostEntity {
  followPost({Function callback}) {
    if(_isFollowPost) {
      if (callback != null) { callback(); }
      return;
    }
    _isFollowPost = true;
    this.post.userId.isFollow(
        !this.isFollow,
        onSuccess: (response){
          isFollow = !this.isFollow;
          _isFollowPost = false;
          if(callback != null){ callback(); }
        },
        onFailure: () => _isFollowPost = false
    );
  }
}

/// 关注
extension FollowHelper on int {
  /// operationType => 1:关注，2:取消关注
  isFollow(bool isFollow, {Function(Map<dynamic,dynamic>) onSuccess, Function onFailure}) async {
    bool isNeedsLogin = false;
    await CustomNavigator.isNeedsToLogin(
        context: LoginUserInfoManager.appContext).then((value) => isNeedsLogin = value
    );
    if(isNeedsLogin) { return; }
    await Https().post(
      apiPath: APIPath.user_attentionUser,
      params: {"userId" : this, "operationType" : (isFollow ? 1 : 2)},
      onSuccess: (response){
        CustomToast.show(isFollow ? "关注成功" : "取消关注成功");
        onSuccess(response);

        }, onSuccessOfOthers: (response) {
          CustomToast.show('${response['msg'].toString()}');
          onFailure();

        }, onFailure: (error){
        CustomToast.show(isFollow ? "关注失败" : "取消关注失败");
        onFailure();
      }
    );
  }
}

