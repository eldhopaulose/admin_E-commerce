import 'package:admin/app/data/colors.dart';
import 'package:admin/app/modules/detail_page/views/detail_page_view.dart';
import 'package:admin/app/modules/history/views/history_view.dart';
import 'package:admin/app/modules/seller/views/seller_view.dart';
import 'package:admin/app/networks/network_model/res/get_product_res.dart';
import 'package:admin/app/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    controller.onReady();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(SellerView());
          },
          child: const Icon(
            Icons.add,
            color: AppColor.white,
          ),
          backgroundColor: AppColor.green,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width > 1200
              ? MediaQuery.of(context).size.width * 0.3
              : double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: controller.fetchUserDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text('Loading...',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                              color: AppColor.green,
                            )),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    return Container(
                      height: 120,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data?.name ?? '',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.green,
                                    ),
                                  ),
                                  PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: Text('Parchase History'),
                                          value: 1,
                                        ),
                                      ];
                                    },
                                    onSelected: (value) {
                                      if (value == 1) {
                                        Get.to(HistoryView());
                                      }
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('Welcome to your dashboard',
                                  style: GoogleFonts.lobster(
                                    fontSize: 20,
                                    color: AppColor.darkGrey,
                                  )),
                              Spacer(),
                              Expanded(
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                StreamBuilder<GetProductRes?>(
                  stream: controller.userHomeStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: LoadingAnimationWidget.twistingDots(
                                leftDotColor: const Color(0xFF1A1A3F),
                                rightDotColor: Colors.green,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      MotionToast.error(
                        title: Text("Error"),
                        description: Text(snapshot.error.toString()),
                      ).show(context);
                    }
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 90, left: 10, right: 10),
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        shrinkWrap: true,
                        childAspectRatio:
                            MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(snapshot.data!.products!.length,
                            (index) {
                          final name = snapshot.data!.products![index].name!;
                          final price = snapshot.data!.products![index].price!;
                          final dicPrice =
                              snapshot.data!.products![index].discount;
                          final image =
                              snapshot.data!.products![index].image![0];

                          final originalPrice = double.parse(price);
                          final offerPrice = double.parse(dicPrice!);

                          final double percentageDiscount =
                              ((originalPrice - offerPrice) / originalPrice) *
                                  100;

                          // Your code here
                          return InkWell(
                              onTap: () => Get.to(DetailPageView(),
                                  arguments:
                                      snapshot.data!.products![index].sId!),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width,
                                    width: MediaQuery.of(context).size.width,
                                    child: ProductCard(
                                      pdName: name,
                                      pdPrice:
                                          originalPrice.truncate().toString(),
                                      pddicPrice:
                                          offerPrice.truncate().toString(),
                                      pdImage: image ?? '',
                                      offer: percentageDiscount.truncate(),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: IconButton(
                                      onPressed: () {
                                        QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.confirm,
                                          text:
                                              'Do you want to delete this item?',
                                          confirmBtnText: 'Yes',
                                          cancelBtnText: 'No',
                                          confirmBtnColor: Colors.green,
                                          onConfirmBtnTap: () {
                                            controller.onDeleteProduct(
                                              snapshot
                                                  .data!.products![index].sId!,
                                              context,
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.black54,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                          // Replace Container() with your desired widget
                        }),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
