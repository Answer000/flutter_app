import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class HomeMenuView extends StatefulWidget {

  final double viewHeight;

  HomeMenuView({@required this.viewHeight});

  @override
  State<StatefulWidget> createState() {
    return HomeMenuViewState();
  }
}

class HomeMenuViewState extends State<HomeMenuView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.widget.viewHeight ?? 146.dp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 11.dp),
            height: 41.dp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 22),
                  width: 12.dp,
                  height: 24.dp,
                  child: CustomAssetImage.image(
                    image: ImageName.cjm_home_functionalSelect_icon.imagePath,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 8.dp),
                  child: Text(
                    '陪你变美',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.dpFontSize,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 22.dp, right: 22.dp),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: CustomAssetImage.image(
                        image: ImageName.cjm_home_online_icon.imagePath
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 12),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 100,
                    child: CustomAssetImage.image(
                        image: ImageName.cjm_home_offline_icon.imagePath
                    ),
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