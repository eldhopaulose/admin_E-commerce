import 'package:admin/app/networks/network_model/res/get_single_product.dart';
import 'package:admin/app/networks/repo/product_repo.dart';
import 'package:get/get.dart';

class DetailPageController extends GetxController {
  //TODO: Implement DetailPageController

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

  Future<GetSingleProductRes?> fetchSingleProduct(id) async {
    final ProductRepo repo = ProductRepo();
    final response = await repo.getSingleProduct(id);
    return response;
  }
}
