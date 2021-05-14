import 'package:flutter/material.dart';

class ASSliverPersistentHeaderViewDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxExtentValue;
  final double minExtentValue;

  ASSliverPersistentHeaderViewDelegate({
    @required this.child,
    @required this.maxExtentValue,
    @required this.minExtentValue
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.maxExtentValue;

  @override
  double get minExtent => this.minExtentValue;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}