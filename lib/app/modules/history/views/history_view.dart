import 'package:admin/app/data/colors.dart';
import 'package:admin/app/widgets/purchase.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Details',
              style: TextStyle(
                color: AppColor.green,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ) // You can set the color of the text
              ),
          centerTitle: false,
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              child: Purchase(),
            );
          },
        ));
  }
}
