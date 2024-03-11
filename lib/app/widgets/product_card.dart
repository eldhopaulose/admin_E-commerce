import 'dart:ffi';

import 'package:admin/app/data/colors.dart';
import 'package:admin/app/widgets/offer_card.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String pdName;
  final String pdPrice;
  final String pddicPrice;
  final String pdImage;
  final offer;

  const ProductCard(
      {super.key,
      required this.pdName,
      required this.pdPrice,
      required this.pddicPrice,
      required this.pdImage,
      required this.offer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.width > 600 ? 50 : 70,
              right: MediaQuery.of(context).size.width > 600 ? 0 : 0,
              left: MediaQuery.of(context).size.width > 600 ? 0 : 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width > 600 ? 300 : 150,
                  width: MediaQuery.of(context).size.height > 600 ? 300 : 140,
                  child: Image.network(
                    pdImage,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: OfferCard(offer: offer),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width > 600 ? 250 : 197,
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    color: AppColor.white,
                  ),
                  height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pdName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColor.Darkblue,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              pddicPrice,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: AppColor.black,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              pdPrice,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w100,
                                fontSize: 13,
                                color: AppColor.Darkblue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
