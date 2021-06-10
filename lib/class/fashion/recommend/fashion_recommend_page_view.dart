import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/postWaterfallFlowItemBuilder.dart';
import 'package:flutter_app/common/tools/base_page_view.dart';
import 'package:flutter_app/class/fashion/recommend/fashion_recommend_tagList_entity.dart';
import 'package:flutter_app/class/fashion/recommend/fashion_recommend_tag_view.dart';
import 'package:flutter_app/class/fashion/recommend/fashion_recommend_viewModel.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FashionRecommendPageView extends BasePageView {

  @override
  BasePageViewState<BasePageView> getState() {
    return FashionRecommendPageViewState();
  }
}

class FashionRecommendPageViewState extends BasePageViewState<FashionRecommendPageView> {

  FashionRecommendViewModel _viewModel = FashionRecommendViewModel();

  List<FashionRecommendTagListDataPostTagsLists> _tagList = [];
  List<PostEntity> _postList = [];

  int _currentTagIndex = 0;

  @override
  void initState() {
    super.initState();
    _viewModel.loadTagList((list) async {
      setState(() {
        this._tagList = list;
      });
      await _getPosts(isLoadMore: false, callback: (hasMore){

      });
    });
  }

  _getPosts({bool isLoadMore, Function(bool hasMore) callback}) async {
    if(this._tagList.isValid && this._currentTagIndex < this._tagList.length) {
      int postTagId = this._tagList[this._currentTagIndex].postTagId;
      Function(List<PostEntity>, bool hasMore) onSuccess = (list, hasMore) async {
        List<PostEntity> tempList = this._postList;
        isLoadMore
            ? tempList.addAll(list)
            : tempList = list;
        setState(() {
          this._postList = tempList;
        });
        if(callback != null) {
          await callback(hasMore);
        }
      };

      isLoadMore
          ? await _viewModel.loadMorePosts(postTagId, onSuccess)
          : await _viewModel.loadPosts(postTagId, onSuccess);
    }
  }

  @override
  Widget setContentView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        FashionRecommendTagView(
          tagList: this._tagList,
          selectIndex: this._currentTagIndex,
          indexDidChanged: (index) {
            setState(() {
              this._currentTagIndex = index;
              _getPosts(isLoadMore: false);
            });
          },
        ),

        Expanded(
          child: Container(
            child: PostWaterfallFlowItemBuilder(
              dataSource: this._postList,
              padding: _viewModel.itemPadding,
              crossAxisSpacing: _viewModel.crossAxisSpacing,
              crossAxisCount: _viewModel.crossAxisCount,
              mainAxisSpacing: _viewModel.mainAxisSpacing,
              onLoading: (refresh){
                this._getPosts(isLoadMore: true, callback: (hasMore){
                  refresh.setLoadStatus(hasMore ? LoadStatus.idle : LoadStatus.noMore);
                });
              },
              onRefresh: (refresh){
                this._getPosts(isLoadMore: false, callback: (hasMore){
                  refresh.setRefreshCompleted();
                });
              },
            )
          ),
        )
      ],
    );
  }
}
