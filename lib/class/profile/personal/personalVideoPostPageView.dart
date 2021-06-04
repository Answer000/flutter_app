import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postListItemBuilder.dart';
import 'package:flutter_app/class/profile/personal/personalPageViewModel.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/base/empty_view.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/base_page_view.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/resource.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';

// ignore: must_be_immutable
class PersonalVideoPostPageView extends BasePageView {
  bool isLogin;
  int userId;
  PersonalVideoPostPageView({
    @required this.isLogin,
    @required this.userId
  });

  @override
  BasePageViewState<BasePageView> getState() {
    // TODO: implement getState
    return PersonalVideoPostPageViewState();
  }
}

class PersonalVideoPostPageViewState extends BasePageViewState<PersonalVideoPostPageView> {

  PersonalPageViewModel _viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _viewModel = PersonalPageViewModel(type: 2, userId: this.widget.userId);
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
              return PostListItemBuilder(postEntity: this._viewModel.items[index]);
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