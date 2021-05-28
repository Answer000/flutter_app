import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_item_builder.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_user_view.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_viewModel.dart';
import 'package:flutter_app/common/tools/base_page_view.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/base/empty_view.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/resource.dart';


// ignore: must_be_immutable
class FashionAttentionPageView extends BasePageView {

  bool isLogin;

  FashionAttentionPageView({@required this.isLogin});

  @override
  BasePageViewState<BasePageView> getState() {
    return FashionAttentionPageViewState();
  }
}

class FashionAttentionPageViewState extends BasePageViewState<FashionAttentionPageView> {

  FashionAttentionViewModel _viewModel = FashionAttentionViewModel();



  List<PostEntity> _postList = [];

  @override
  void initState() {
    super.initState();



    _loadData();
  }

  _loadData({bool isDown = true, Function callback}) {
    _viewModel.loadUserAttentionList(() => this.setState(() {}) );

    _viewModel.loadPosts(isDown, (){
      this.setState(() {});
      if(callback != null) { callback(); }
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    if(!this.widget.isLogin) {
      return EmptyView(
        iconPath: ImageName.cjm_empty_follow,
        message: '您还没有登录',
        itemTitle: '去登录',
        actionCallback: () => CustomNavigator.isNeedsToLogin(context: context),
      );
    }

    if(this._viewModel.sourceStatus == ASSourceStatus.empty ||
        this._viewModel.sourceStatus == ASSourceStatus.noNetwork) {
      bool isEmpty = this._viewModel.sourceStatus == ASSourceStatus.empty;
      return EmptyView(
        iconPath: isEmpty ? ImageName.cjm_empty_publish : ImageName.cjm_empty_no_network,
        message: isEmpty ? '您还没有关注' : '网络错误',
        itemTitle: "刷新",
        actionCallback: () => this._loadData(isDown: true),
      );
    }

    return Container(
        child: CustomRefresher(
          onRefresh: (refresh) {
            this._loadData(
                isDown: true,
                callback: () => refresh.setRefreshCompleted()
            );
          },
          onLoading: (refresh) {
            this._loadData(
                isDown: false,
                callback: () => refresh.setLoadStatus(this._viewModel.loadStatus)
            );
          },
          child: ListView.separated(
              padding: EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index){
                return _getItemBuilder(context, index);
              },
              separatorBuilder: (BuildContext context, int index){
                return Container();
              },
              itemCount: _getItemCount()
          ),
        )
    );
  }

  int _getItemCount() {
    int count = this._postList.length ?? 0;
    return count + 1;
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    if(index == 0) {
      return this._viewModel.userAttentionList.isNotValid
          ? Container()
          : FashionAttentionUserView(
          userList: this._viewModel.userAttentionList,
          onUserCallback: (user) {

          });
    }else{
      return FashionAttentionItemBuilder(postEntity: this._postList[index - 1]);
    }
  }
}