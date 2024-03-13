import 'dart:async';

import 'package:admin/app/networks/network_model/res/get_single_product.dart';
import 'package:admin/app/networks/repo/product_repo.dart';
import 'package:get/get.dart';

class DetailPageController extends GetxController {
  //TODO: Implement DetailPageController

  final id = Get.arguments.toString();
  @override
  void onInit() {
    super.onInit();
    fetchSingleProduct(id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final StreamController<GetSingleProductRes?> _fetchSingleDataControler =
      StreamController<GetSingleProductRes?>.broadcast();
  Stream<GetSingleProductRes?> get AdminSIngleStream =>
      _fetchSingleDataControler.stream;

  Future fetchSingleProduct(id) async {
    final ProductRepo repo = ProductRepo();
    final response = await repo.getSingleProduct(id);
    _fetchSingleDataControler.add(response);
  }

  // Future<GetSingleProductRes?> fetchSingleProduct(id) async {
  //   final ProductRepo repo = ProductRepo();
  //   final response = await repo.getSingleProduct(id);
  //   return response;
  // }
}
