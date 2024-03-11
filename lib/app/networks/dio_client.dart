import 'package:admin/app/data/url.dart';
import 'package:admin/app/networks/endpoints.dart';
import 'package:admin/app/networks/network_model/res/login_res.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as G;

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );
  }

  Future<dynamic> mainReqRes({
    required EndPoints endPoints,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    String? _token = G.Get.find<LoginRes>().email;
    if (endPoints.hasToken()) {
      String? _token = G.Get.find<LoginRes>().token;
      _dio.options.headers
          .addAll({"Authorization": "Bearer ${_token ?? "No Token"}"});
      print("Token: $_token");
    }
    print("Token: $_token");
    try {
      switch (endPoints.type()) {
        case ReqType.GET:
          response = await _dio.get(
            "$BASE_URl/${endPoints.path()}",
            queryParameters: data,
          );
          break;
        case ReqType.POST:
          response = await _dio.post(
            "$BASE_URl/${endPoints.path()}",
            data: data,
          );
          break;
        default:
          response = await _dio.post(
            "$BASE_URl/${endPoints.path()}",
            data: data,
          );
      }
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!;
      } else {
        switch (e.type) {
          case DioException.receiveTimeout:
            response = Response(
              requestOptions: e.requestOptions,
              statusMessage: "Received time out",
              statusCode: 700,
            );
            break;
          default:
            response = Response(
              requestOptions: e.requestOptions,
              statusMessage: "Some error happened",
              statusCode: 800,
            );
        }
      }
      return response;
    }
  }
}

enum ReqType {
  GET,
  POST,
  PUT,
}
