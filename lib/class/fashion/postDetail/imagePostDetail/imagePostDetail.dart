import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postDetail/commentDetail/postCommentDetail.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_entity.dart';
import 'package:flutter_app/class/fashion/postDetail/comment_model_entity.dart';
import 'package:flutter_app/class/fashion/postDetail/imagePostDetail/imagePostDetailHeaderView.dart';
import 'package:flutter_app/class/fashion/postDetail/postChildCommentView.dart';
import 'package:flutter_app/class/fashion/postDetail/postParentCommentView.dart';
import 'package:flutter_app/class/fashion/postDetail/postDetailInputView.dart';
import 'package:flutter_app/class/fashion/postDetail/postDetailToolBar.dart';
import 'package:flutter_app/class/fashion/postDetail/postDetailViewModel.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_navigation_bar.dart';
import 'package:flutter_app/common/base/empty_view.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
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

class ImagePostDetailState extends BaseContainerState<ImagePostDetail> with SingleTickerProviderStateMixin{

  PostDetailViewModel _viewModel;

  ScrollController _scrollController = ScrollController();

  double _toolBarHeight = Screen.bottomBarHeight + 53.dp;

  double _inputViewHeight = 53.dp;

  final ValueNotifier<Color> _navigationBarColor = ValueNotifier<Color>(Colors.transparent);

  double _keyboardHeight = 0;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.isShowLogo = false;
    this.navigationBar.navigationBarColor = Colors.white;

    _scrollController..addListener(() {
        this._showKeyboard(false, commentEntity: null);
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

  /// 是否显示键盘
  _showKeyboard(bool isShow, {CommentEntity commentEntity}) {
    if(isShow) {
      if(commentEntity != null) {
        setState(() {
          this._viewModel.commentEntity = commentEntity;
          this._viewModel.hintText = "回复：${commentEntity.comment.nick}";
        });
      }
      FocusScope.of(context).requestFocus(this._focusNode);
    }else{
      setState(() {
        this._viewModel.commentEntity = null;
        this._viewModel.content = "";
        this._viewModel.hintText = "请输入您的评论...";
      });
      this._focusNode.unfocus();
    }
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    if(this.widget.post == null) {
      return Container();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: Screen.statusBarHeight, bottom: _toolBarHeight),
                child: CustomRefresher(
                  onRefresh: (refresh) {
                    _getCommentList(
                        isDown: true,
                        callback: (){
                          refresh.setRefreshCompleted();
                        }
                    );
                  },
                  onLoading: (refresh) {
                    _getCommentList(
                        isDown: false,
                        callback: (){
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
                          if(this._viewModel.entitys.length == 0) {
                            return Container(
                              height: 300.dp,
                              child: EmptyView(
                                iconPath: ImageName.cjm_empty_comment,
                                message: "无评论",
                                messageTextStyle: TextStyle(
                                    color: CustomColor.hexColor("0x4D606F"),
                                    fontSize: 12.dpFontSize,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none
                                ),
                              ),
                            );
                          }
                          return _setRow(index-1);
                        }
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 54.dp, right: 54.dp),
                          color: CustomColor.hexColor("0xF5F5F5"),
                          height: 1,
                        );
                      },
                      itemCount: this._viewModel.entitys.length == 0
                          ? 2
                          : (this._viewModel.entitys.length + 1)),
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
                bottom: this._keyboardHeight,
                left: 0,
                right: 0,
                height: _inputViewHeight,
                child: PostDetailInputView(
                  focusNode: this._focusNode,
                  hintText: this._viewModel.hintText,
                  content: this._viewModel.content,
                  onChanged: (value) {
                    setState(() {
                      this._viewModel.content = value;
                    });
                  },
                  sendCallback: (){
                    /// 关闭键盘
                    _showKeyboard(false);
                    /// 发送评论
                    this._viewModel.addPostComment(context, (){
                      /// 清除输入框数据
                      setState(() {
                        this._viewModel.commentEntity = null;
                        this._viewModel.content = "";
                        this._viewModel.hintText = "请输入您的评论...";
                      });
                    });
                  },
                  showKeyboardCallback: (isShow){
                    this.setState(() {
                      this._keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
                    });
                  },
                )
              ),

              Positioned(
                top: Screen.height - _toolBarHeight,
                left: 0,
                right: 0,
                height: _toolBarHeight,
                child: PostDetailToolBar(this.widget.post, (){
                  /// 评论父评论
                  _showKeyboard(true, commentEntity: null);
                }),
              ),
            ],
          )
      ),
    );
  }

  Widget _setRow(int index){
    CommentEntity entity = this._viewModel.entitys[index];
    if(entity == null || entity.comment == null) {
      return Container();
    }

    return RawMaterialButton(
      highlightColor: CustomColor.hexColor("0xf5f5f5"),
      splashColor: Colors.transparent,
      onLongPress: (){
        LoginUserInfoManager().userId.then((value){
          if(value == entity.comment.userId && value.isValid) {
            _showDeleteWidget((){
              entity.deleteParentComment((isSucc){
                Navigator.pop(context);
                if(isSucc) {
                  this.setState(()=> this._viewModel.entitys.removeAt(index));
                }
              });
            });
          }
        });
      },
      child: Container(
          margin: EdgeInsets.only(left: 12.dp, top: 26.dp, right: 12.dp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostParentCommentView(commentEntity: entity, contentOnPress: (){
                entity.index = index;
                _showKeyboard(true, commentEntity: entity);
              }),

              PostChildCommentView(commentEntity: entity, contentOnPress: (childComment){
                LoginUserInfoManager().userId.then((value){
                  if(value == childComment.userId && value.isValid) {
                    _showDeleteWidget((){
                      childComment.deleteChildComment((isSucc){
                        Navigator.pop(context);
                        if(isSucc) {
                          this.setState(() {
                            entity.subCommentHeightList.removeAt(index);
                            entity.subCommentTotalHeight = 0;
                            entity.commentReplyList.removeAt(index);
                          });
                        }
                      });
                    });
                  }
                });
              })
            ],
          )
      ),
    );
  }

  _showDeleteWidget(Function deleteCallback) {
    showDialog(useSafeArea: false, context: context, builder: (context) {
      return Container(
        width: Screen.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: ()=> deleteCallback(),
              child: Container(
                color: Colors.white,
                height: 54.dp,
                child: Center(
                  child: Text(
                    '删除',
                    style: TextStyle(
                        color: CustomColor.hexColor("0x333333"),
                        fontSize: 14.dpFontSize,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 8.dp,
              color: CustomColor.hexColor("0xf5f5f5"),
            ),
            GestureDetector(
              onTap: ()=> Navigator.pop(context),
              child: Container(
                color: Colors.white,
                height: 84.dp,
                child: Center(
                  child: Text(
                    '取消',
                    style: TextStyle(
                        color: CustomColor.hexColor("0x333333"),
                        fontSize: 14.dpFontSize,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

