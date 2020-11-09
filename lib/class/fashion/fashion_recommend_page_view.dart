import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/fashion_base_page_view.dart';
import 'package:flutter_app/class/fashion/fashion_recommend_post_entity.dart';
import 'package:flutter_app/class/fashion/fashion_recommend_tagList_entity.dart';
import 'package:flutter_app/class/fashion/fashion_recommend_viewModel.dart';
import 'package:flutter_app/common/base/base_post_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/resource.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class FashionRecommendPageView extends FashionBasePageView {

  @override
  FashionBasePageViewState<FashionBasePageView> getState() {
    return FashionRecommendPageViewState();
  }
}

class FashionRecommendPageViewState extends FashionBasePageViewState<FashionRecommendPageView> {

  FashionRecommendViewModel _viewModel = FashionRecommendViewModel();

  List<FashionRecommandTagListDataPostTagsLists> _tagList = [];
  List<PostEntity> _postList = [];

  int _currentTagIndex = 0;

  @override
  void initState() {
    super.initState();
    _viewModel.loadTagList((list) async {
      setState(() {
        this._tagList = list;
      });
      await _getPosts(isLoadMore: false);
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
        print(this._postList);
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
        Container(
          height: 74.dp,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                  margin: EdgeInsets.only(left: 20.dp, right: 20.dp),
                  child: Row(
                    children: _createTagItems(
                        this._tagList,
                        this._currentTagIndex, (tag){
                    }),
                  )
              )
          ),
        ),

        Expanded(
          child: Container(
            child: CustomRefresher(
              onLoading: (controller){
                this._getPosts(isLoadMore: true, callback: (hasMore){
                  print('onLoading   hasMore  $hasMore');
                  if(controller.isLoading) {
                    hasMore ? controller.loadComplete() : controller.loadNoData();
                  }
                });
              },
              onRefresh: (controller){
                this._getPosts(isLoadMore: false, callback: (hasMore){
                  print('onRefresh   hasMore  $hasMore');
                  if(controller.isRefresh) {
                    controller.refreshCompleted();
                  }
                });
              },
              child: WaterfallFlow.builder(
                padding: _viewModel.itemPadding,
                itemCount: this._postList.length ?? 0,
                gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _viewModel.crossAxisCount,
                    crossAxisSpacing: _viewModel.crossAxisSpacing,
                    mainAxisSpacing: _viewModel.mainAxisSpacing,
                    lastChildLayoutTypeBuilder: (index) => LastChildLayoutType.none
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _getItemBuilder(this._postList[index]);
                },
              ),
            )
          ),
        )
      ],
    );
  }

  Widget _getItemBuilder(PostEntity post) {
    Size itemSize = post.getImageSizeWith(width: _viewModel.itemWidth);
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.only(bottom: 15.dp),
      decoration: BoxDecoration(
        color: Color(0xff2c2c2c),
        borderRadius: BorderRadius.circular(10.dp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: itemSize.width,
            height: itemSize.height,
            child: CustomImage.memoryNetwork(
              image: post.picUrl,
              size: itemSize,
            ),
          ),

          post.topicName.isValid
              ? Container(
            margin: EdgeInsets.only(left: 10.dp, top: 15.dp, right: 10.dp),
            height: 15.dp,
            child: Text(
              '#${post.topicName}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.dpFontSize,
                fontWeight: FontWeight.normal,),
            ),
          )
              : Container(),

          post.content.isValid
              ? Container(
            margin: EdgeInsets.only(left: 10.dp, top: 13.dp, right: 10.dp),
            child: Text(
              '#${post.content}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.dpFontSize,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
              : Container(),

          Container(
            margin: EdgeInsets.only(left: 10.dp, top: 5.dp, right: 10.dp),
            height: 20.dp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20.dp,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: CustomImage.memoryNetwork(
                          image: post.post.userAvatar,
                          size: Size(20.dp, 20.dp),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 6.dp),
                      child: Text(
                        '${post.post.nick}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.dp,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 12.dp,
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: CustomAssetImage.image(
                          image: post.isPraise ? ImageName.cjm_waterfall_like.imagePath : ImageName.cjm_waterfall_unlike.imagePath,
                        )
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 1.dp),
                      child: Text(
                        '${post.post.praiseNum}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.dp,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _createTagItems(
      List<FashionRecommandTagListDataPostTagsLists> list,
      int selectIndex,
      Function(FashionRecommandTagListDataPostTagsLists) function) {
    return list.map((e){
      int index = list.indexOf(e);
      return GestureDetector(
          onTap: () {
            function(e);
            setState(() {
              this._currentTagIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: index == 0 ? 0 : 16.dp),
            padding: EdgeInsets.only(left: 16.dp, right: 16.dp),
            alignment: Alignment.center,
            height: 26.dp,
            decoration: BoxDecoration(
              color: CustomColor.mainRedColor,
              borderRadius: BorderRadius.circular(13.dp),
              border: Border.all(color: index == selectIndex ? Colors.white : Colors.transparent, width: 1),
            ),
            clipBehavior: Clip.antiAlias,
            child: Text(
              e.postTagName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.dpFontSize,
                  fontWeight: FontWeight.normal
              ),
            ),
          )
      );
    }).toList();
  }
}
