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

class WithdrawalHistoryScreen extends StatelessWidget {
  const WithdrawalHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
          appBar: toolbarBack('My Recent Withdrawal', context),
          backgroundColor: backGroundColor,
          body: ListView.separated(
            itemCount: 15,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return withdrawalCard();
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: spacingStandard);
            },
          ).wrapPadding(
              padding: const EdgeInsets.only(
                  top: spacingStandard, bottom: spacingStandard))),
    );
  }

  withdrawalCard() {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10))),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.shade800,
                    ),
                    child: const Icon(
                      Icons.arrow_drop_up_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Text('₹ 500', style: boldTextStyle)
                      .addMarginLeft(spacingStandard),
                ],
              ),
              Text('Credited Online', style: normalTextStyle)
                  .addMarginLeft(spacingContainer),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.green.shade800, width: 2),
                ),
                child: Text('Successfully',
                        style: smallMediumTextStyle.copyWith(
                            color: Colors.green.shade800))
                    .wrapPaddingAll(8),
              )
            ],
          ).wrapPaddingAll(spacingStandard),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Id: 204252', style: smallNormalTextStyle)
                  .addMarginLeft(spacingStandard),
              Text('10 Feb 2022', style: smallNormalTextStyle)
                  .addMarginRight(spacingStandard),
            ],
          ),
          const SizedBox(height: spacingStandard)
        ],
      ),
    ).wrapPadding(
        padding: const EdgeInsets.only(
            left: spacingStandard, right: spacingStandard));
  }
}
