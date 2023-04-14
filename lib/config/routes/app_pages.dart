import 'package:get/get.dart';
import 'package:marvel_app/presentation/views/Splash.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const Splash(),
      transition: Transition.circularReveal,
    ),
  ];
}
