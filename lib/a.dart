import 'package:admin/app/data/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SellerPage extends GetView<SellerController> {
  final controller = Get.put(SellerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Product Price: \$${controller.productPrice.value.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            Obx(() => Text(
                  'Discount: ${controller.discount.value.toStringAsFixed(2)}%',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            Obx(() => Text(
                  'Discounted Price: \$${controller.discountedPrice.value.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 20),
            TextButton(
              child: Text('Apply Discount'),
              onPressed: () {
                Get.to(DiscountPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SellerController extends GetxController {
  var productPrice = 0.0.obs;
  var discount = 0.0.obs;
  var discountedPrice = 0.0.obs;

  void applyDiscount() {
    discountedPrice.value =
        productPrice.value - (productPrice.value * (discount.value / 100));
  }
}

class DiscountPage extends GetView<SellerController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SellerController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Discount Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Product Price',
              ),
              onChanged: (value) {
                controller.productPrice.value = double.parse(value);
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Discount',
              ),
              onChanged: (value) {
                controller.discount.value = double.parse(value);
              },
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text('Apply Discount'),
              onPressed: () {
                controller.applyDiscount();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Categories Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Categories Demo'),
        ),
        body: Center(
          child: SellerPage(),
        ),
      ),
    );
  }
}
