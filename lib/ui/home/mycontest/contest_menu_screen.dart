/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/ui/home/mycontest/coming_contest_screen.dart';
import 'package:fantasy11_flutter/ui/home/mycontest/my_contest_screen.dart';
import 'package:fantasy11_flutter/ui/home/mycontest/my_team_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:fantasy11_flutter/utils/extension_widget.dart';
import 'package:flutter/material.dart';

import '../../../values/values.dart';

class ContestMenuScreen extends StatefulWidget {
  const ContestMenuScreen({Key? key}) : super(key: key);

  @override
  State<ContestMenuScreen> createState() => _ContestMenuScreenState();
}

class _ContestMenuScreenState extends State<ContestMenuScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
          appBar: AppBar(
              titleSpacing: 5,
              elevation: 0.0,
              backgroundColor: primaryColor,
              title:
              RichText(
                text: TextSpan(text: 'Ind vs Pak\n', style: appBarStyle,
                  children: <TextSpan>[
                    TextSpan(text: '1h 40m left', style:
                    smallNormalTextStyle.copyWith(color: Colors.white)),
                  ],
                ),
              ),
              actions: [
                Image.asset('assets/notification.png', color: Colors.white)
                    .wrapPadding(
                        padding: const EdgeInsets.only(
                            left: spacingContainer,
                            bottom: spacingContainer,
                            top: spacingContainer,
                            right: spacingStandard)),
                Image.asset('assets/wallet_fill.png', color: Colors.white)
                    .wrapPaddingAll(18),
              ],
              leading: InkWell(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/arrow.png', height: 24, width: 24)
                    .wrapPaddingAll(16),
                onTap: () => moveToLast(context),
              )),
          backgroundColor: backGroundColor,
          bottomNavigationBar: SizedBox(
            height: 65,
            child: BottomAppBar(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  bottomBarWidget('Contest', 0),
                  bottomBarWidget('My Contest(0)', 1),
                  bottomBarWidget('My Teams(1)', 2),
                ],
              ),
            ),
          ),
          body: bottomMenuScreen()),
    );
  }

  bottomMenuScreen() {
    if (currentIndex == 1) {
      return const MyContestScreen();
    } else if (currentIndex == 2) {
      return const MyTeamScreen();
    } else {
      return const ComingContestScreen();
    }
  }

  bottomBarWidget(String menuTitle, int bottomPosition) {
    return Expanded(
      child: InkWell(
        child: Column(
          children: [
            currentIndex == bottomPosition
                ? Container(
                    height: 3,
                    color: primaryColor,
                  )
                : Container(),
            Image.asset('assets/bottom_trophy.png',
                    height: 25,
                    width: 25,
                    color: currentIndex == bottomPosition
                        ? primaryColor
                        : Colors.black)
                .addMarginTop(spacingStandard),
            const SizedBox(height: spacingControl),
            Text(menuTitle,
                style: smallMediumTextStyle.copyWith(
                    color: currentIndex == bottomPosition
                        ? primaryColor
                        : Colors.black))
          ],
        ),
        onTap: () {
          setState(() {
            currentIndex = bottomPosition;
          });
        },
      ),
    );
  }

  joinContestCard() {
    return Stack(alignment: Alignment.center, children: [
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
          Text('IND Vs PAK',
                  maxLines: 1,
                  style: smallBoldTextStyle.copyWith(color: Colors.black54))
              .wrapPadding(
                  padding: const EdgeInsets.only(
                      left: spacingStandard,
                      top: spacingStandard,
                      bottom: spacingStandard)),
          Container(
            height: 1,
            color: Colors.black26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Image.asset('assets/ind_shield.png', height: 70, width: 70),
                    Column(
                      children: [
                        Text('IND', style: smallNormalTextStyle),
                        Text('205/5',
                                style: smallNormalTextStyle.copyWith(
                                    fontSize: textSizeSmall))
                            .addMarginTop(spacingControl),
                        Text('(20)',
                            style: smallNormalTextStyle.copyWith(
                                fontSize: textSizeSmall)),
                      ],
                    ).addMarginRight(spacingStandard)
                  ],
                ).wrapPadding(
                    padding: const EdgeInsets.only(
                        top: spacingStandard,
                        left: spacingStandard,
                        right: spacingStandard,
                        bottom: spacingLarge)),
              ),
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(width: 100, height: 1, color: primaryColor),
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: primaryColor),
                          width: 25,
                          height: 25,
                          child: Center(
                            child: Text('VS',
                                style: smallBoldTextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: textSizeSmall)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: spacingContainer),
                    Text('1 Contest Joined',
                        style: smallNormalTextStyle.copyWith(
                            fontSize: textSizeSmall))
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/pak_shield.png',
                            height: 70, width: 70),
                        Column(
                          children: [
                            Text('PAK', style: smallNormalTextStyle),
                            Text('105/10',
                                    style: smallNormalTextStyle.copyWith(
                                        fontSize: textSizeSmall))
                                .addMarginTop(spacingControl),
                            Text('(20)',
                                style: smallNormalTextStyle.copyWith(
                                    fontSize: textSizeSmall)),
                          ],
                        ).addMarginRight(spacingStandard)
                      ],
                    ),
                  ],
                ).wrapPadding(
                    padding: const EdgeInsets.only(
                        top: spacingStandard,
                        left: spacingStandard,
                        right: spacingStandard,
                        bottom: spacingLarge)),
              )
            ],
          ),
        ]),
      ).wrapPadding(
          padding: const EdgeInsets.only(
              left: spacingStandard,
              right: spacingStandard,
              bottom: spacingContainer)),
      Positioned(
        bottom: 0,
        child: SizedBox(
          child: Card(
              color: Colors.green.shade900,
              elevation: 8,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  Text("Completed",
                          textAlign: TextAlign.center,
                          style: smallMediumTextStyle.copyWith(
                              color: Colors.white))
                      .wrapPadding(
                          padding: const EdgeInsets.only(
                              left: spacingContainer,
                              right: spacingContainer,
                              top: spacingStandard,
                              bottom: spacingStandard)),
                ],
              )),
        ),
      )
    ]);
  }
}
