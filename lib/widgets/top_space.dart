import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class TopSpace extends StatelessWidget {
  const TopSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height12 * 3.75,
    );
  }
}
