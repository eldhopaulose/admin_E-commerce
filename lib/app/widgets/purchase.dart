import 'package:admin/app/data/colors.dart';
import 'package:admin/app/modules/detail_page/views/detail_page_view.dart';
import 'package:admin/app/modules/history/controllers/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Purchase extends StatelessWidget {
  final String adress;
  final List product;
  final String totalAmount;
  final String bookingDate;
  final String bookingTime;
  final String bookingId;
  final String userId;

  const Purchase(
      {super.key,
      required this.adress,
      required this.product,
      required this.totalAmount,
      required this.bookingDate,
      required this.bookingTime,
      required this.bookingId,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 222, 238, 222),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.blue,
          width: 2,
        ),
      ),
      child: FittedBox(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 100,
                child: InkWell(
                  onTap: () {
                    Get.to(DetailPageView());
                  },
                  child: StreamBuilder(
                    stream: controller.userHomeStream,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.8, // Specify the desired width
                        child: ListView.builder(
                          shrinkWrap: true, // Add shrinkWrap property
                          itemCount: product.length,
                          itemBuilder: (context, index) {
                            final contain = product
                                .contains(snapshot.data!.products?[index].sId);
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: contain
                                      ? Image.network(
                                          snapshot.data!.products?[index]
                                                  .image![0] ??
                                              '',
                                          height: 100,
                                          fit: BoxFit.contain,
                                        )
                                      : SizedBox(),
                                ),
                                Text(
                                  contain
                                      ? snapshot.data!.products![index].name ??
                                          ''
                                      : '',
                                  style: TextStyle(
                                    color: AppColor.green,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userId,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  totalAmount,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  adress.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  bookingDate,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  bookingTime,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
