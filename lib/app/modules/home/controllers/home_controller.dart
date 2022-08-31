import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;

  deirrr() async {
    Directory? directory = await getExternalStorageDirectory();
    final myImagePath = '${directory!.path}/MyImages';
    final myImgDir = await Directory(myImagePath).create();
    return myImgDir;
  }

  cameraClick() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    } else {
      final directory = await deirrr();

      File imagepath = File(image.path);

      await imagepath.copy('${directory.path}/${DateTime.now()}.jpg');

      // Directory directory = Directory.fromUri(
      //     Uri.parse('/data/data/com.example.custom_gallery/'));
      getitems(directory);
    }
  }

  List data = [];
  getitems(Directory directory) async {
    final listDir = await directory.list().toList();
    // print(listDir);
    data.clear();
    for (var i = 0; i < listDir.length; i++) {
      if (listDir[i].path.substring(
              (listDir[i].path.length - 4), (listDir[i].path.length)) ==
          '.jpg') {
        data.add(listDir[i].path);
        update();
      }
    }
  }
}
