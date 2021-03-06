import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tmdb/route/routes.dart';
import 'package:tmdb/ui/splash/splash_screen.dart';
import '/dependencies/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   tools: [...DevicePreview.defaultTools],
    //   builder: (context) => const MyApp(),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 732),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        builder: (context, widget) {
          //add this line
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        // initialRoute: '/',
        getPages: routes,
        home: const SplashScreen(),
      ),
    );
  }
}
