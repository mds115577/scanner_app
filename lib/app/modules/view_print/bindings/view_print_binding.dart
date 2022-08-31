import 'package:get/get.dart';

import '../controllers/view_print_controller.dart';

class ViewPrintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewPrintController>(
      () => ViewPrintController(),
    );
  }
}
