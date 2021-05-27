

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class ASButton extends StatefulWidget {

  String icon;
  String title;
  double titleFontSize;
  FontWeight titleFontWeight;
  Color titleColor;
  double space;
  Function onPress;

  ASButton({
    @required this.icon,
    @required this.title,
    this.titleFontSize = 17,
    this.titleFontWeight = FontWeight.normal,
    this.titleColor = Colors.white,
    this.space = 5,
    this.onPress,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ASButtonState();
  }

}

class ASButtonState extends State<ASButton> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FlatButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: CustomAssetImage.image(
                image: this.widget.icon
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: this.widget.space),
              child: Text(
                '${this.widget.title}',
                style: TextStyle(
                  color: this.widget.titleColor,
                  fontSize: this.widget.titleFontSize,
                  fontWeight: this.widget.titleFontWeight,
                  decoration: TextDecoration.none
                ),
              ),
            ),
          ],
        ),
        onPressed: (){
          if(this.widget.onPress != null) {
            this.widget.onPress();
          }
        },
      ),
    );
  }
}