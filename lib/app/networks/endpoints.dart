import 'package:admin/app/networks/dio_client.dart';

enum EndPoints {
  login,
  register,
  getProductList,
  createProduct,
  getUserDetails,
  deleteProduct,
  getSingleProduct,
  updateProduct,
  deleteProductImage,
  updateProductImage,
  bookingHistory,
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
      case EndPoints.deleteProduct:
        path = "admin/products";
      case EndPoints.getSingleProduct:
        path = "admin/products";
      case EndPoints.updateProduct:
        path = "admin/products";
      case EndPoints.deleteProductImage:
        path = "admin/products/image";
      case EndPoints.updateProductImage:
        path = "admin/products/image";
      case EndPoints.bookingHistory:
        path = "customer/booking/getBooking";
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
      case EndPoints.deleteProduct:
        type = ReqType.DELETE;
      case EndPoints.getSingleProduct:
        type = ReqType.GET;
      case EndPoints.updateProduct:
        type = ReqType.PUT;
      case EndPoints.deleteProductImage:
        type = ReqType.DELETE;
      case EndPoints.updateProductImage:
        type = ReqType.PUT;
      case EndPoints.bookingHistory:
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
      case EndPoints.deleteProduct:
        token = false;
      case EndPoints.getSingleProduct:
        token = false;
      case EndPoints.updateProduct:
        token = false;
      case EndPoints.deleteProductImage:
        token = false;
      case EndPoints.updateProductImage:
        token = false;
      case EndPoints.bookingHistory:
        token = true;
    }
    return token;
  }
}
