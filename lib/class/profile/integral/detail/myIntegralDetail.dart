import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class/profile/integral/detail/myIntegralDetailViewModel.dart';
import 'package:flutter_app/class/profile/integral/detail/myIntegral_detail_data_entity.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';

class MyIntegralDetail extends BaseContainer {

  @override
  BaseContainerState<BaseContainer> getState() {
    // TODO: implement getState
    return MyIntegralDetailState();
  }

  @override
  // TODO: implement isShowBackground
  bool get isShowBackground => false;

  @override
  // TODO: implement isNeedLogin
  bool get isNeedLogin => true;
}

class MyIntegralDetailState extends BaseContainerState<MyIntegralDetail> {

  MyIntegralDetailViewModel _viewModel = MyIntegralDetailViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.navigationBar.title = "积分明细";

    _loadDatas(isDown: true);
  }

  _loadDatas({bool isDown, Function callback}) {
    this._viewModel.loadDatas(isDown, (){
      this.setState(() {});
      if(callback != null) {
        callback();
      }
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    // TODO: implement setContentView
    return Container(
      margin: EdgeInsets.only(top: 20.dp),
      child: CustomRefresher(
        onRefresh: (refresh) {
          this._loadDatas(
              isDown: true,
              callback: ()=> refresh.setRefreshCompleted()
          );
        },
        onLoading: (refresh) {
          this._loadDatas(
              isDown: false,
              callback: ()=> refresh.setLoadStatus(this._viewModel.loadStatus)
          );
        },
        child: ListView.separated(
            itemBuilder: (context, index){
              return _setRow(this._viewModel.list[index]);
            },
            separatorBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(bottom: 10.dp),
              );
            },
            itemCount: this._viewModel.list.length),
      )
    );
  }

  Widget _setRow(MyIntegralDetailDataDataIntegralListLists entity){
    return Container(
      margin: EdgeInsets.only(left: 16.dp, right: 16.dp),
      height: 55.dp,
      decoration: BoxDecoration(
        color: CustomColor.hexColor("0x222222"),
        borderRadius: BorderRadius.circular(3.dp),
      ),
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
                  '${entity.description}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 4.dp)),

                Text(
                  '${entity.createTime}',
                  style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none
                  ),
                ),
              ],
            ),
          ),



          Container(
            margin: EdgeInsets.only(right: 15.dp),
            child: this._viewModel.setDesc(entity),
          ),
        ],
      ),
    );
  }
}