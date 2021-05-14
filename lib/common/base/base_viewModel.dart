

import 'package:pull_to_refresh/pull_to_refresh.dart';

enum ASSourceStatus {
  initial,
  hasData,
  empty,
  noNetwork,
}

class ASBaseViewModel {

  ASSourceStatus sourceStatus = ASSourceStatus.initial;

  /// 上拉刷新状态
  LoadStatus loadStatus = LoadStatus.idle;

}