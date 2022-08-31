import 'dart:io';

import 'package:camera_app/app/modules/home/controllers/home_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_print_controller.dart';

class ViewPrintView extends GetView<ViewPrintController> {
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 28, 150, 202),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 28, 150, 202),
          title: Text('View-Print'),
          centerTitle: true,
        ),
        body: GetBuilder<HomeController>(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: GridView.extent(
                maxCrossAxisExtent: 150,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(
                    _homeController.data.isNotEmpty
                        ? _homeController.data.length
                        : 0, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Hero(
                      tag: index,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFc8dde7),
                              Color(0xFFa8d3e3),
                            ],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.difference,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(
                                  _homeController.data[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          );
        }));
  }
}
