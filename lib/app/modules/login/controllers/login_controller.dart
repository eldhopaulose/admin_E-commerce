import 'package:admin/app/modules/home/views/home_view.dart';
import 'package:admin/app/networks/network_model/req/login_req.dart';
import 'package:admin/app/networks/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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

  onLoginCLick(BuildContext context) async {
    AuthRepo repo = AuthRepo();
    final response = await repo.AuthSignin(LoginReq(
      email: email.text,
      password: password.text,
    ));
    if (response != null && response.error == null) {
      Get.to(HomeView());
    } else {
      MotionToast.error(
              title: const Text("Error"),
              description: Text(response!.error.toString()))
          .show(context);
    }
  }
}
