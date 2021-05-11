import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/class/fashion/fashion_base_page_view.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/class/fashion/video/fashion_video_viewModel.dart';
import 'package:flutter_app/class/fashion/waterfall_flow_view.dart';

class FashionVideoPageView extends FashionBasePageView{

  FashionVideoViewModel _viewModel = FashionVideoViewModel();

  @override
  FashionBasePageViewState<FashionBasePageView> getState() {
    return FashionVideoPageViewState();
  }
}

class FashionVideoPageViewState extends FashionBasePageViewState<FashionVideoPageView> {

  List<PostEntity> _postEntitys = [];

  @override
  void initState() {
    super.initState();
    loadDatas(true);
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: WaterfallFlowView(
        dataSource: this._postEntitys,
        crossAxisCount: this.widget._viewModel.crossAxisCount,
        crossAxisSpacing: this.widget._viewModel.crossAxisSpacing,
        mainAxisSpacing: this.widget._viewModel.mainAxisSpacing,
        onLoading: (loading){
          loadDatas(false);
        },
        onRefresh: (refreshing){
          loadDatas(true);
        },
      ),
    );
  }

  loadDatas(bool isDown) {
    this.widget._viewModel.loadDatas(isDown, (entitys, hasMore) => {
      this.setState(() {
        this._postEntitys = isDown ? entitys : (this._postEntitys + entitys);
      })
    });
  }
}