import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/recommend/fashion_recommend_tagList_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';

class FashionRecommendTagView extends StatefulWidget {

  final List<FashionRecommendTagListDataPostTagsLists> tagList;
  final int selectIndex;
  final Function(int) indexDidChanged;

  FashionRecommendTagView({
    Key key,
    @required this.tagList,
    @required this.selectIndex,
    this.indexDidChanged,
  }) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return FashionRecommendTagViewState();
  }
}

class FashionRecommendTagViewState extends State<FashionRecommendTagView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.dp,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              margin: EdgeInsets.only(left: 20.dp, right: 20.dp),
              child: Row(
                children: _createTagItems(
                    this.widget.tagList,
                    this.widget.selectIndex, (tag){
                }),
              )
          )
      ),
    );
  }

  List<Widget> _createTagItems(
      List<FashionRecommendTagListDataPostTagsLists> list,
      int selectIndex,
      Function(FashionRecommendTagListDataPostTagsLists) function) {
    return list.map((e){
      int index = list.indexOf(e);
      return GestureDetector(
          onTap: () {
//            function(e);
//            setState(() {
//              this._currentTagIndex = index;
//              _getPosts(isLoadMore: false);
//            });
            if(this.widget.indexDidChanged != null) {
              this.widget.indexDidChanged(index);
            }
          },
          child: Container(
            margin: EdgeInsets.only(left: index == 0 ? 0 : 16.dp),
            padding: EdgeInsets.only(left: 16.dp, right: 16.dp),
            alignment: Alignment.center,
            height: 26.dp,
            decoration: BoxDecoration(
              color: CustomColor.mainRedColor,
              borderRadius: BorderRadius.circular(13.dp),
              border: Border.all(color: index == selectIndex ? Colors.white : Colors.transparent, width: 1),
            ),
            clipBehavior: Clip.antiAlias,
            child: Text(
              e.postTagName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.dpFontSize,
                  fontWeight: FontWeight.normal
              ),
            ),
          )
      );
    }).toList();
  }
}