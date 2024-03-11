import 'package:admin/app/networks/dio_client.dart';
import 'package:admin/app/networks/endpoints.dart';
import 'package:admin/app/networks/network_model/req/product_req.dart';
import 'package:admin/app/networks/network_model/res/get_product_res.dart';
import 'package:admin/app/networks/network_model/res/product_res.dart';
import 'package:dio/dio.dart';

class ProductRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<GetProductRes?> getProductList() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.getProductList,
      );
      if (response.statusCode == 200) {
        final productResponse = GetProductRes.fromJson(response.data);
        if (productResponse.products != null) {
          return productResponse;
        } else {
          final productResponse = GetProductRes(error: "Product Not Found");
          return productResponse;
        }
      } else {
        final productResponse = GetProductRes.fromJson(response.data);
        if (response.statusCode == 500) {
          return productResponse;
        } else {
          return GetProductRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return GetProductRes(error: "Unexpected Error");
    }
  }

  Future<ProductRes?> createProduct(
    ProductReq productReq,
  ) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.createProduct,
        data: productReq.toJson(),
      );
      if (response.statusCode == 200) {
        final productResponse = ProductRes.fromJson(response.data);
        if (productResponse.product?.sId != null) {
          return productResponse;
        } else {
          final productResponse = ProductRes(error: "Product Not Created");
          return productResponse;
        }
      } else {
        final productResponse = ProductRes.fromJson(response.data);
        if (response.statusCode == 500) {
          return productResponse;
        } else {
          return ProductRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return ProductRes(error: "Unexpected Error");
    }
  }
}
