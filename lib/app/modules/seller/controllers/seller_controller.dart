import 'dart:io';
import 'package:admin/app/modules/home/controllers/home_controller.dart';
import 'package:admin/app/networks/network_model/req/product_req.dart';
import 'package:admin/app/networks/repo/product_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class SellerController extends GetxController {
  RxList images = [].obs;
  RxList imgUrl = [].obs;
  final RxString showError = 'true'.obs;
  final RxString inputValue = ''.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final RxBool isValid = false.obs;
  final List<String> list = <String>['30%', '50%', '70%', '80%'];

  RxString dropdownValue = '30%'.obs;

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
    images.assignAll(selectedImages
        .map((image) => File(image.path))
        .toList()); // Convert XFile to File
    update();
    print(selectedImages);
  }

  // Function to upload the selected images
  void uploadImages(BuildContext context) async {
    // TODO: Implement image upload logic here
    // You can use a package like http or dio to upload the images to a server
    for (var image in images) {
      print(image.path);

      try {
        String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('profile');
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);

        await referenceImageToUpload.putFile(File(image.path));

        String imageUrl = await referenceImageToUpload.getDownloadURL();

        // Update the imgUrl variable with the uploaded image URL
        imgUrl.add(imageUrl);

        // Notify GetX that a variable has changed, so it updates the UI
      } catch (e) {
        MotionToast.error(
                title: const Text("Error"),
                description: const Text("Error uploading image"))
            .show(context);

        return;
      }
    }
  }

  bool validateText(String text) {
    // Perform your validation logic here
    return text.isNotEmpty;
  }

  onSumbit() async {
    if (nameController.text.isEmpty ||
        aboutController.text.isEmpty ||
        priceController.text.isEmpty) {
      showError.value = "false";
    } else {
      showError.value = "true";

      final productPrice = double.parse(priceController.text);
      final discount =
          double.parse(dropdownValue.value.trim().replaceAll('%', ''));
      final discountedPrice = productPrice - (productPrice * (discount / 100));

      final ProductRepo repo = ProductRepo();
      final response = await repo.createProduct(
        ProductReq(
          name: nameController.text,
          about: aboutController.text,
          price: priceController.text,
          discount: discountedPrice.toString(),
          image: imgUrl.cast<String>(),
        ),
      );
      if (response != null && response.error == null) {
        MotionToast.success(
                title: const Text("Success"),
                description: const Text("Product created successfully"))
            .show(Get.context!);
        Get.find<HomeController>().fetchProductList();
        Get.back();
      } else {
        MotionToast.error(
                title: const Text("Error"),
                description: Text(response!.error.toString()))
            .show(Get.context!);
      }
    }
  }
}
