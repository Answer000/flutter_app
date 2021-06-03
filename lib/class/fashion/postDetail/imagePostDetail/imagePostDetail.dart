import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_entity.dart';
import 'package:flutter_app/class/fashion/postDetail/imagePostDetail/imagePostDetailHeaderView.dart';
import 'package:flutter_app/class/fashion/postDetail/postDetailToolBar.dart';
import 'package:flutter_app/class/fashion/postDetail/postDetailViewModel.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/resource.dart';

class ImagePostDetail extends BaseContainer {

  PostModelEntity post;
  ImagePostDetail({this.post});

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return ImagePostDetailState();
  }

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => false;

  @override
  // TODO: implement isShowBackground
  bool get isShowBackground => false;

  @override
  // TODO: implement isShowNavigationBar
  bool get isShowNavigationBar => false;

  @override
  // TODO: implement isCanNavigationBarTransparent
  bool get isCanNavigationBarTransparent => true;
}

class ImagePostDetailState extends BaseContainerState<ImagePostDetail> {

  PostDetailViewModel _viewModel;

  ScrollController _scrollController = ScrollController();

  double _toolBarHeight = Screen.bottomBarHeight + 49;

  final ValueNotifier<Color> _navigationBarColor = ValueNotifier<Color>(Colors.transparent);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.isShowLogo = false;
    this.navigationBar.navigationBarColor = Colors.white;

    _scrollController..addListener(() {
        double value = _scrollController.offset / 150.0;
        if(value > 1.0) { value = 1.0; }
        if(value < 0.0) { value = 0.0; }
        _navigationBarColor.value = CustomColor.hexColor("0x1d1d1d", alpha: value);
      });

    _viewModel = PostDetailViewModel(postId: this.widget.post.id);
    _getCommentList(isDown: true);
  }

  _getCommentList({bool isDown, Function callback}) {
    _viewModel.getCommentList(isDown: isDown, callback: (){
      this.setState(() {});
      if(callback != null) { callback(); }
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    if(this.widget.post == null) {
      return Container();
    }
    return Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: Screen.statusBarHeight, bottom: _toolBarHeight),
              child: CustomRefresher(
                onRefresh: (refresh) {
                  _getCommentList(
                      isDown: true,
                      callback: ()=> refresh.setRefreshCompleted()
                  );
                },
                onLoading: (refresh) {
                  _getCommentList(
                      isDown: false,
                      callback: (){
                        print("${this._viewModel.loadStatus}");
                        refresh.setLoadStatus(this._viewModel.loadStatus);
                      }
                  );
                },
                loadTextColor: Colors.grey,
                child: ListView.separated(
                    controller: _scrollController,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index){
                      if(index == 0) {
                        return ImagePostDetailHeaderView(post: this.widget.post);
                      }else {
                        return _setRow(this._viewModel.entitys[index-1]);
                      }
                    },
                    separatorBuilder: (context, index) {
                      if(index == 0) {
                        return Container(
                          margin: EdgeInsets.only(left:11.dp, top: 18.dp, bottom: 11.dp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                color: CustomColor.hexColor("0xDA3F47"),
                                width: 5.dp,
                                height: 10.dp,
                              ),
                              Container(
                                margin: EdgeInsets.only(left:4.dp),
                                child: Text(
                                  "共有${this.widget.post.commentNum}条评论",
                                  style: TextStyle(
                                    color: CustomColor.hexColor("0x5E5E5E"),
                                    fontSize: 10.dpFontSize,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return Container(
                        margin: EdgeInsets.only(left: 54.dp, right: 54.dp),
                        color: CustomColor.hexColor("0xF5F5F5"),
                        height: 1,
                      );
                    },
                    itemCount: this._viewModel.entitys.length),
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: Screen.topBarHeight,
              child: ValueListenableBuilder<Color>(
                builder: (context, color, child){
                  return NavigationBar(
                    barType: NavigationBarType.child,
                    isShowLogo: false,
                    navigationBarColor: color,
                    backCallback: () => this.backCallBack(),
                  );
                },
                valueListenable: this._navigationBarColor,
              )
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: _toolBarHeight,
              child: PostDetailToolBar(this.widget.post),
            ),
          ],
        )
    );
  }

  Widget _setRow(CommentEntity entity){
    if(entity == null || entity.comment == null) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(left: 12.dp, top: 26.dp, bottom: 20.dp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 30.dp,
                    height: 30.dp,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: CustomColor.mainRedColor,
                      borderRadius: BorderRadius.circular(15.dp),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      child: CustomImage.assetNetwork(
                          image: entity.comment.userAvatar,
                          size: Size(30.dp, 30.dp)
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 6.dp),
                    height: 30.dp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          entity.comment.nick,
                          style: TextStyle(
                            color: CustomColor.hexColor("0x2E2D2D"),
                            fontSize: 12.dpFontSize,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),

                        Text(
                          entity.comment.createTime,
                          style: TextStyle(
                            color: CustomColor.hexColor("0xB4B4B4"),
                            fontSize: 10.dpFontSize,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(right: 12.dp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4.dp),
                      child: Text(
                        "${entity.comment.praiseNum.setTrans()}",
                        style: TextStyle(
                          color: entity.isPraise
                              ? CustomColor.hexColor("0xDA3F47")
                              : CustomColor.hexColor("0xB9B9B9"),
                          fontSize: 13.dpFontSize,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),

                    Container(
                      width: 16.dp,
                      height: 16.dp,
                      margin: EdgeInsets.only(left: 5.dp),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: CustomAssetImage.image(
                          color: entity.isPraise ? null : Colors.grey,
                          image: entity.isPraise
                              ? ImageName.cjm_post_list_like.imagePath
                              : ImageName.cjm_post_list_unlike.imagePath
                        )
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          Container(
            margin: EdgeInsets.only(left: 36.dp, top: 5.dp, right: 48.dp),
            child: Text(
              entity.comment.content,
              style: TextStyle(
                color: CustomColor.hexColor("0x2E2D2D"),
                fontSize: 13.dpFontSize,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
            ),
          ),

          entity.commentReplyList.length == 0
              ? Container()
              : Container(
            margin: entity.margin,
            padding: entity.padding,
            decoration: BoxDecoration(
                color: CustomColor.hexColor("0xF5F5F5"),
                borderRadius: BorderRadius.circular(5.dp)
            ),
            height: entity.subCommentTotalHeight,
            child: ListView.separated(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: entity.subCommentHeightList[index],
                    child: RichText(
                      text: TextSpan(
                          text: entity.commentReplyList[index].userNick,
                          style: TextStyle(
                              color: CustomColor.hexColor("0xDA3F47"),
                              fontSize: entity.subCommentFontSize,
                              fontWeight: entity.subCommentFontWeight,
                              decoration: TextDecoration.none
                          ),
                          children: [
                            TextSpan(
                              text: "：${entity.commentReplyList[index].commentContent}",
                              style: TextStyle(
                                  color: CustomColor.hexColor("0x2E2D2D"),
                                  fontSize: entity.subCommentFontSize,
                                  fontWeight: entity.subCommentFontWeight,
                                  decoration: TextDecoration.none
                              ),
                            )
                          ]
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container();
                },
                itemCount: entity.commentReplyList.length),
          )
        ],
      )
    );
  }
}

