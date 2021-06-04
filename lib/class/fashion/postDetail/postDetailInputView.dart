

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class PostDetailInputView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostDetailInputViewState();
  }
}

class PostDetailInputViewState extends State<PostDetailInputView> {

  final TextEditingController _controller = TextEditingController();

  String _contentText = "1341324";
  String get contentText => _contentText;
  set contentText(value) {
    _contentText = value;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
          color: CustomColor.mainRedColor,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: Screen.bottomBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 9.dp),
                        padding: EdgeInsets.only(left: 17.dp, right: 17.dp),
                        height: 34.dp,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17.dp)
                        ),
                        child: Container(
                          color: Colors.cyan,
                          child: new TextField(
                            controller: TextEditingController.fromValue(
                                TextEditingValue(
                                    text: this.contentText,
                                    selection: TextSelection.fromPosition(
                                        TextPosition(
                                            affinity: TextAffinity.downstream,
                                            offset: contentText.length
                                        )
                                    )
                                )
                                    ),
                            decoration: new InputDecoration(
                              hintText: '请输入您的评论...',
                              hintStyle: TextStyle(
                                  color: Color(0xff262626).withOpacity(1),
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.normal
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (value){
                              this.setState(() {
                                this.contentText = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 7.dp, right: 8.dp),
                      width: 46.dp,
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: CustomAssetImage.image(
                          image: ImageName.cjm_post_detail_send.imagePath,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}