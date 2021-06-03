import 'package:flutter/material.dart';
import 'package:flutter_app/class/profile/follows/followsViewModel.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/base/empty_view.dart';
import 'package:flutter_app/common/base/tabbar.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class Follows extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return FollowsState();
  }
}

class FollowsState extends BaseContainerState<Follows> {

  ScrollController _scrollController = ScrollController();

  FollowsViewModel _viewModel = FollowsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = '关注';

    _loadData(isDown: true);
  }

  _loadData({bool isDown = true, Function() callback}) {
    this._viewModel.getDatas(isDown, (_) => {
      this.setState(() { }),
      if(callback != null) {
        callback(),
      }
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    if(this._viewModel.sourceStatus == ASSourceStatus.empty) {
      return EmptyView(
        message: "暂无获赞",
        itemTitle: "去关注",
        iconPath: ImageName.cjm_empty_fans,
        actionCallback: () {
          ASTabBar().selectItem(ASTabBarItemType.fashion);
        },
      );
    }
    if(this._viewModel.sourceStatus == ASSourceStatus.noNetwork) {
      return EmptyView(
        itemTitle: "去刷新",
        actionCallback: () => this._loadData(),
      );
    }
    return Container(
        child: CustomRefresher(
          onRefresh: (refresh){
            _loadData(callback: () => refresh.setRefreshCompleted());
          },
          onLoading: (refresh){
            _loadData(
              isDown: false,
              callback: () => refresh.setLoadStatus(this._viewModel.loadStatus),
            );
          },
          child: ListView.separated(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return _setRow(index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10.dp),
                );
              },
              itemCount: this._viewModel.lists.length),
        )
    );
  }


  Widget _setRow(int index) {
    if (this._viewModel.lists == null) {
      return Container();
    }
    bool isAttention = this._viewModel.lists[index].attentionUser == "1";
    return Container(
      height: 60.dp,
      margin: EdgeInsets.only(left: 35.dp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                  width: 40.dp,
                  height: 40.dp,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.dp)
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    child: CustomImage.memoryNetwork(
                      image: "${this._viewModel.lists[index].userAvatar}",
                      size: Size(40.dp, 40.dp),
                    ),
                  )
              ),

              Container(
                margin: EdgeInsets.only(left: 12.dp),
                child: Text(
                  '${this._viewModel.lists[index].nick ?? ""}',
                  style: TextStyle(
                      color: CustomColor.hexColor("0xffffff"),
                      fontSize: 12.dpFontSize,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none
                  ),
                ),
              ),
            ],
          ),

          Container(
              margin: EdgeInsets.only(right: 24.dp),
              width: 80.dp,
              height: 24.dp,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: CustomAssetImage.image(
                  image: isAttention
                      ? ImageName.cjm_profile_follow_selected.imagePath
                      : ImageName.cjm_profile_follow_normal.imagePath
                ),
                onPressed: (){
                  this._viewModel.isFollow(this._viewModel.lists[index],
                          () => this.setState(() {})
                  );
                },
              )
          ),
        ],
      ),
    );
  }
}