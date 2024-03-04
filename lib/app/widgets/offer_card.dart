import 'package:admin/app/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 90,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: Text(
        '30% OFF',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 15,
          color: AppColor.black,
        ),
      )),
    );
  }
}
