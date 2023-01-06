import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:migrostore/view/app_screen/app_screen.dart';
import 'package:migrostore/view/app_screen/app_screen_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Phoenix(
      child: ChangeNotifierProvider(
        create: (_) => AppScreenController(),
        child: ScreenUtilInit(
          designSize: const Size(375.0, 812.0),
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: ZoomPageTransitionsBuilder(),
                },
              ),
            ),
            home: ChangeNotifierProvider(
              create: (_) => AppScreenController(),
              child: const AppScreen(),
            ),
          ),
        ),
      ),
    ),
  );
}
