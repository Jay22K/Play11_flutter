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

class AccountVerifyScreen extends StatelessWidget {
  const AccountVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
          appBar: toolbarBack('Account Verification', context),
          backgroundColor: backGroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
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
                    Center(
                      child: Text(
                        'Mobile Number: 8879976594',
                        style: boldLargeTextStyle,
                      ),
                    ).wrapPaddingAll(spacingContainer),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Image.asset('assets/smartphone.png',
                            height: 90, width: 90),
                        Positioned(
                            right: 4,
                            child: Image.asset('assets/check.png',
                                height: 30, width: 30))
                      ],
                    ),
                    Text('VERIFIED',
                            style: mediumTextStyle.copyWith(
                                color: Colors.green.shade800))
                        .addMarginTop(spacingContainer),
                    const SizedBox(height: spacingContainer)
                  ],
                ),
              ).wrapPaddingAll(spacingContainer),
              Card(
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
                    Center(
                      child: Text(
                        'Address Verification: Verified ',
                        style: boldLargeTextStyle,
                      ),
                    ).wrapPaddingAll(spacingContainer),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Image.asset('assets/address.png',
                            height: 90, width: 90),
                        Positioned(
                            right: 0,
                            child: Image.asset('assets/check.png',
                                height: 30, width: 30))
                      ],
                    ),
                    Text('VERIFIED',
                        style: mediumTextStyle.copyWith(
                            color: Colors.green.shade800)),
                    const SizedBox(height: spacingContainer)
                  ],
                ),
              ).wrapPadding(
                  padding: const EdgeInsets.only(
                      left: spacingContainer, right: spacingContainer)),
              Card(
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
                    Center(
                      child: Text(
                        'PAN Verification: Unverified',
                        style: boldLargeTextStyle,
                      ),
                    ).wrapPaddingAll(spacingContainer),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Image.asset('assets/id_card.png',
                            height: 90, width: 90),
                      ],
                    ),
                    const SizedBox(height: spacingContainer)
                  ],
                ),
              ).wrapPaddingAll(spacingContainer)
            ],
          )),
    );
  }
}
