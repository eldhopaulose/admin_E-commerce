import 'package:admin/app/data/colors.dart';
import 'package:admin/app/widgets/commmon_button.dart';
import 'package:admin/app/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/seller_controller.dart';

class SellerView extends GetView<SellerController> {
  const SellerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SellerController controller = Get.put(SellerController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Sell Your Product',
            style: TextStyle(
              color: AppColor.green,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ) // You can set the color of the text
            ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     controller.selectImages().then((_) {
            //       // Call the uploadImages function to upload the selected images
            //       controller.uploadImages();
            //     });
            //   },
            //   child: Text('Select Images'),
            // ),
            // SizedBox(height: 16),
            // Obx(() => Text('Selected Images: ${controller.images.length}')),
            // SizedBox(height: 16),
            // Expanded(
            //   child: Obx(() => ListView.builder(
            //         itemCount: controller.images.length,
            //         itemBuilder: (context, index) {
            //           return Container(
            //             margin: EdgeInsets.all(8),
            //             width: 200, // Specify the width of the container
            //             height: 200, // Specify the height of the container
            //             child: Image.file(controller.images[index]),
            //           );
            //         },
            //       )),
            // ),
            Obx(
              () => controller.images.length == 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.selectImages().then((_) {
                              // Call the uploadImages function to upload the selected images
                              controller.uploadImages();
                            });
                          },
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/images/camera.svg',
                            height: 100,
                            width: 100,
                          )),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                width: MediaQuery.of(context)
                                    .size
                                    .width, // Specify the width of the container
                                height:
                                    200, // Specify the height of the container
                                child: Image.file(
                                  controller.images[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 15,
            ),
            Obx(() => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Column(
                        children: [
                          InputTextField(
                            textController: controller.nameController,
                            isValid: controller.showError.value,
                            validateText: (Value) {
                              controller.inputValue.value = Value;
                            },
                            textName: "Product Name",
                            isMaxLines: false,
                            isType: false,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputTextField(
                            textController: controller.aboutController,
                            isValid: controller.showError.value,
                            validateText: (Value) {
                              controller.inputValue.value = Value;
                            },
                            textName: "About",
                            isMaxLines: true,
                            isType: false,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputTextField(
                            textController: controller.priceController,
                            isValid: controller.showError.value,
                            validateText: (Value) {
                              controller.inputValue.value = Value;
                            },
                            textName: "product Price",
                            isMaxLines: false,
                            isType: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownMenu<String>(
                        width: MediaQuery.of(context).size.width * 0.92,
                        initialSelection: controller.list.first,
                        onSelected: (String? value) {
                          controller.dropdownValue.value = value!;
                        },
                        dropdownMenuEntries: controller.list
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: CommonButton(
                        btnButtonWidth: double.infinity,
                        btnText: 'Submit',
                        btnHeight: 50,
                        btnOnPressed: () {
                          controller.onSumbit();
                          print('submit');
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
