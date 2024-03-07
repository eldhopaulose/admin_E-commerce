import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SellerController extends GetxController {
  //TODO: Implement SellerController

  RxList images = [].obs;
  final RxString showError = 'true'.obs;
  final RxString inputValue = ''.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final RxBool isValid = false.obs;
  final List<String> list = <String>['30%', '50%', '70%', '80%'];

  RxString dropdownValue = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> selectImages() async {
    List<XFile>? selectedImages =
        await ImagePicker().pickMultiImage(); // Select multiple images
    if (selectedImages != null) {
      images.assignAll(selectedImages
          .map((image) => File(image.path))
          .toList()); // Convert XFile to File
      update();
    }
    print(selectedImages);
  }

  // Function to upload the selected images
  void uploadImages() {
    // TODO: Implement image upload logic here
    // You can use a package like http or dio to upload the images to a server
    for (var image in images) {
      print(image.path);
    }
  }

  bool validateText(String text) {
    // Perform your validation logic here
    return text.isNotEmpty;
  }

  onSumbit() {
    if (nameController.text.isEmpty ||
        aboutController.text.isEmpty ||
        priceController.text.isEmpty) {
      showError.value = "false";
    } else {
      showError.value = "true";
    }
  }
}
