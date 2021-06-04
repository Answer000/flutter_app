import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/post_model_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';

class PostGoodsScrollView extends StatefulWidget {

  final List<PostModelPostGoods> postGoods;

  PostGoodsScrollView(this.postGoods);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostGoodsScrollViewState();
  }
}

class PostGoodsScrollViewState extends State<PostGoodsScrollView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(this.widget.postGoods.isNotValid) {
      return Container();
    }
    return Container(
      height: 96.dp,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(4.dp),
              width: 228.dp,
              height: 88.dp,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.dp),
                boxShadow: [BoxShadow(
                  color: CustomColor.hexColor("0x623200",alpha: 0.2),
                  offset: Offset(0,0),
                  blurRadius: 3.dp,
                  spreadRadius: 0.2
                )]
              ),
              child: _setRow(this.widget.postGoods[index]),
            );
          },
          separatorBuilder: (context, index){
            return Container();
          },
          itemCount: this.widget.postGoods.length),
    );
  }

  Widget _setRow(PostModelPostGoods goods) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: 88.dp,
            height: 88.dp,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.dp),
                  bottomLeft: Radius.circular(10.dp)
              ),
            ),
            child: CustomImage.assetNetwork(
              image: goods.picUrl,
              size: Size(88.dp, 88.dp),
            ),
          ),

          Positioned(
            left: 100.dp,
            top: 15.dp,
            right: 12.dp,
            child: Text(
              goods.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.dpFontSize,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  height: 1.1
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),

          Positioned(
            left: 100.dp,
            bottom: 12.dp,
            right: 18.dp,
            child: Row(
              children: [
                Text(
                  "￥ ${goods.price ?? 0}",
                  style: TextStyle(
                    color: CustomColor.hexColor("0xDA3E47"),
                    fontSize: 10.dpFontSize,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 12.dp),
                    height: 24.dp,
                    decoration: BoxDecoration(
                      color: CustomColor.hexColor("0xEBEBEB"),
                      borderRadius: BorderRadius.circular(12.dp)
                    ),
                  )
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}