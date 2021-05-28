import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/tools/base_page_view.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/fashion/video/fashion_video_viewModel.dart';
import 'package:flutter_app/class/fashion/waterfall_flow_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_app/common/extension/extension.dart';

class FashionVideoPageView extends BasePageView{

  FashionVideoViewModel _viewModel = FashionVideoViewModel();

  @override
  BasePageViewState<BasePageView> getState() {
    return FashionVideoPageViewState();
  }
}

class FashionVideoPageViewState extends BasePageViewState<FashionVideoPageView> {

  List<PostEntity> _postEntitys = [];

  @override
  void initState() {
    super.initState();
    loadDatas(isDown: true);
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.dp),
      child: WaterfallFlowView(
        dataSource: this._postEntitys,
        crossAxisCount: this.widget._viewModel.crossAxisCount,
        crossAxisSpacing: this.widget._viewModel.crossAxisSpacing,
        mainAxisSpacing: this.widget._viewModel.mainAxisSpacing,
        padding: this.widget._viewModel.itemPadding,
        onLoading: (refresh){
          loadDatas(isDown: false,
            callback: (hasMore){
              refresh.setLoadStatus(hasMore ? LoadStatus.idle : LoadStatus.noMore);
            }
          );
        },
        onRefresh: (refresh){
          loadDatas(isDown: true,
              callback: (hasMore){
                refresh.setRefreshCompleted();
              }
          );
        },
      ),
    );
  }

  loadDatas({bool isDown, Function(bool) callback}) {
    this.widget._viewModel.loadDatas(isDown, (entitys, hasMore) => {
      this.setState(() {
        this._postEntitys = isDown ? entitys : (this._postEntitys + entitys);
      }),
      if (callback != null) {
        callback(hasMore)
      }
    });
  }
}