import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:tmdb/ui/splash/splash_screen.dart';

import '../ui/main_screen.dart';
import '../ui/recommended/movie_detail.dart';

class Routes {
  static const splash = '/';
  static const mainScreen = '/main-screen';
  static const detailScreen = '/detail-screen';
}

List<GetPage> routes = [
  ///
  /// Splash Screen
  ///
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
    transition: Transition.fadeIn,
  ),

  /// -------------------------------------------------------------

  ///
  /// Main Screen
  ///
  GetPage(
    name: Routes.mainScreen,
    page: () => const MainScreen(),
    transition: Transition.fadeIn,
  ),

  GetPage(
    name: Routes.detailScreen,
    page: () {
      var index = Get.parameters['pageId'];
      return MovieDetailScreen(pageId: int.parse(index!));
    },
    transition: Transition.fadeIn,
  ),
];
