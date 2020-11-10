import 'package:flutter/material.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_user_entity.dart';
import 'package:flutter_app/class/fashion/attention/fashion_attention_viewModel.dart';
import 'package:flutter_app/class/fashion/fashion_base_page_view.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/resource.dart';

class FashionAttentionPageView extends FashionBasePageView {

  @override
  FashionBasePageViewState<FashionBasePageView> getState() {
    return FashionAttentionPageViewState();
  }
}

class FashionAttentionPageViewState extends FashionBasePageViewState<FashionAttentionPageView> {

  FashionAttentionViewModel _viewModel = FashionAttentionViewModel();

  List<FashionAttentionUserDataPostListList> _userAttentionList = [];

  @override
  void initState() {
    super.initState();
    _viewModel.loadUserAttentionList((list) {
      setState(() {
        this._userAttentionList = list;
      });
    });
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      child: ListView.separated(
          padding: EdgeInsets.all(0),
          itemBuilder: (BuildContext context, int index){
            return _getItemBuilder(context, index);
          },
          separatorBuilder: (BuildContext context, int index){
            return Container();
          },
          itemCount: _getItemCount()),
    );
  }

  int _getItemCount() {
    int count = 1;
    return count + 1;
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    if(index == 0) {
      return _userAttentionList.isValid ? _getUserAttentionView() : Container();
    }else{
      return Container();
    }
  }

  Widget _getUserAttentionView() {
    var children = this._userAttentionList.map((e) =>
        Container(
          width: 60.dp,
          margin: EdgeInsets.only(left: 10.dp, right: 10.dp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60.dp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.dp),
                  border: Border.all(color: Color(0xffffc45c), width: 2.dp),
                ),
                child: Container(
                  width: 56.dp,
                  height: 56.dp,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.dp)
                  ),
                  child: CustomImage.memoryNetwork(
                    image: e.userAvatar,
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 8.dp)),

              Text(
                '${e.nick}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.dp,
                  fontWeight: FontWeight.normal
                ),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        )
    ).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(left: 2.dp, right: 2.dp, top: 24.dp),
              child: Row(
                  children: children
              ),
            )
        ),

        Padding(padding: EdgeInsets.only(top: 25.dp),),

        Container(
          width: 50.dp,
          height: 18.dp,
          margin: EdgeInsets.only(right: 12.dp),
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('全部', style: TextStyle(color: Colors.white, fontSize: 14.dpFontSize, fontWeight: FontWeight.normal),),
                Container(
                  margin: EdgeInsets.only(left: 8.dp),
                  width: 7.dp,
                  height: 11.dp,
                  child: CustomAssetImage.image(
                    image: ImageName.cjm_profile_more.imagePath,
                  ),
                )
              ],
            ),
            onPressed: (){

            },
          ),
        ),
      ],
    );
  }
}