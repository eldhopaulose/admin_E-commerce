import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var selectedCategory = "".obs;

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}

class CategoriesButton extends StatelessWidget {
  final String category;
  final CategoriesController controller = Get.find();

  CategoriesButton({required this.category});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: () {
          controller.selectCategory(category);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            controller.selectedCategory.value == category
                ? Colors.green
                : Colors.grey,
          ),
        ),
        child: Text(category),
      ),
    );
  }
}

void main() {
  Get.put(CategoriesController());
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    // Obx(
                    //   () => Text(
                    //     'Selected category: ${Get.find<CategoriesController>().selectedCategory.value}',
                    //   ),
                    // ),
                    Icon(Icons.ac_unit),
                    CategoriesButton(category: 'mobiles'),
                  ],
                ),
              ),
              CategoriesButton(category: 'fan'),
            ],
          ),
        ),
      ),
    );
  }
}
