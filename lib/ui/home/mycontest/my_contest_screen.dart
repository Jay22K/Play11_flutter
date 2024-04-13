/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/ui/widgets/custom_expansion_tile.dart'
    as custom;
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/slide_route.dart';
import '../../../values/values.dart';
import '../../team/preview_screen.dart';

class MyContestScreen extends StatefulWidget {
  const MyContestScreen({Key? key}) : super(key: key);

  @override
  State<MyContestScreen> createState() => _MyContestScreenState();
}

class _MyContestScreenState extends State<MyContestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: ListView.separated(
          itemCount: 5,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return myContestCard();
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: spacingStandard);
          },
        ).wrapPadding(
            padding: const EdgeInsets.only(
                top: spacingContainer, bottom: spacingStandard)));
  }

  myContestCard() {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10))),
      color: Colors.white,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Price Pool',
                style: smallMediumTextStyle.copyWith(
                    color: secondaryTextColor, fontSize: textSizeSmall)),
            Text('Entry',
                style: smallMediumTextStyle.copyWith(
                    color: secondaryTextColor, fontSize: textSizeSmall))
          ],
        ).wrapPadding(
            padding: const EdgeInsets.only(
                left: spacingStandard,
                right: spacingStandard,
                top: spacingStandard)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/gold.png', height: 30, width: 30),
                Text('₹ 500', style: mediumTextStyle)
              ],
            ).wrapPadding(
                padding: const EdgeInsets.only(
                    right: spacingStandard, bottom: spacingStandard)),
            Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Text('₹50',
                            style: smallMediumTextStyle.copyWith(
                                color: Colors.white))
                        .wrapPaddingAll(spacingControl))
                .addMarginRight(spacingStandard)
          ],
        ).addMarginTop(spacingControl),
        SizedBox(
          width: context.width / 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('400 spots left',
                      style: smallNormalTextStyle.copyWith(
                          color: primaryColor, fontSize: textSizeSmall)),
                  Text('500 spots',
                      style: smallNormalTextStyle.copyWith(
                          fontSize: textSizeSmall))
                ],
              ),
              SizedBox(
                      height: 7,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey.shade300,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.green,
                          ),
                          value: 0.5,
                        ),
                      ))
                  .wrapPadding(
                      padding: const EdgeInsets.only(
                          top: spacingControl, bottom: spacingControl)),
              Card(
                  color: const Color(0xFFfceae8),
                  elevation: 8,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/medal.png',
                              height: 25, width: 25),
                          Text('₹ 500', style: smallMediumTextStyle)
                              .addMarginLeft(spacingControl)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/award.png',
                              height: 20, width: 20),
                          Text('5 Team Win', style: smallMediumTextStyle)
                              .addMarginLeft(spacingControl)
                        ],
                      ).addMarginLeft(spacingContainer),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/discount.png',
                              height: 18, width: 18),
                          Text('5%', style: smallMediumTextStyle)
                              .addMarginLeft(spacingControl)
                        ],
                      ).addMarginLeft(spacingContainer)
                    ],
                  ).wrapPadding(
                      padding: const EdgeInsets.only(
                          left: spacingStandard,
                          right: spacingStandard,
                          bottom: spacingControl,
                          top: spacingControl)))
            ],
          ),
        ),
        custom.ExpansionTile(
          iconColor: Colors.green,
          title: Text(
            'Joined with 1 team',
            style: smallMediumTextStyle,
          ),
          children: <Widget>[
            InkWell(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'T1',
                  textAlign: TextAlign.start,
                  style: smallNormalTextStyle,
                ).wrapPadding(
                    padding: const EdgeInsets.only(
                        left: spacingContainer,
                        right: spacingContainer,
                        top: spacingControl)),
              ),
              onTap: () => Navigator.of(context)
                  .push(SlideRightRoute(page: const PreviewScreen())),
            )
          ],
        ),
      ]).wrapPadding(
          padding: const EdgeInsets.only(
              left: spacingControl,
              right: spacingControl,
              bottom: spacingStandard)),
    ).wrapPadding(
        padding: const EdgeInsets.only(
            left: spacingStandard, right: spacingStandard));
  }
}
