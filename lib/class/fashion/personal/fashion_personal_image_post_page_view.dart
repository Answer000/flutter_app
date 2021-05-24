
import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_item_builder.dart';
import 'package:flutter_app/class/fashion/fashion_base_page_view.dart';
import 'package:flutter_app/class/fashion/personal/fashion_personal_page_viewModel.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/base/empty_view.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/resource.dart';

// ignore: must_be_immutable
class FashionPersonalImagePostPageView extends FashionBasePageView {

  bool isLogin;

  FashionPersonalImagePostPageView({@required this.isLogin});

  @override
  FashionBasePageViewState<FashionBasePageView> getState() {
    // TODO: implement getState
    return FashionPersonalImagePostPageViewState();
  }
}

class FashionPersonalImagePostPageViewState extends FashionBasePageViewState<FashionPersonalImagePostPageView> {

  FashionPersonalPageViewModel _viewModel = FashionPersonalPageViewModel(1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadData(isDown: true);
  }

  _loadData({bool isDown, Function(bool isDown) callback}) {
    this._viewModel.loadDatas(
        isDown: isDown,
        callback: (){
          this.setState(() {});
          if(callback != null) {
            callback(isDown);
          }
        }
    );
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
        actionCallback: () => this._loadData(isDown: true),
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 30.dp),
      child: CustomRefresher(
        onRefresh: (refresh) {
          this._loadData(
              isDown: true,
              callback: (_) => refresh.setRefreshCompleted(),
          );
        },
        onLoading: (refresh) {
          this._loadData(
            isDown: false,
            callback: (_) => refresh.setLoadStatus(this._viewModel.loadStatus)
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