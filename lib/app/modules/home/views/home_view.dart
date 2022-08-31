import 'package:camera_app/app/modules/view_print/views/view_print_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        SizedBox(
          width: 400,
          height: 300,
          child: Center(
            child: Lottie.asset('assets/9436-iris-scanning.json'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                final dir = await _homeController.deirrr();
                _homeController.getitems(dir);
                Get.to(ViewPrintView());
              },
              child: Container(
                height: 64,
                width: 269,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 28, 150, 202),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'View-Prints',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _homeController.cameraClick();
              },
              child: Container(
                height: 64,
                width: 269,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 28, 150, 202),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Add-Prints',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ],
    )));
  }
}
