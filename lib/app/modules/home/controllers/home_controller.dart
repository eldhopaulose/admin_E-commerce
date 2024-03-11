import 'package:admin/app/networks/network_model/res/get_product_res.dart';
import 'package:admin/app/networks/network_model/res/get_user_details.dart';
import 'package:admin/app/networks/repo/auth_repo.dart';
import 'package:admin/app/networks/repo/product_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

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

  Future<GetProductRes?> fetchProductList() async {
    final ProductRepo productRepo = ProductRepo();
    final response = await productRepo.getProductList();
    return response;
  }

  Future<GetUserDetailsres?> fetchUserDetails() async {
    final AuthRepo repo = AuthRepo();
    final response = await repo.getUserDetails();
    return response;
  }
}
