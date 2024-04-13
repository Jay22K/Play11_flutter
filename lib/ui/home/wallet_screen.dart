/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/ui/cash/add_cash_screen.dart';
import 'package:fantasy11_flutter/ui/wallet/withdrawal_history_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../utils/slide_route.dart';
import '../../values/values.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
          backgroundColor: backGroundColor,
          body: Column(children: [
            const SizedBox(height: spacingStandard),
            Center(
              child: SizedBox(
                width: 200,
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Column(children: [
                    Text('Total Balance', style: mediumTextStyle).wrapPadding(
                        padding: const EdgeInsets.only(
                            left: spacingContainer,
                            right: spacingContainer,
                            top: spacingStandard,
                            bottom: spacingStandard)),
                    Image.asset('assets/rupee_symbol.png',
                        height: 45, width: 45),
                    Text('₹ 500', style: mediumTextStyle).wrapPadding(
                        padding: const EdgeInsets.only(
                            left: spacingContainer,
                            right: spacingContainer,
                            top: spacingStandard,
                            bottom: spacingStandard)),
                  ]),
                ),
              ),
            ),
            InkWell(
              child: SizedBox(
                child: Card(
                    color: Colors.green.shade900,
                    elevation: 8,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Text("Add Cash",
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style:
                        smallMediumTextStyle.copyWith(color: Colors.white))
                        .wrapPadding(
                        padding: const EdgeInsets.only(
                            left: spacingContainer,
                            right: spacingContainer,
                            top: spacingStandard,
                            bottom: spacingStandard))),
              ).addMarginTop(spacingStandard),
              onTap: () => Navigator.of(context)
                  .push(SlideRightRoute(page: const AddCashScreen())),
            ),
            SizedBox(
              width: context.width,
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount Added',
                          textAlign: TextAlign.start,
                          style: boldTextStyle.copyWith(color: Colors.black54),
                        ).wrapPadding(
                            padding: const EdgeInsets.only(
                                left: spacingContainer,
                                right: spacingContainer,
                                top: spacingControl,
                                bottom: spacingControl)),
                        Text(
                          '₹ 0',
                          style: boldTextStyle.copyWith(color: Colors.black87),
                        ).wrapPadding(
                            padding: const EdgeInsets.only(
                                left: spacingContainer,
                                right: spacingContainer,
                                bottom: spacingControl))
                      ],
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: Image.asset(
                        'assets/menu_info.png',
                        height: 20,
                        width: 20,
                      ),
                    )
                  ],
                ),
              ),
            ).wrapPaddingAll(spacingStandard),
            SizedBox(
              width: context.width,
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Winnings',
                          textAlign: TextAlign.start,
                          style: boldTextStyle.copyWith(color: Colors.black54),
                        ).wrapPadding(
                            padding: const EdgeInsets.only(
                                left: spacingContainer,
                                right: spacingContainer,
                                top: spacingControl,
                                bottom: spacingControl)),
                        Text(
                          '₹ 500',
                          style: boldTextStyle.copyWith(color: Colors.black87),
                        ).wrapPadding(
                            padding: const EdgeInsets.only(
                                left: spacingContainer,
                                right: spacingContainer,
                                bottom: spacingControl))
                      ],
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: Image.asset(
                        'assets/menu_info.png',
                        height: 20,
                        width: 20,
                      ),
                    )
                  ],
                ),
              ),
            ).wrapPadding(
                padding: const EdgeInsets.only(
                    left: spacingStandard,
                    right: spacingStandard,
                    bottom: spacingStandard)),
            InkWell(
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('My Recent Withdrawal', style: mediumTextStyle),
                      const Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.black)
                    ]).wrapPaddingAll(spacingContainer),
              ).wrapPadding(
                  padding: const EdgeInsets.only(
                      left: spacingStandard,
                      right: spacingStandard,
                      bottom: spacingControl)),
              onTap: () => Navigator.of(context)
                  .push(SlideRightRoute(page: const WithdrawalHistoryScreen())),
            )
          ])),
    );
  }
}
