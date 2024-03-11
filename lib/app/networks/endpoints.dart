import 'package:admin/app/networks/dio_client.dart';

enum EndPoints {
  login,
  register,
  getProductList,
  createProduct,
  getUserDetails
}

extension EndPointsData on EndPoints {
  String path() {
    String path = "";
    switch (this) {
      case EndPoints.login:
        path = "admin/users/login";
      case EndPoints.register:
        path = "admin/users/signup";
      case EndPoints.createProduct:
        path = "admin/products";
      case EndPoints.getProductList:
        path = "admin/products";
      case EndPoints.getUserDetails:
        path = "admin/users/single";
    }
    return path;
  }

  ReqType type() {
    ReqType type;
    switch (this) {
      case EndPoints.login:
        type = ReqType.POST;
      case EndPoints.register:
        type = ReqType.POST;
      case EndPoints.createProduct:
        type = ReqType.POST;
      case EndPoints.getProductList:
        type = ReqType.GET;
      case EndPoints.getUserDetails:
        type = ReqType.GET;
    }
    return type;
  }

  bool hasToken() {
    bool token = false;
    switch (this) {
      case EndPoints.login:
        token = false;
      case EndPoints.register:
        token = false;
      case EndPoints.createProduct:
        token = false;
      case EndPoints.getProductList:
        token = false;
      case EndPoints.getUserDetails:
        token = true;
    }
    return token;
  }
}
