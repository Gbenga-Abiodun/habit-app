import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:habit_app/pages/splash/splash_page.dart';
import 'package:habit_app/routes/route_helper.dart';
import 'package:habit_app/utils/colors.dart';

import 'helpers/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monumental Habits',

      getPages: RouteHelpers.routes,
      initialRoute: RouteHelpers.getInitial(),
      theme: ThemeData(
        fontFamily: "Manrope",
        // primarySwatch: Colors.,
      ),
      // home: SplashPage(),
    );
  }
}
