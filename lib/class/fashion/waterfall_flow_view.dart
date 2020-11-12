import 'package:flutter/cupertino.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/common/tools/custom_refresher.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resource.dart';

class WaterfallFlowView extends StatefulWidget {

  final List<PostEntity> dataSource;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final EdgeInsets padding;
  final Function(CustomRefresher) onLoading;
  final Function(CustomRefresher) onRefresh;

  WaterfallFlowView({
    Key key,
    @required this.dataSource,
    this.crossAxisCount,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.padding,
    this.onRefresh,
    this.onLoading,
  }) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return WaterfallFlowViewState();
  }
}

class WaterfallFlowViewState extends State<WaterfallFlowView> {

  @override
  Widget build(BuildContext context) {
    return CustomRefresher(
      onLoading: this.widget.onLoading,
      onRefresh: this.widget.onRefresh,
      child: this.widget.dataSource.isNotValid
          ? Container()
          : WaterfallFlow.builder(
        padding: this.widget.padding,
        itemCount: this.widget.dataSource.length ?? 0,
        gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: this.widget.crossAxisCount,
            crossAxisSpacing: this.widget.crossAxisSpacing,
            mainAxisSpacing: this.widget.mainAxisSpacing,
            lastChildLayoutTypeBuilder: (index) => LastChildLayoutType.none
        ),
        itemBuilder: (BuildContext context, int index) {
          return _getItemBuilder(this.widget.dataSource[index]);
        },
      ),
    );
  }

  Widget _getItemBuilder(PostEntity post) {
    double itemWidth = (Screen.width - this.widget.padding.left - this.widget.padding.right - this.widget.crossAxisSpacing) / this.widget.crossAxisCount.toDouble();
    Size itemSize = post.getImageSizeWith(width: itemWidth);
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.only(bottom: 15.dp),
      decoration: BoxDecoration(
        color: Color(0xff2c2c2c),
        borderRadius: BorderRadius.circular(10.dp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: itemSize.width,
            height: itemSize.height,
            child: CustomImage.memoryNetwork(
              image: post.picUrl,
              size: itemSize,
            ),
          ),

          post.topicName.isValid
              ? Container(
            margin: EdgeInsets.only(left: 10.dp, top: 15.dp, right: 10.dp),
            height: 15.dp,
            child: Text(
              '#${post.topicName}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.dpFontSize,
                fontWeight: FontWeight.normal,),
            ),
          )
              : Container(),

          post.content.isValid
              ? Container(
            margin: EdgeInsets.only(left: 10.dp, top: 13.dp, right: 10.dp),
            child: Text(
              '#${post.content}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.dpFontSize,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
              : Container(),

          Container(
            margin: EdgeInsets.only(left: 10.dp, top: 5.dp, right: 10.dp),
            height: 20.dp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20.dp,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: CustomImage.memoryNetwork(
                          image: post.post.userAvatar,
                          size: Size(20.dp, 20.dp),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 6.dp),
                      child: Text(
                        '${post.post.nick}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.dp,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 12.dp,
                      child: FlatButton(
                          padding: EdgeInsets.all(0),
                          child: CustomAssetImage.image(
                            image: post.isPraise ? ImageName.cjm_waterfall_like.imagePath : ImageName.cjm_waterfall_unlike.imagePath,
                          )
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 1.dp),
                      child: Text(
                        '${post.post.praiseNum}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.dp,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}