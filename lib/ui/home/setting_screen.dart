/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../values/values.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
          backgroundColor: backGroundColor,
          body: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              const SizedBox(height: 12),
              drawerItem('assets/menu_refer_and_earn.png', 'Refer & Earn'),
              const SizedBox(height: 12),
              drawerItem('assets/menu_point.png', 'Fantasy Points System'),
              const SizedBox(height: 12),
              drawerItem('assets/menu_refer.png', 'Refer List'),
              const SizedBox(height: 12),
              drawerItem('assets/menu_how_to_play.png', 'How to Play'),
              const SizedBox(height: 12),
              drawerItem('assets/menu_legality.png', 'Legality'),
              const SizedBox(height: 12),
              drawerItem('assets/menu_privacy.png', 'Privacy & Policy')
            ],
          )),
    );
  }

  drawerItem(String icon, String title) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 35,
          height: 35,
        ),
        Expanded(
            child: Text(title,
                    style: mediumLargeTextStyle.copyWith(color: primaryColor))
                .addMarginLeft(spacingContainer)),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
          color: primaryColor,
        )
      ],
    ).wrapPadding(
        padding: const EdgeInsets.only(
            top: spacingStandard,
            left: spacingContainer,
            right: spacingStandard));
  }
}
