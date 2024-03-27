import 'dart:async';

import 'package:admin/app/networks/network_model/res/booking_history_res.dart';
import 'package:admin/app/networks/network_model/res/get_product_res.dart';
import 'package:admin/app/networks/repo/history.dart';
import 'package:admin/app/networks/repo/product_repo.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final StreamController<GetProductRes?> _featchDataControler =
      StreamController<GetProductRes?>.broadcast();
  Stream<GetProductRes?> get userHomeStream => _featchDataControler.stream;

  final StreamController<BookingHistoryRes?> _featchBookingControler =
      StreamController<BookingHistoryRes?>.broadcast();
  Stream<BookingHistoryRes?> get bookingStream =>
      _featchBookingControler.stream;

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
    bookingDetails();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchProductList() async {
    final ProductRepo productRepo = ProductRepo();
    final response = await productRepo.getProductList();
    _featchDataControler.add(response);
  }

  Future bookingDetails() async {
    final HistoryRepo historyRepo = HistoryRepo();
    final response = await historyRepo.bookingHistory();
    _featchBookingControler.add(response);
  }
}
