import 'dart:async';
import 'package:admin/app/networks/network_model/res/get_product_res.dart';
import 'package:admin/app/networks/network_model/res/get_user_details.dart';
import 'package:admin/app/networks/repo/auth_repo.dart';
import 'package:admin/app/networks/repo/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final StreamController<GetProductRes?> _featchDataControler =
      StreamController<GetProductRes?>.broadcast();
  Stream<GetProductRes?> get userHomeStream => _featchDataControler.stream;

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
  }

  @override
  void onReady() {
    super.onReady();
    fetchProductList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchProductList() async {
    final ProductRepo productRepo = ProductRepo();
    final response = await productRepo.getProductList();
    _featchDataControler.add(response);
  }

  Future<GetUserDetailsres?> fetchUserDetails() async {
    final AuthRepo repo = AuthRepo();
    final response = await repo.getUserDetails();
    return response;
  }

  onDeleteProduct(String id, BuildContext context) async {
    final ProductRepo repo = ProductRepo();
    final response = await repo.deleteProduct(id);
    if (response != null && response.error == null) {
      MotionToast.success(
              title: const Text("Success"),
              description: const Text("Product Deleted Successfully"))
          .show(context);
      fetchProductList();
      Get.back();

      update();

      // Update the UI
    } else {
      MotionToast.error(description: Text(response!.error.toString()))
          .show(context);
    }
  }
}
