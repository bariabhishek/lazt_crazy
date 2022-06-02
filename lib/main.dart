import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lzycrazy/constant/app_theme.dart';
import 'package:lzycrazy/utils/size_config.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'controllers/controller_binding.dart';
import 'utils/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: "Lazy Crazy",
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinding(),
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: AppTheme.primaryColor,
          accentColor: AppTheme.accentColor,
        ),
      ),
        initialRoute: '/login',
        getPages: Routes.routes
    );
  }
}

