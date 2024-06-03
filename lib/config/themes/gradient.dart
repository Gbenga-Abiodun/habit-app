import 'package:flutter/material.dart';

import '../../utils/colors.dart';

final  Gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.transparent,
    AppColors.scaffoldBg2,



  ],);

LinearGradient signUpGradient()=> Gradient;