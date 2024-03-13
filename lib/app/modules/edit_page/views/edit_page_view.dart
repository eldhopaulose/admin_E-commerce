import 'package:admin/app/data/colors.dart';
import 'package:admin/app/modules/edit_page/controllers/edit_page_controller.dart';
import 'package:admin/app/widgets/commmon_button.dart';
import 'package:admin/app/widgets/image_slider.dart';
import 'package:admin/app/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditPageView extends GetView<EditPageController> {
  const EditPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(EditPageController());
    final arg = Get.arguments;
    print('arg: $arg');

    late List img = [];

    print(arg[4]);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Edit',
              style: TextStyle(
                color: AppColor.green,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ) // You can set the color of the text
              ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: controller.detailPageController.AdminSIngleStream,
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: snapshot.data!.product!.image!.length == 0
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                            'assets/images/noimage.svg',
                                            semanticsLabel: 'No Image'),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        snapshot.data!.product!.image!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey[300],
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width, // Specify the width of the container
                                                height:
                                                    200, // Specify the height of the container
                                                child: ImageSlider(
                                                  src: snapshot.data!.product!
                                                      .image![index],
                                                ),
                                              ),
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.deleteImages
                                                            .value =
                                                        snapshot.data!.product!
                                                            .image![index];
                                                    controller.onClickDelete(
                                                        snapshot.data!.product!
                                                            .sId!,
                                                        context);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      color: Colors.red,
                                                    ),
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 30,
                                                      color: AppColor.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        );
                },
              ),
              Obx(() => controller.imgUrl.length == 0
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 90,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.imgUrl.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300],
                                        ),
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.3, // Specify the width of the container
                                        height:
                                            80, // Specify the height of the container
                                        child: index < controller.imgUrl.length
                                            ? Image.network(
                                                controller.imgUrl[index])
                                            : Container(), // Add a check to ensure the index is valid
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )),
              CommonButton(
                  btnButtonWidth: 200,
                  btnText: 'Add Image',
                  btnHeight: 50,
                  btnOnPressed: () {
                    print('Add Image Button Pressed');
                    controller.selectImages().then((_) {
                      // Call the uploadImages function to upload the selected images
                      controller.uploadImages(context, arg[0]);
                    });
                  }),
              SizedBox(
                height: 10,
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
                            controller.onClickUpdate(arg[0], context, img);
                          },
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
