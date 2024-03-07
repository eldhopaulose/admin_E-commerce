import 'package:admin/app/data/colors.dart';
import 'package:admin/app/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:get/get.dart';

import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  const DetailPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPageView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSlideshow(
            /// Width of the [ImageSlideshow].
            width: double.infinity,

            /// Height of the [ImageSlideshow].
            height: 200,

            /// The page to show when first creating the [ImageSlideshow].
            initialPage: 0,

            /// The color to paint the indicator.
            indicatorColor: AppColor.green,

            /// The color to paint behind th indicator.
            indicatorBackgroundColor: Colors.grey,

            /// The widgets to display in the [ImageSlideshow].
            /// Add the sample image file into the images folder
            children: [
              ImageSlider(
                  src:
                      "https://sb.kaleidousercontent.com/67418/960x550/3e324c0328/individuals-removed.png"),
              ImageSlider(
                  src:
                      "https://sb.kaleidousercontent.com/67418/960x550/5d1ca08941/marketing-removebg-1.png"),
              ImageSlider(
                  src:
                      "https://res.cloudinary.com/demo/image/upload/e_background_removal/docs/rmv_bgd/dog_couch_orig.png")
            ],

            /// Called whenever the page in the center of the viewport changes.
            onPageChanged: (value) {
              print('Page changed: $value');
            },

            /// Auto scroll interval.
            /// Do not auto scroll with null or 0.

            /// Loops back to first slide.
            isLoop: false,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "This is the detail page",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Total Reviews: 1000',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '300',
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '300',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 20,
                  color: AppColor.darkGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
