
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
  
//  int currentIndex = 0;

  double _itemSpace = Screen.width / 8.0;
  double _lineWidth = 30.dp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 4.dp,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _getSegmentItems(this.widget.currentIndex),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            height: 4.dp,
            width: _lineWidth,
            left: _itemSpace * (this.widget.currentIndex * 2 + 1) - (_itemSpace - _lineWidth * 0.5) * 0.5,
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
    List<String> titles = ['推荐', '关注', '话题', '主页'];
    for(var i=0; i<titles.length; i++) {
      items.add(
        Container(
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
        )
      );
    }
    return items;
  }

}