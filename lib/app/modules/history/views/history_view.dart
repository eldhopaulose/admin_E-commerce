import 'package:admin/app/data/colors.dart';
import 'package:admin/app/widgets/purchase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController());
    controller.bookingDetails();
    controller.fetchProductList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: TextStyle(
            color: AppColor.green,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder(
          stream: controller.bookingStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No data available'));
            } else {
              final bookings = snapshot.data!.bookings;
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: bookings!.length,
                  itemBuilder: (context, index) {
                    final address = bookings[index].address?.first ?? '';
                    final product = bookings[index].product ?? [];
                    final totalAmount = bookings[index].totalAmount ?? '';
                    final bookingDate = bookings[index].bookingDate ?? '';
                    final bookingTime = bookings[index].bookingTime ?? '';
                    final bookingId = bookings[index].bookingId ?? '';
                    final userId = bookings[index].userId ?? '';

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Purchase(
                        adress: address.toString(),
                        product: product as List<dynamic>,
                        totalAmount: totalAmount.toString(),
                        bookingDate: bookingDate.toString(),
                        bookingTime: bookingTime.toString(),
                        bookingId: bookingId.toString(),
                        userId: userId.toString(),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
