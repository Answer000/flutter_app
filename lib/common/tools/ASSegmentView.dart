import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ASSegmentView extends StatefulWidget {

  int currentIndex = 0;     /// 默认选中下标
  List<String> titles;  /// 按钮名称集合
  Color normalTextColor;  /// 正常字体颜色
  Color selectTextColor;  /// 选中字体颜色
  double normalFontSize;  /// 正常字体大小
  double selectFontSize;  /// 选中字体大小
  FontWeight normalFontWeight;  /// 正常按钮字体
  FontWeight selectFontWeight;    /// 选中按钮字体
  Color scrollLineColor;   /// 滑块颜色
  double scrollLineWidth;       /// 滑块尺寸
  Color backgroundColor;  /// 背景颜色
  double height;
  Function(int) indexDidChanged;

  ASSegmentView({
    this.currentIndex = 0,
    @required this.titles,
    this.normalFontSize = 14,
    this.selectFontSize = 17,
    this.normalTextColor = Colors.white,
    this.selectTextColor = Colors.white,
    this.normalFontWeight = FontWeight.normal,
    this.selectFontWeight = FontWeight.bold,
    this.scrollLineColor = Colors.white,
    this.scrollLineWidth = 18,
    this.backgroundColor = Colors.black,
    this.height = 44,
    this.indexDidChanged
  });

  @override
  State<StatefulWidget> createState() {
    return ASSegmentViewState();
  }
}

class ASSegmentViewState extends State<ASSegmentView> {

  @override
  Widget build(BuildContext context) {
    if(this.widget.titles == null) {
      return Container();
    }
    double _itemWidth = Screen.width / this.widget.titles.length;
    return Container(
      color: this.widget.backgroundColor,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Flex(
              direction: Axis.horizontal,
              children: _getSegmentItems(this.widget.currentIndex),
            ),
          ),

          Positioned(
            bottom: 0,
            height: 4.dp,
            width: this.widget.scrollLineWidth,
            left: _itemWidth * (this.widget.currentIndex) + (_itemWidth - this.widget.scrollLineWidth) * 0.5,
            child: Container(
              decoration: BoxDecoration(
                color: this.widget.scrollLineColor,
                borderRadius: BorderRadius.circular(2.dp),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _getSegmentItems(int currentIndex) {
    List<Widget> items = [];
    for(var i=0; i<this.widget.titles.length; i++) {
      items.add(
          Expanded(
            flex: 1,
            child: Container(
              child: FlatButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                child: Container(
                  height: this.widget.height,
                  child: Center(
                    child: Text(
                      '${this.widget.titles[i]}',
                      style: TextStyle(
                        color: i==currentIndex ? this.widget.selectTextColor : this.widget.normalTextColor,
                        fontSize: i==currentIndex ? this.widget.selectFontSize : this.widget.normalFontSize,
                        fontWeight: i==currentIndex ? this.widget.selectFontWeight : this.widget.normalFontWeight,
                      ),
                    ),
                  )
                ),
                onPressed: (){
                  setState(() {
                    this.widget.currentIndex = i;
                  });
                  if (this.widget.indexDidChanged != null) {
                    this.widget.indexDidChanged(i);
                  }
                },
              ),
            ),
          )
      );
    }
    return items;
  }
}