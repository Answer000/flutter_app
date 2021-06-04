import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class EmptyView extends StatefulWidget {

  ImageName iconPath;

  String message;

  TextStyle messageTextStyle;

  String itemTitle;

  VoidCallback actionCallback;

  @override
  State<StatefulWidget> createState() {
    return EmptyViewState();
  }

  EmptyView({
    this.iconPath = ImageName.cjm_empty_no_network,
    this.message = '网络错误',
    this.messageTextStyle,
    this.itemTitle,
    this.actionCallback
  }) {
    this.messageTextStyle ?? TextStyle(
        color: Colors.white,
        fontSize: 15.dpFontSize,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none
    );
  }
}

class EmptyViewState extends State<EmptyView> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Screen.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: CustomAssetImage.image(
                  image: "${this.widget.iconPath.imagePath}",
                )
            ),

            this.widget.message.isValid
                ? Container(
                    margin: EdgeInsets.only(top: 4.dp),
                    child: Text(
                      '${this.widget.message}',
                      style: this.widget.messageTextStyle,
                    ),
                  )
                : Container(),

            this.widget.itemTitle.isValid
                ? Container(
                    margin: EdgeInsets.only(top: 16.dp),
                    width: 90.dp,
                    height: 24.dp,
                    decoration: BoxDecoration(
                      color: CustomColor.mainRedColor,
                      borderRadius: BorderRadius.circular(12.dp),
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "${this.widget.itemTitle}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.dpFontSize,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none
                        )
                      ),
                      onPressed: (){
                        this.widget.actionCallback();
                      },
                    ),
                  )
                : Container()

          ],
        )
    );
  }
}