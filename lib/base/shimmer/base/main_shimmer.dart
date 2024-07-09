import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainShimmer extends StatelessWidget {
  final Widget child;
  const MainShimmer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: child,
      baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(
        0.1,
      ),
    );
  }
}
