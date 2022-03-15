import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:tmdb/ui/splash/splash_screen.dart';

import '../ui/main.dart';

List<GetPage> routes = [
  ///
  /// Splash Screen
  ///
  GetPage(
    name: '/',
    page: () => const SplashScreen(),
  ),

  /// -------------------------------------------------------------

  ///
  /// Main Screen
  ///
  GetPage(
    name: '/main-screen',
    page: () => MainScreen(),
    transition: Transition.fadeIn,
  ),
];
