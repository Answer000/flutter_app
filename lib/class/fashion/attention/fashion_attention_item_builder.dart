

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/post_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class FashionAttentionItemBuilder extends StatefulWidget {

  final PostEntity postEntity;

  FashionAttentionItemBuilder({
    Key key,
    @required this.postEntity
  }) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return FashionAttentionItemBuilderState();
  }
}

class FashionAttentionItemBuilderState extends State<FashionAttentionItemBuilder> {

  EdgeInsets get _margin => EdgeInsets.only(left: 33.dp, right: 33.dp);

  int get _crossAxisCount => 3;
  double get _mainAxisSpacing => 5.dp;
  double get _crossAxisSpacing => 5.dp;

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.cyan,
      margin: _margin,
      padding: EdgeInsets.only(bottom: 16.dp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 60.dp,
                    height: 60.dp,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Color(0xff5f5f5f),
                      borderRadius: BorderRadius.circular(30.dp),
                    ),
                    child: CustomImage.memoryNetwork(
                        image: this.widget.postEntity.post.userAvatar
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 9.dp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${this.widget.postEntity.post.nick}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.dpFontSize,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                        Text(
                          '${this.widget.postEntity.post.createTime}',
                          style: TextStyle(
                              color: Color(0xffb4b4b4),
                              fontSize: 10.dpFontSize,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

              GestureDetector(
                child: Container(
                    width: 10.dp,
                    height: 20.dp,
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 4,
                      child: CustomAssetImage.image(
                        image: ImageName.cjm_fashion_item_menu.imagePath,
                      ),
                    )
                ),
                onTap: () {

                },
              )
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 10.dp),
            child: Text(
              '${this.widget.postEntity.content}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 12.dpFontSize,
                  fontWeight: FontWeight.normal
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 8.dp),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Color(0xff424242),
              borderRadius: BorderRadius.circular(5.dp),
            ),
            child: _getImageContainer()
          ),

          Container(
            color: Colors.red,
            height: 50.dp,
          )
        ],
      ),
    );
  }

  Widget _getImageContainer() {
    switch(this.widget.postEntity.postType) {
      case PostType.image:
        if (this.widget.postEntity.post.postImgList.isNotValid) {
          return Container();
        }
        return this.widget.postEntity.post.postImgList.length == 1 ?
        Container(
          width: this.widget.postEntity.getImageSizeWith().width,
          height: this.widget.postEntity.getImageSizeWith().height,
          child: CustomImage.memoryNetwork(
            image: this.widget.postEntity.picUrl,
          ),
        ) :
        Container(
          color: Colors.red,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                mainAxisSpacing: _mainAxisSpacing,
                crossAxisSpacing: _crossAxisSpacing
            ),
            itemBuilder: (BuildContext context, int index){
              return Container(
                color: Colors.blue,
              );
            },itemCount: this.widget.postEntity.post.postImgList.length,
          ),
        );

      case PostType.video:
        double itemW = (Screen.width - _margin.left - _margin.right - (_crossAxisCount - 1) * _crossAxisSpacing) / _crossAxisCount;
        Size imgSize = this.widget.postEntity.getImageSizeWith(width: itemW);
        return Container(
          width: imgSize.width,
          height: imgSize.height,
          child: CustomImage.memoryNetwork(
            image: this.widget.postEntity.picUrl,
          ),
        );
      default: return Container();
    }
  }
}