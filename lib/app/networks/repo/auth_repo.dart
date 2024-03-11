import 'package:admin/app/networks/dio_client.dart';
import 'package:admin/app/networks/endpoints.dart';
import 'package:admin/app/networks/network_model/req/login_req.dart';
import 'package:admin/app/networks/network_model/req/register_req.dart';
import 'package:admin/app/networks/network_model/res/login_res.dart';
import 'package:admin/app/networks/network_model/res/register_res.dart';
import 'package:dio/dio.dart';

import '../network_model/res/get_user_details.dart';

class AuthRepo {
  final DioClient dioClient = DioClient(Dio());
  Future<RegisterRes?> AuthSignup(RegisterReq registerReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.register,
        data: registerReq.toJson(),
      );
      if (response.statusCode == 200) {
        final signupResponse = RegisterRes.fromJson(response.data);
        if (signupResponse.token != null) {
          return signupResponse;
        } else {
          final signupResponse =
              RegisterRes(error: "User Not Register! Something wrong");
          return signupResponse;
        }
      } else {
        final signupResponse = RegisterRes.fromJson(response.data);
        if (response.statusCode == 500) {
          return signupResponse;
        } else {
          return RegisterRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return RegisterRes(error: "Unexpected Error");
    }
  }

  Future<LoginRes?> AuthSignin(LoginReq loginReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.login,
        data: loginReq.toJson(),
      );
      if (response.statusCode == 200) {
        final signinResponse = LoginRes.fromJson(response.data);
        if (signinResponse.token != null) {
          return signinResponse;
        } else {
          final signinResponse =
              LoginRes(error: "User Not Register! Something wrong");
          return signinResponse;
        }
      } else {
        final signinResponse = LoginRes.fromJson(response.data);
        if (response.statusCode == 500) {
          return signinResponse;
        } else {
          return LoginRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return LoginRes(error: "Unexpected Error");
    }
  }

  Future<GetUserDetailsres?> getUserDetails() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.getUserDetails,
      );
      if (response.statusCode == 200) {
        final userResponse = GetUserDetailsres.fromJson(response.data);
        return userResponse;
      } else {
        return GetUserDetailsres.fromJson(response.data);
      }
    } catch (e) {
      return GetUserDetailsres(error: "Unexpected Error");
    }
  }
}
