import 'package:admin/app/data/colors.dart';
import 'package:admin/app/modules/detail_page/views/detail_page_view.dart';
import 'package:admin/app/modules/history/views/history_view.dart';
import 'package:admin/app/modules/seller/views/seller_view.dart';
import 'package:admin/app/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Hi Eldho',
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
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 90, left: 10, right: 10),
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    shrinkWrap: true,
                    childAspectRatio:
                        MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(20, (index) {
                      // Your code here
                      return InkWell(
                          onTap: () => Get.to(DetailPageView()),
                          child: ProductCard());
                      // Replace Container() with your desired widget
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
