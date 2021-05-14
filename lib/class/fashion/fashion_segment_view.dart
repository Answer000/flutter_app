
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FashionSegmentView extends StatefulWidget {

  final int currentIndex;
  final Function(int) indexDidChanged;

  FashionSegmentView({
    Key key,
    this.currentIndex,
    this.indexDidChanged
  }) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return FashionSegmentViewState();
  }
}

class FashionSegmentViewState extends State<FashionSegmentView> {

  @override
  Widget build(BuildContext context) {
    double _itemWidth = Screen.width / 4.0;
    double _lineWidth = 18.dp;
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 4.dp,
            child: Flex(
              direction: Axis.horizontal,
              children: _getSegmentItems(this.widget.currentIndex),
            ),
          ),

          Positioned(
            bottom: 0,
            height: 4.dp,
            width: _lineWidth,
            left: _itemWidth * (this.widget.currentIndex) + (_itemWidth - _lineWidth) * 0.5,
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.mainRedColor,
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
    List<String> titles = ['精选', '关注', '视频', '主页'];
    for(var i=0; i<titles.length; i++) {
      items.add(
        Expanded(
          flex: 1,
          child: Container(
            child: FlatButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              padding: EdgeInsets.all(0),
              child: Text(
                '${titles[i]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: i==currentIndex ? 17.dpFontSize : 14.dpFontSize,
                  fontWeight: i==currentIndex ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              onPressed: (){
                this.widget.indexDidChanged(i);
              },
            ),
          ),
        )
      );
    }
    return items;
  }
}