import 'package:admin/app/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width > 1200
              ? MediaQuery.of(context).size.width * 0.3
              : double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio:
                            MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
                      ),
                      children: const [
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                        ProductCard(),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
