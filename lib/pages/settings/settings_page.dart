import 'package:flutter/material.dart';
import 'package:habit_app/widgets/custom_settings_card.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/top_space.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg2,
      body: Column(
        children: [
          TopSpace(),
          CustomAppBar(
            hasCircleImage: false,
            pageTitle: "Settings",
            hasNoTrailing: true,
            onTapLeading: () {},
            leadingIcon: Icon(
              Icons.menu_outlined,
              color: AppColors.eclipse,
              size: Dimensions.height11 * 2,
            ),
          ),
          SizedBox(
            height: Dimensions.height12 *  4,
          ),
          CustomSettingsCard(),
        ],
      ),
    );
  }
}
