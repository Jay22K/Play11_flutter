/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/ui/home/mycontest/coming_contest_details_screen.dart';
import 'package:fantasy11_flutter/ui/team/create_team_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/slide_route.dart';
import '../../../values/values.dart';

class ComingContestScreen extends StatefulWidget {
  const ComingContestScreen({Key? key}) : super(key: key);

  @override
  State<ComingContestScreen> createState() => _ComingContestScreenState();
}

class _ComingContestScreenState extends State<ComingContestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return contestCard();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: spacingStandard);
              },
            ).wrapPadding(
                padding: const EdgeInsets.only(top: spacingContainer)),
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                ),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text('Create Team',
                          style: mediumTextStyle.copyWith(color: Colors.white))
                      .wrapPadding(
                          padding: const EdgeInsets.only(
                              top: spacingControl,
                              bottom: spacingControl,
                              right: spacingStandard,
                              left: spacingStandard)),
                ),
                Image.asset(
                  'assets/create_team.png',
                  height: 45,
                  width: 45,
                )
              ],
            ).wrapPaddingAll(spacingStandard),
            onTap: () => Navigator.of(context)
                .push(SlideRightRoute(page: const CreateTeamScreen())),
          )
        ],
      ),
    );
  }

  contestCard() {
    return InkWell(
      child: Stack(alignment: Alignment.center, children: [
        Card(
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
              width: 260,
              child: Column(
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
                              top: spacingControl, bottom: 28)),
                ],
              ),
            ),
          ]).wrapPadding(
              padding: const EdgeInsets.only(
                  left: spacingControl, right: spacingControl)),
        ).wrapPadding(
            padding: const EdgeInsets.only(
                left: spacingStandard,
                right: spacingStandard,
                bottom: spacingContainer)),
        Positioned(
          bottom: 0,
          child: Card(
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
                      Image.asset('assets/medal.png', height: 25, width: 25),
                      Text('₹ 500', style: smallMediumTextStyle)
                          .addMarginLeft(spacingControl)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/award.png', height: 20, width: 20),
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
                      top: spacingControl))),
        )
      ]),
      onTap: () => Navigator.of(context)
          .push(SlideRightRoute(page: const ComingContestDetailsScreen())),
    );
  }
}
