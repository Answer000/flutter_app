import 'package:flutter/material.dart';
import 'package:flutter_app/class/profile/integral/myIntegralHeaderView.dart';
import 'package:flutter_app/class/profile/integral/myIntegralViewModel.dart';
import 'package:flutter_app/class/profile/integral/myIntegral_data_entity.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/ASButton.dart';
import 'package:flutter_app/common/tools/ASSliverPersistentHeaderViewDelegate.dart';
import 'package:flutter_app/common/tools/CustomNavigator.dart';
import 'package:flutter_app/resource.dart';

class MyIntegral extends BaseContainer {

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return MyIntegralState();
  }
}

class MyIntegralState extends BaseContainerState<MyIntegral> {

  ScrollController _scrollController = ScrollController();

  MyIntegralViewModel _viewModel = MyIntegralViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "我的积分";

    this._viewModel.getMissionStatus(()=> this.setState(() {}) );
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Container(
      child: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (BuildContext context, bool headerSliverBuilder) {
          return [
            SliverPersistentHeader(
              pinned: true,
              delegate: ASSliverPersistentHeaderViewDelegate(
                maxExtentValue: this._viewModel.headerViewHeight,
                minExtentValue: this._viewModel.headerViewHeight,
                child: Container(
                  child: MyIntegralHeaderView(),
                )
              ),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.only(top: 20.dp, bottom: Screen.bottomBarHeight),
          child: ListView.separated(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 15.dp, right: 15.dp),
                  height: 56.dp,
                  decoration: BoxDecoration(
                      color: CustomColor.hexColor("0x222222"),
                      borderRadius: BorderRadius.circular(5.dp)
                  ),
                  child: this._setRow(this._viewModel.list[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 8.dp),
                );
              },
              itemCount: this._viewModel.list.length),
        )
      ),
    );
  }

  _setRow(MyIntegralDataDataMissionList entity) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24.dp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${entity.title}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 4.dp)),

                this._viewModel.setDesc(entity),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 15.dp),
            child: Row(
              children: [
                Text(
                  '${entity.currentTime}/${entity.maxTime}',
                  style: TextStyle(
                      color: CustomColor.hexColor(entity.isComplete ? "0x696969" : "0xAACCCB"),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none
                  ),
                ),

                Padding(padding: EdgeInsets.only(right: 20.dp)),

                Container(
                  width: 60.dp,
                  height: 28.dp,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: CustomColor.hexColor(entity.isComplete ? "0x696969" : "0xAACCCB"),
                        width: 1.dp
                    ),
                    borderRadius: BorderRadius.circular(14.dp),
                  ),
                  child: Center(
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        '${entity.btnText}',
                        style: TextStyle(
                            color: CustomColor.hexColor(entity.isComplete ? "0x696969" : "0xAACCCB"),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none
                        ),
                      ),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: (){
                        CustomNavigator.pushNamed(
                          context: context,
                          routeStr: entity.route,
                        );
                      },
                    )
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