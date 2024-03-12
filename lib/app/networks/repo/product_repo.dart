import 'package:admin/app/networks/dio_client.dart';
import 'package:admin/app/networks/endpoints.dart';
import 'package:admin/app/networks/network_model/req/product_req.dart';
import 'package:admin/app/networks/network_model/res/delete_product.dart';
import 'package:admin/app/networks/network_model/res/get_product_res.dart';
import 'package:admin/app/networks/network_model/res/get_single_product.dart';
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

  Future<DeleteProductRes?> deleteProduct(String id) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.deleteProduct,
        queryParameters: id,
      );
      if (response.statusCode == 200) {
        final productResponse = DeleteProductRes.fromJson(response.data);
        if (productResponse.product?.sId != null) {
          return productResponse;
        } else {
          final productResponse =
              DeleteProductRes(error: "Product Not Deleted");
          return productResponse;
        }
      } else {
        final productResponse = DeleteProductRes.fromJson(response.data);
        if (response.statusCode == 500) {
          return productResponse;
        } else {
          return DeleteProductRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return DeleteProductRes(error: "Unexpected Error");
    }
  }

  Future<GetSingleProductRes?> getSingleProduct(String id) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.getSingleProduct,
        queryParameters: id,
      );
      if (response.statusCode == 200) {
        final productResponse = GetSingleProductRes.fromJson(response.data);
        if (productResponse.product?.sId != null) {
          return productResponse;
        } else {
          final productResponse =
              GetSingleProductRes(error: "Product Not Found");
          return productResponse;
        }
      } else {
        final productResponse = GetSingleProductRes.fromJson(response.data);
        if (response.statusCode == 500) {
          return productResponse;
        } else {
          return GetSingleProductRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return GetSingleProductRes(error: "Unexpected Error");
    }
  }
}
