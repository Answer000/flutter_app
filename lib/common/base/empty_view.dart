import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class EmptyView extends StatefulWidget {

  ImageName iconPath;

  String message;

  String itemTitle;

  VoidCallback actionCallback;

  @override
  State<StatefulWidget> createState() {
    return EmptyViewState();
  }

  EmptyView({this.iconPath, this.message, this.itemTitle, this.actionCallback});
}

class EmptyViewState extends State<EmptyView> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                              style: TextStyle(color: Colors.white, fontSize: 15.dpFontSize),
                            ),
                  )
                : Container(),

            Container(
              margin: EdgeInsets.only(top: 16.dp),
              width: 90.dp,
              height: 24.dp,
              decoration: BoxDecoration(
                color: CustomColor.mainRedColor,
                borderRadius: BorderRadius.circular(12.dp),
              ),
              child: FlatButton(
                child: Text("${this.widget.itemTitle}", style: TextStyle(color: Colors.white, fontSize: 12.dpFontSize),),
                onPressed: (){
                  this.widget.actionCallback();
                },
              ),
            )
          ],
        )
    );
  }
}