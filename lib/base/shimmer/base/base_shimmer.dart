import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmer extends StatelessWidget {
  const BaseShimmer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(child: child, baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(
        0.1,
      ),);
  }
}
