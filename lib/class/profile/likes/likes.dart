import 'package:flutter/material.dart';
import 'package:flutter_app/class/profile/likes/likesViewModel.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/base_viewModel.dart';
import 'package:flutter_app/common/base/empty_view.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:flutter_app/resource.dart';

class Likes extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return LikesState();
  }
}

class LikesState extends BaseContainerState<Likes> {

  ScrollController _scrollController = ScrollController();

  LikesViewModel _viewModel = LikesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = '获赞';

    _loadData();
  }

  _loadData({bool isDown = true, Function(bool isDown) callback}) {
    this._viewModel.getDatas(isDown, (_) => {
      this.setState(() { }),
      if(callback != null) {
        callback(isDown),
      }
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    if(this._viewModel.sourceStatus == ASSourceStatus.empty) {
      return EmptyView(
        message: "暂无获赞",
        iconPath: ImageName.cjm_empty_fans,
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
            _loadData(callback: (_) => refresh.setRefreshCompleted());
          },
          onLoading: (refresh){
            _loadData(
              isDown: false,
              callback: (isDown) => refresh.setLoadStatus(this._viewModel.loadStatus),
            );
          },
          child: ListView.separated(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                if(index == 0) {
                  return _setHeader();
                }
                return _setRow(index-1);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10.dp),
                );
              },
              itemCount: this._viewModel.lists.length + 1),
        )
    );
  }

  Widget _setRow(int index) {
    if (this._viewModel.dataEntity == null) {
      return Container();
    }
    bool isEmptyNum = (this._viewModel.dataEntity.num ?? 0) == 0;
    return Container(
      margin: EdgeInsets.only(left: 12.dp, right: 12.dp),
      height: 65.dp,
      decoration: BoxDecoration(
          color: CustomColor.hexColor("0x222222"),
          borderRadius: BorderRadius.circular(5.dp)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.dp),
            child: Text(
              '${this._viewModel.lists[index].createTime ?? ""}',
              style: TextStyle(
                  color: CustomColor.hexColor("0x999999"),
                  fontSize: 12.dpFontSize,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none
              ),
            ),
          ),

          Container(
              margin: EdgeInsets.only(left: 42.dp),
              child: this._viewModel.lists[index].pastContent.setRichText(
                  '{{num}}',
                  TextStyle(
                    color: Colors.white,
                    fontSize: 14.dpFontSize,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                  "  ${this._viewModel.dataEntity.total ?? 0}  ",
                  TextStyle(
                    color: CustomColor.hexColor(isEmptyNum ? "0xda3f47" : "0xAAcccb"),
                    fontSize: 12.dpFontSize,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  )
              )
          )
        ],
      ),
    );
  }

  Widget _setHeader() {
    if (this._viewModel.dataEntity == null) {
      return Container();
    }
    bool isEmptyNum = (this._viewModel.dataEntity.num ?? 0) == 0;
    return Container(
      margin: EdgeInsets.only(bottom: 10.dp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 12.dp),
            child: Text(
              '总共获赞数量',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.dpFontSize,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 15.dp, left: 12.dp, right: 12.dp),
            height: 90.dp,
            decoration: BoxDecoration(
                color: Color(0xff212121),
                borderRadius: BorderRadius.circular(6.dp),
                boxShadow: [
                  BoxShadow(
                      color: CustomColor.hexColor("0x212121", alpha: 0.27),
                      offset: Offset(0,2),
                      blurRadius: 1,
                      spreadRadius: 12
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.dp),
                  child: Text(
                    '${this._viewModel.dataEntity.total.setTrans()}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.dpFontSize,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none
                    ),
                  ),
                ),

                Offstage(
                  offstage: isEmptyNum,
                  child: Container(
                    margin: EdgeInsets.only(left: 15.dp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 14.dp, right: 14.dp),
                                  height: 20.dp,
                                  decoration: BoxDecoration(
                                    color: !isEmptyNum ? Color(0xffDA3F47) : Color(0xffAACCCB),
                                    borderRadius: BorderRadius.circular(10.dp),
                                  ),
                                  child: Center(
                                      child: this._viewModel.dataEntity.newHint.setRichText(
                                          '{{num}}',
                                          TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.dpFontSize,
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.none
                                          ),
                                          "${this._viewModel.dataEntity.total ?? 0}",
                                          TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.dpFontSize,
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.none
                                          )
                                      )
                                  )
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 2.dp),
                                child: CustomAssetImage.image(
                                  image: !isEmptyNum
                                      ? ImageName.cjm_profile_fans_up.imagePath
                                      : ImageName.cjm_profile_fans_down.imagePath,
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 5.dp),
                          child: Text(
                            "${this._viewModel.dataEntity.newContent ?? ""}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.dpFontSize,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}