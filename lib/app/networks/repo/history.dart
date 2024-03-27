import 'package:admin/app/networks/dio_client.dart';
import 'package:admin/app/networks/endpoints.dart';
import 'package:admin/app/networks/network_model/res/booking_history_res.dart';
import 'package:dio/dio.dart';

class HistoryRepo {
  DioClient dioClient = DioClient(Dio());

  Future<BookingHistoryRes?> bookingHistory() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.bookingHistory,
      );
      if (response.statusCode == 200) {
        final bookingHistoryResponse =
            BookingHistoryRes.fromJson(response.data);
        if (bookingHistoryResponse.bookings != null) {
          return bookingHistoryResponse;
        } else {
          final bookingHistoryResponse =
              BookingHistoryRes(error: "Product Not Found");
          return bookingHistoryResponse;
        }
      } else {
        final bookingHistoryResponse =
            BookingHistoryRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return bookingHistoryResponse;
        } else {
          return BookingHistoryRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return BookingHistoryRes(error: "Unexpected Error");
    }
  }
}
