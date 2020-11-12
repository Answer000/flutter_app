import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


// ignore: must_be_immutable
class CustomRefresher extends StatefulWidget {

  Function(CustomRefresher) onRefresh;
  Function(CustomRefresher) onLoading;
  Widget child;

  CustomRefresher({
    Key key,
    this.onRefresh,
    this.onLoading,
    @required this.child
  }) : super(key: key);

  RefreshController _controller = RefreshController(initialRefresh: false);
  RefreshController get controller => _controller;

  @override
  State<StatefulWidget> createState() {
    return CustomRefresherState();
  }

  setLoadStatus(LoadStatus status) {
    if(this.controller.isLoading) {
      this.controller.footerMode?.value = status;
    }
  }

  setRefreshCompleted() {
    if(this.controller.isRefresh) {
      this.controller.refreshCompleted();
    }
  }
}

class CustomRefresherState extends State<CustomRefresher> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: this.widget._controller,
      onRefresh: (){
        this.widget.onRefresh(this.widget);
      },
      onLoading: (){
        this.widget.onLoading(this.widget);
      },
      header: WaterDropHeader(
        completeDuration: Duration(milliseconds: 300),
        waterDropColor: Colors.red,
        complete: Center(child: Text('加载完成', style: TextStyle(color: Colors.white),),),
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus status){
          String text;
          Widget body;
          if(status == LoadStatus.idle) {
            text = "上拉加载更多";
          }else if(status == LoadStatus.loading) {
            text = "加载中...";
          }else if(status == LoadStatus.failed) {
            text = "数据加载失败！";
          }else if(status == LoadStatus.canLoading) {
            text = "松手立马加载";
          }else{
            text = "到底了";
          }
          body = Text(text, style: TextStyle(color: Colors.white));
          return Container(
            height: 55.0,
            child: Center(child: body,),
          );
        },
      ),
      child: this.widget.child,
    );
  }
}