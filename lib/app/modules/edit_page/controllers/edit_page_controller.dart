import 'dart:io';
import 'dart:math';

import 'package:admin/app/modules/detail_page/controllers/detail_page_controller.dart';
import 'package:admin/app/modules/home/controllers/home_controller.dart';
import 'package:admin/app/networks/network_model/req/delete_product_image.dart';
import 'package:admin/app/networks/network_model/req/edit_product_req.dart';
import 'package:admin/app/networks/network_model/req/product_req.dart';
import 'package:admin/app/networks/network_model/req/update_product_image.dart';
import 'package:admin/app/networks/repo/product_repo.dart';
import 'package:admin/app/widgets/image_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class EditPageController extends GetxController {
  RxList eImages = [].obs;
  RxList imgLink = [].obs;
  RxString deleteImages = ''.obs;
  RxList imgUrl = [].obs;

  final DetailPageController detailPageController =
      Get.find<DetailPageController>();
  final HomeController homeController = Get.find<HomeController>();

  final RxString showError = 'true'.obs;
  final RxString inputValue = ''.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final List<String> list = <String>['30%', '50%', '70%', '80%'];
  RxString dropdownValue = '30%'.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    detailPageController.fetchSingleProduct(Get.arguments[0]);
    nameController.text = Get.arguments[1];
    aboutController.text = Get.arguments[2];
    priceController.text = Get.arguments[3];
    print('id: ${imgLink}');
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
  void uploadImages(BuildContext context, id) async {
    // TODO: Implement image upload logic here
    // You can use a package like http or dio to upload the images to a server
    for (var image in eImages) {
      print(image.path);

      try {
        String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('Product');
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);

        await referenceImageToUpload.putFile(File(image.path));

        String imageUrl = await referenceImageToUpload.getDownloadURL();

        // Update the imgUrl variable with the uploaded image URL
        imgUrl.add(imageUrl);

        final ProductRepo repo = ProductRepo();
        final response = await repo.updateProductImage(
            id,
            UpdateProductImageReq(
              image: imageUrl,
            ));

        if (response != null && response.error == null) {
          detailPageController.fetchSingleProduct(id);
          Get.find<DetailPageController>().fetchSingleProduct(id);
          MotionToast.success(
                  title: const Text("Success"),
                  description: const Text("Image uploaded successfully"))
              .show(context);
        } else {
          MotionToast.error(
                  title: const Text("Error"),
                  description: Text(response!.error.toString()))
              .show(context);
        }

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

  onClickDelete(id, BuildContext context) async {
    ProductRepo repo = ProductRepo();
    print('imageeeee');
    print(deleteImages.value);
    final response = await repo.deleteProductImage(
        id,
        DeleteProductImageReq(
          image: [deleteImages.value],
        ));

    if (response != null && response.error == null) {
      detailPageController.fetchSingleProduct(id);
      MotionToast.success(
              title: const Text("Success"),
              description: const Text("Image Deleted"))
          .show(context);
    } else {
      MotionToast.error(
              title: const Text("Error"),
              description: Text(response!.error.toString()))
          .show(context);
    }
  }

  onClickUpdate(id, BuildContext context, List img) async {
    ProductRepo repo = ProductRepo();
    final productPrice = double.parse(priceController.text);
    final discount =
        double.parse(dropdownValue.value.trim().replaceAll('%', ''));
    final discountedPrice = productPrice - (productPrice * (discount / 100));
    final response = await repo.updateProduct(
      ProductReq(
        name: nameController.text.toString(),
        about: aboutController.text.toString(),
        price: priceController.text.toString(),
        discount: discountedPrice.toString(),
      ),
      id,
    );
    if (response != null && response.error == null) {
      homeController.fetchProductList();
      MotionToast.success(
              title: const Text("Success"),
              description: const Text("Product updated successfully"))
          .show(Get.context!);
      Get.find<DetailPageController>().fetchSingleProduct(id);
      Get.back();
    } else {
      MotionToast.error(
              title: const Text("Error"),
              description: Text(response!.error.toString()))
          .show(Get.context!);
    }
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
