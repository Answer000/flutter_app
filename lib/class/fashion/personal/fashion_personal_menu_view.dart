import 'package:flutter/material.dart';
import 'package:flutter_app/common/extension/extension.dart';

class FashionPersonalMenuView extends StatefulWidget {

  bool isLogin;

  int fansCount;
  int followsCount;
  int likesCount;

  FashionPersonalMenuView({
    @required this.isLogin,
    this.fansCount = 0,
    this.followsCount = 0,
    this.likesCount = 0,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FashionPersonalMenuViewState();
  }
}

class FashionPersonalMenuViewState extends State<FashionPersonalMenuView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 20.dp),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.widget.isLogin ? '${this.widget.fansCount}' : '0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.dpFontSize,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 7.dp)),

                Text(
                  '粉丝',
                  style: TextStyle(
                      color: Color(0xffeeeeee),
                      fontSize: 10.dpFontSize,
                  ),
                ),
              ],
            ),
          ),

          Container(
            color: Colors.white,
            width: 1,
            height: 30.dp,
          ),

          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.widget.isLogin ? '${this.widget.followsCount}' : '0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.dpFontSize,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 7.dp)),

                Text(
                  '关注',
                  style: TextStyle(
                      color: Color(0xffeeeeee),
                      fontSize: 10.dpFontSize,
                  ),
                ),
              ],
            ),
          ),

          Container(
            color: Colors.white,
            width: 1,
            height: 30.dp,
          ),

          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.widget.isLogin ? '${this.widget.likesCount}' : '0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.dpFontSize,
                      fontWeight: FontWeight.bold
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: 7.dp)),

                Text(
                  '获赞',
                  style: TextStyle(
                      color: Color(0xffeeeeee),
                      fontSize: 10.dpFontSize,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}