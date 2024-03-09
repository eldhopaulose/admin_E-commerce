import 'package:admin/app/networks/dio_client.dart';

enum EndPoints {
  login,
  register,
}

extension EndPointsData on EndPoints {
  String path() {
    String path = "";
    switch (this) {
      case EndPoints.login:
        path = "users/login";
      case EndPoints.register:
        path = "users/signup";
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
    }
    return token;
  }
}
