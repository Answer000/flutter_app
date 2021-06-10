import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class/home/home_page_entity.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:flutter_app/common/https/https.dart';

enum HomePageViewType {
  saveBeauty,   /// 美丽救急
  nightBeauty,  /// 超级夜美人
}

class HomePageView extends StatefulWidget {

  final HomePageViewType type;

  Function refreshDataSource;

  HomePageView({
    Key key,
    this.type
  }) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    return HomePageViewState();
  }
}

class HomePageViewState extends State<HomePageView>  with AutomaticKeepAliveClientMixin {

  List<HomePageDataRecommandListLists> dataSource = [];

  @override
  void initState() {
    super.initState();
    _loadPageSources();

    this.widget.refreshDataSource = (){
      _loadPageSources();
    };
  }

  @protected
  bool get wantKeepAlive => true;

  /// 获取列表数据
  _loadPageSources() async {
    var apiPath = this.widget.type == HomePageViewType.saveBeauty
        ? APIPath.home_saveBeauty
        : APIPath.home_nightBeauty;
    Map<String,dynamic> params = {'pageSize' : 4, 'pageNo' : 1};
    await Https().post(
        apiPath: apiPath,
        params: params,
        onSuccess: (data){
          var entity = HomePageEntity().fromJson(data);
          setState(() {
            this.dataSource = entity.data.recommendList.lists;
          });
        }, onFailure: (error){});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
      padding: EdgeInsets.only(top: 10.dp, left: 30.dp, right: 30.dp),
      itemCount: this.dataSource.length + 1,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index){
        if(index == this.dataSource.length) {
          return Container(
              child: Column(
                children: [
                  Container(
                    height: 20,
                    child: RawMaterialButton(
                      padding: EdgeInsets.all(0),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Text(
                        '查看更多MORE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.dpFontSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {
                        print('查看更多');
                      },
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 1,
                    width: 68.dp,
                  ),
                ],
              )
          );
        }
        return GestureDetector(
          onTap: () => print("${this.dataSource[index].picUrl}"),
          child: Container(
            height: 114.dp,
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(5.dp),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.dp),
              child: CustomImage.memoryNetwork(
                image: this.dataSource[index].picUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index){
        return Container(
          height: 12.dp,
        );
      },
    );
  }
}