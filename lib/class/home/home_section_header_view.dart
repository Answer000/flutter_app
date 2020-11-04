import 'package:flutter/material.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class HomeSectionHeaderView extends StatefulWidget {

  final double leftValue;
  final double rightValue;
  final double viewHeight;
  final Function(int) indexDidChanged;

  HomeSectionHeaderView({
    Key key,
    @required this.leftValue,
    @required this.rightValue,
    @required this.viewHeight,
    @required this.indexDidChanged,
  }) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return HomeSectionHeaderViewState();
  }
}

class HomeSectionHeaderViewState extends State<HomeSectionHeaderView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.blackGroundColor,
      padding: EdgeInsets.only(left: 22.dp, right: 22.dp),
      height: this.widget.viewHeight ?? 44.dp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 30.dp,
              width: (65 + 35 * this.widget.leftValue).dp,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: (11 + 4 * this.widget.leftValue).dp,
                      height: (18 + 6 * this.widget.leftValue).dp,
                      child: CustomAssetImage.image(
                        image: ImageName.cjm_home_officialRecommend_icon.imagePath,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 8.dp),
                      height: (12 + 6 * this.widget.leftValue).dp,
                      child: Text(
                        '美丽救急',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: (10 + 5 * this.widget.leftValue).dp,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: (){
                  this.widget.indexDidChanged(0);
                },
              )
          ),

          Container(
              height: 30.dp,
              width: (85 + 50 * this.widget.rightValue).dp,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: (13 + 13 * this.widget.rightValue).dp,
                      height: (12 + 11 * this.widget.rightValue).dp,
                      child: CustomAssetImage.image(
                        image: ImageName.cjm_home_videoInstructional_icon.imagePath,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 8.dp),
                      height: (12 + 6 * this.widget.rightValue).dp,
                      child: Text(
                        '超级"夜"美人',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: (10 + 5 * this.widget.rightValue).dp,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: (){
                  this.widget.indexDidChanged(1);
                },
              )
          ),
        ],
      ),
    );
  }
}