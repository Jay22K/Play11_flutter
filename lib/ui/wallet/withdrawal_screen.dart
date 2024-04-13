/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:fantasy11_flutter/utils/extension_widget.dart';
import 'package:flutter/material.dart';

import '../../values/values.dart';
import '../widgets/text_form_widget.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  int currentSelect = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
          appBar: toolbarBack('Withdrawal', context),
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
                Text("Withdrawal to", style: normalTextStyle)
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
                                  'assets/bank.png',
                                  height: 50,
                                  width: 60,
                                ).wrapPadding(
                                    padding: const EdgeInsets.only(
                                        left: spacingLarge,
                                        right: spacingLarge,
                                        top: spacingLarge,
                                        bottom: spacingStandard)),
                                Text('Bank', style: mediumTextStyle),
                                const SizedBox(height: spacingContainer),
                              ],
                            ),
                          ),
                        ),
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
                            currentSelect = 1;
                          });
                        },
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              border: Border.all(
                                  color: currentSelect == 2
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
                            currentSelect = 2;
                          });
                        },
                      )
                    ]),
                const SizedBox(height: spacingContainer),
                withdrawalCard(),
                const SizedBox(height: spacingContainer),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green.shade600),
                    child: Text('Verify & Proceed',
                            style: boldTextStyle.copyWith(color: Colors.white))
                        .wrapPaddingAll(16),
                  ),
                )
              ],
            ).wrapPaddingAll(spacingContainer),
          )),
    );
  }

  withdrawalCard() {
    if (currentSelect == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("UPI Id", style: normalTextStyle)
              .addMarginLeft(spacingContainer),
          const TextFormWidget(
              radius: 8, maxLines: 1, hintText: "Enter Your UPI Id"),
        ],
      );
    } else if (currentSelect == 2) {
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
          Text("Account No", style: normalTextStyle)
              .addMarginLeft(spacingContainer),
          const TextFormWidget(
              radius: 8,
              textInputType: TextInputType.number,
              maxLines: 1,
              hintText: "Enter Account No"),
          const SizedBox(height: spacingContainer),
          Text("IFSC Code", style: normalTextStyle)
              .addMarginLeft(spacingContainer),
          const TextFormWidget(
              radius: 8, maxLines: 1, hintText: "Enter IFSC Code"),
        ],
      );
    }
  }
}
