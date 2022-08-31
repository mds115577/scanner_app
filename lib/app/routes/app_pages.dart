import 'package:get/get.dart';

import 'package:camera_app/app/modules/home/bindings/home_binding.dart';
import 'package:camera_app/app/modules/home/views/home_view.dart';

import 'package:camera_app/app/modules/view_print/bindings/view_print_binding.dart';
import 'package:camera_app/app/modules/view_print/views/view_print_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_PRINT,
      page: () => ViewPrintView(),
      binding: ViewPrintBinding(),
    ),
  ];
}
