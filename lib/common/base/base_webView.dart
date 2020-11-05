import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/base/base_container.dart';
import 'package:flutter_app/common/base/constant.dart';
import 'package:flutter_app/common/extension/extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class BaseWebView extends BaseContainer {
  String _url;
  String _title;

  static BaseWebView init({@required String url, String title}) {
    BaseWebView view = BaseWebView();
    view._url = url;
    view._title = title;
    return view;
  }

  @override
  BaseContainerState<BaseContainer> getState() {
    return BaseWebViewState();
  }

  /// 子类重写
  // 网页链接
  String get url => this._url;
  // 标题
  String get title => this._title;
}

class BaseWebViewState extends BaseContainerState<BaseWebView>  {

  @override
  void initState() {
    super.initState();
    if(this.widget.isShowNavigationBar) {
      this.navigationBar.title = this.widget.title;
    }
  }

  @override
  Widget setContentView(BuildContext context) {
    return Container(
      color: CustomColor.blackGroundColor,
      child: WebView(
        initialUrl: this.widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}