import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_item_builder.dart';
import 'package:flutter_app/class/fashion/fashion_base_page_view.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_page_viewModel.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/base/empty_view.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/resource.dart';

class FashionPersonalVideoPostPageView extends FashionBasePageView {
  bool isLogin;

  FashionPersonalVideoPostPageView({@required this.isLogin});

  @override
  FashionBasePageViewState<FashionBasePageView> getState() {
    // TODO: implement getState
    return FashionPersonalVideoPostPageViewState();
  }
}

class FashionPersonalVideoPostPageViewState extends FashionBasePageViewState<FashionPersonalVideoPostPageView> {

  FashionPersonalPageViewModel _viewModel = FashionPersonalPageViewModel(2);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this._viewModel.loadDatas(isDown: true, callback: () => this.setState(() {}) );
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
        message: isEmpty ? '您还没有发布帖子' : '网络错误',
        itemTitle: isEmpty ? '去发帖' : "刷新",
        actionCallback: () => {},
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 30.dp),
      child: CustomRefresher(
        onRefresh: (refresh) {
          this._viewModel.loadDatas(
              isDown: true,
              callback: () => refresh.setRefreshCompleted()
          );
        },
        onLoading: (refresh) {
          this._viewModel.loadDatas(
              isDown: false,
              callback: () => refresh.setLoadStatus(this._viewModel.loadStatus)
          );
        },
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index){
              return FashionAttentionItemBuilder(postEntity: this._viewModel.items[index]);
            },
            separatorBuilder: (BuildContext context, int index){
              return Container();
            },
            itemCount: this._viewModel.items.length
        ),
      ),
    );
  }
}