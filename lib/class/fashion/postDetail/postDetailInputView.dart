import 'package:flutter/material.dart';
import 'package:flutter_app/class/login/loginUserInfoManager.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class PostDetailInputView extends StatefulWidget {

  FocusNode focusNode;
  String hintText;
  String content;
  Function sendCallback;
  Function(bool isShow) showKeyboardCallback;
  Function(String content) onChanged;
  PostDetailInputView({
    this.focusNode,
    this.hintText,
    this.content,
    this.showKeyboardCallback,
    this.sendCallback,
    this.onChanged
  }) {
    this.focusNode ??= FocusNode();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostDetailInputViewState();
  }
}

class PostDetailInputViewState extends State<PostDetailInputView> with WidgetsBindingObserver{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        if(MediaQuery.of(context).viewInsets.bottom == 0){
          /// 键盘关闭
          this.widget.showKeyboardCallback(false);
        }else{
          /// 键盘弹起
          this.widget.showKeyboardCallback(true);
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: CustomColor.mainRedColor,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
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
                        child: new TextField(
                          controller: TextEditingController.fromValue(
                              TextEditingValue(
                                  text: this.widget.content ?? "",
                                  selection: TextSelection.fromPosition(
                                      TextPosition(
                                          affinity: TextAffinity.downstream,
                                          offset: "${this.widget.content ?? ""}".length
                                      )
                                  )
                              )
                          ),
                          keyboardType: TextInputType.text,
                          focusNode: this.widget.focusNode,
                          textInputAction: TextInputAction.send,
                          decoration: new InputDecoration(
                            hintText: this.widget.hintText,
                            hintStyle: TextStyle(
                                color: Color(0xff262626).withOpacity(1),
                                fontSize: 12.dp,
                                fontWeight: FontWeight.normal
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) => this.widget.onChanged(value),
                          onEditingComplete: ()=> this.widget.sendCallback(),
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
                      onPressed: ()=> this.widget.sendCallback(),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}