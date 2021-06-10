import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postDetail/postDetailViewModel.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/common/extension/extension.dart';

class VideoPostDetail extends BaseContainer {

  PostModelEntity post;
  VideoPostDetail({this.post});

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return VideoPostDetailState();
  }
}

class VideoPostDetailState extends BaseContainerState<VideoPostDetail> {

  PostDetailViewModel _viewModel;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.isShowLogo = false;

    _viewModel = PostDetailViewModel(postId: 6885);
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
    return Container(
        child: CustomRefresher(
          onRefresh: (refresh){
            _getCommentList(
                isDown: true,
                callback: ()=> refresh.setRefreshCompleted()
            );
          },
          onLoading: (refresh){
            _getCommentList(isDown: false,
                callback: (){
                  refresh.setLoadStatus(this._viewModel.loadStatus);
                });
          },
          child: ListView.separated(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.red,
                  height: 60,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10.dp),
                );
              },
              itemCount: 30),
        )
    );
  }
}