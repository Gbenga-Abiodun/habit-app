import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: Center(child: Text("Community Page",)),
    );
  }
}
