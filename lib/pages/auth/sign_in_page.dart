import 'package:flutter/material.dart';
import 'package:habit_app/widgets/scroll_view.dart';

import '../../generated/assets.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  Assets.imagesSplashScreen,
                ),
              )
          ),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
