import 'package:get/get.dart';
import 'package:tmdb/ui/splash/splash_screen.dart';

import '../ui/details/movie_detail.dart';
import '../ui/main_screen.dart';

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
