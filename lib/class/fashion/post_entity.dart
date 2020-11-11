import 'package:flutter/cupertino.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';

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
            double picProportion = double.parse(this._post.postImgList.isValid ? this._post.postImgList.first.picUrlProportion : '0.0') ?? 0.0;
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
  String get content => this._post.content;

  // 是否点赞
  bool get isPraise => this._post.praisePost == '2' ? false : true;

  // 是否收藏
  bool get isCollect => this._post.collectionPost == '2' ? false : true;

  // 帖子ID
  int get postId => this._post.id;

  // 帖子类型
  PostType postType = PostType.image;

  PostModelEntity _post;
  PostModelEntity get post => _post;

  PostStyle _postStyle;

  PostEntity({
    PostModelEntity post,
    PostStyle postStyle = PostStyle.waterfall
  }) {
    this._postStyle = postStyle;
    this._post = post;
    this.postType = post.type == 1 ? PostType.image : PostType.video;
  }
}

