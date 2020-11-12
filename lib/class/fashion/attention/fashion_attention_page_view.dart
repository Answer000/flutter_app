import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_item_builder.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_user_entity.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_user_view.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_viewModel.dart';
import 'package:flutter_app/class/fashion/fashion_base_page_view.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/resource.dart';

class FashionAttentionPageView extends FashionBasePageView {

  @override
  FashionBasePageViewState<FashionBasePageView> getState() {
    return FashionAttentionPageViewState();
  }
}

class FashionAttentionPageViewState extends FashionBasePageViewState<FashionAttentionPageView> {

  FashionAttentionViewModel _viewModel = FashionAttentionViewModel();

  List<FashionAttentionUserDataPostListList> _userAttentionList = [];

  List<PostEntity> _postList = [];

  @override
  void initState() {
    super.initState();

    _viewModel.loadUserAttentionList((list) =>
        this.setState(() { this._userAttentionList = list; })
    );

    _viewModel.getPosts(isLoadMore: false,
      callback: (list, hasMore) => this.setState(() { this._postList = list; }),
    );
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      child: CustomRefresher(
        onRefresh: (controller) {
          _viewModel.getPosts(isLoadMore: false,
            callback: (list, hasMore) {
              this.setState(() { this._postList = list; });
              controller.refreshCompleted();
            },
          );
        },
        onLoading: (controller) {

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
      return _userAttentionList.isNotValid
          ? Container()
          : FashionAttentionUserView(
          userList: this._userAttentionList,
          onUserCallback: (user) {

          });
    }else{
      return FashionAttentionItemBuilder(postEntity: this._postList[index - 1]);
    }
  }
}