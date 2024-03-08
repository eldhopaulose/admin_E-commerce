import 'dart:io';
import 'dart:math';

import 'package:admin/app/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:image_picker/image_picker.dart';

class EditPageController extends GetxController {
  RxList eImages = [].obs;

  List items = [].obs;

  Rx<RxList<ImageSlider>> images = RxList<ImageSlider>([
    ImageSlider(
        src:
            "https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk="),
    ImageSlider(
        src:
            "https://sb.kaleidousercontent.com/67418/960x550/5d1ca08941/marketing-removebg-1.png"),
    ImageSlider(
        src:
            "https://res.cloudinary.com/demo/image/upload/e_background_removal/docs/rmv_bgd/dog_couch_orig.png")
  ]).obs;

  final RxString showError = 'true'.obs;
  final RxString inputValue = ''.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final List<String> list = <String>['30%', '50%', '70%', '80%'];
  RxString dropdownValue = ''.obs;

  final count = 0.obs;
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
      eImages.assignAll(selectedImages
          .map((image) => File(image.path))
          .toList()); // Convert XFile to File
      // Convert XFile to File
      update();
    }

    print(selectedImages);
  }

  // Function to upload the selected images
  void uploadImages() {
    // TODO: Implement image upload logic here
    // You can use a package like http or dio to upload the images to a server
    for (var image in eImages) {
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
