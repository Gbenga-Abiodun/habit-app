import 'package:flutter/material.dart';

import '../../utils/colors.dart';

final  Gradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [
    AppColors.scaffoldBg2,
    AppColors.scaffoldBg2.withOpacity(0.0),
  ],
  stops: [
    0.45, // Adjust this value to move the scaffoldBg2 color further up or down
    1.0,
  ],);

final  courseCardGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    AppColors.textInputColor.withOpacity(0.5,),
    Colors.transparent
  ],
);

LinearGradient signUpGradient()=> Gradient;
LinearGradient courseCard()=> courseCardGradient;