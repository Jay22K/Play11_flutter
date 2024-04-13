/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/ui/cash/payment_status_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:fantasy11_flutter/utils/extension_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/slide_route.dart';
import '../../values/values.dart';
import '../widgets/text_form_widget.dart';

class AddCashScreen extends StatefulWidget {
  const AddCashScreen({Key? key}) : super(key: key);

  @override
  State<AddCashScreen> createState() => _AddCashScreenState();
}

class _AddCashScreenState extends State<AddCashScreen> {
  int currentSelect = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
          appBar: toolbarBack('Add Cash', context),
          backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Balance',
                          style:
                              boldLargeTextStyle.copyWith(color: Colors.white)),
                      Text('₹ 500',
                          style:
                              boldLargeTextStyle.copyWith(color: Colors.white))
                    ],
                  ).wrapPaddingAll(spacingContainer),
                ),
                const SizedBox(height: spacingContainer),
                Text("Amount", style: normalTextStyle)
                    .addMarginLeft(spacingContainer),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const TextFormWidget(
                        radius: 8,
                        textInputType: TextInputType.number,
                        textInputFormatter: [],
                        maxLines: 1,
                        hintText: "Enter Amount"),
                    Positioned(
                      top: 4,
                      right: 0,
                      child: Container(
                        width: 50,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: primaryColor),
                        child: Text('₹',
                                textAlign: TextAlign.center,
                                style: normalLargeTextStyle.copyWith(
                                    fontSize: textSizeLarge,
                                    color: Colors.white))
                            .wrapPaddingAll(10),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: spacingContainer),
                Text("Payment through", style: normalTextStyle)
                    .addMarginLeft(spacingContainer),
                const SizedBox(height: spacingStandard),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                border: Border.all(
                                    color: currentSelect == 0
                                        ? primaryColor
                                        : Colors.white,
                                    width: 2)),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/upi.png',
                                    height: 60,
                                    width: 60,
                                  ).wrapPadding(
                                      padding: const EdgeInsets.only(
                                          left: spacingLarge,
                                          right: spacingLarge,
                                          top: spacingLarge)),
                                  Text('UPI', style: mediumTextStyle),
                                  const SizedBox(height: spacingContainer),
                                ],
                              ),
                            )),
                        onTap: () {
                          setState(() {
                            currentSelect = 0;
                          });
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              border: Border.all(
                                  color: currentSelect == 1
                                      ? primaryColor
                                      : Colors.white,
                                  width: 2)),
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/paypal.png',
                                    height: 50,
                                    width: 50,
                                  ).wrapPadding(
                                      padding: const EdgeInsets.only(
                                          left: spacingLarge,
                                          right: spacingLarge,
                                          top: spacingLarge,
                                          bottom: spacingStandard)),
                                  Text('Paypal', style: mediumTextStyle),
                                  const SizedBox(height: spacingContainer),
                                ],
                              )),
                        ),
                        onTap: () {
                          setState(() {
                            currentSelect = 1;
                          });
                        },
                      )
                    ]),
                const SizedBox(height: spacingContainer),
                addCashCard(),
                const SizedBox(height: spacingContainer),
                InkWell(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.green.shade600),
                      child: Text('Next',
                              style: boldTextStyle.copyWith(color: Colors.white))
                          .wrapPadding(padding: const EdgeInsets.only(left: spacingLarge, right: spacingLarge, top: spacingContainer, bottom: spacingContainer)),
                    ),
                  ),
                  onTap: () => Navigator.of(context)
                      .pushReplacement(SlideRightRoute(page: PaymentStatusScreen(status: currentSelect))),
                )
              ],
            ).wrapPaddingAll(spacingContainer),
          )),
    );
  }

  addCashCard() {
    if (currentSelect == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Paypal Id", style: normalTextStyle)
              .addMarginLeft(spacingContainer),
          const TextFormWidget(
              radius: 8, maxLines: 1, hintText: "Enter Your Paypal Id"),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("UPI Id", style: normalTextStyle)
              .addMarginLeft(spacingContainer),
          const TextFormWidget(
              radius: 8, maxLines: 1, hintText: "Enter Your UPI Id"),
        ],
      );
    }
  }
}
