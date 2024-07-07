import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:habit_app/controller/comment_controller.dart';
import 'package:habit_app/pages/main/main_page.dart';
import 'package:habit_app/pages/splash/splash_page.dart';
import 'package:habit_app/routes/route_helper.dart';
import 'package:habit_app/utils/colors.dart';

import 'firebase_options.dart';
import 'helpers/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
        (value) =>
        runApp(
          const MyApp(),
        ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
        builder: (_) {
          return GetMaterialApp(
            builder: (context, child) {
              return Overlay(
                initialEntries: [
                  OverlayEntry(
                    builder: (context) => child!,
                  ),
                ],
              );
            },
            debugShowCheckedModeBanner: false,
            title: 'Monumental Habits',
            getPages: RouteHelpers.routes,
            initialRoute: RouteHelpers.getInitial(),
            theme: ThemeData(
              fontFamily: "Manrope",
              // primarySwatch: Colors.,
            ),
            // home: MainPage(),
          );
        });
  }
}
