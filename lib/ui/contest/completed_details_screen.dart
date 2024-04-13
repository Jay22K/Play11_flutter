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

import '../../utils/slide_route.dart';
import '../../values/values.dart';
import '../team/preview_screen.dart';

class CompletedDetailsScreen extends StatefulWidget {
  const CompletedDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CompletedDetailsScreenState();
}

class CompletedDetailsScreenState extends State<CompletedDetailsScreen>
    with SingleTickerProviderStateMixin {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
            titleSpacing: 5,
            elevation: 0.0,
            backgroundColor: primaryColor,
            title: Text('Ind vs Pak', style: appBarStyle),
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
        body: Column(
          children: [
            const SizedBox(height: spacingStandard),
            Stack(alignment: Alignment.center, children: [
              Card(
                elevation: 4,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                color: const Color(0xFFfceae8),
                child: Column(children: [
                  Text('IND Vs PAK',
                          maxLines: 1,
                          style: smallBoldTextStyle.copyWith(
                              color: Colors.black54))
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
                            Image.asset('assets/ind_shield.png',
                                height: 70, width: 70),
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
                                Container(
                                    width: 100, height: 1, color: primaryColor),
                                Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor),
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
                                            style:
                                                smallNormalTextStyle.copyWith(
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
                  width: context.width / 3,
                  child: Card(
                      color: Colors.green.shade900,
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text("Completed",
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: smallMediumTextStyle.copyWith(
                                  color: Colors.white))
                          .wrapPadding(
                              padding: const EdgeInsets.only(
                                  left: spacingContainer,
                                  right: spacingContainer,
                                  top: spacingStandard,
                                  bottom: spacingStandard))),
                ),
              )
            ]),
            const SizedBox(height: spacingStandard),
            Expanded(
              child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Container(
                        width: context.width,
                        color: Colors.white,
                        child: TabBar(
                            isScrollable: false,
                            indicatorColor: primaryColor,
                            unselectedLabelColor: Colors.black54,
                            labelColor: primaryColor,
                            labelPadding: EdgeInsets.zero,
                            indicatorPadding: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            onTap: (index) {
                              setState(() {
                                selectTab = index;
                              });
                            },
                            labelStyle:
                                boldTextStyle.copyWith(color: Colors.black87),
                            tabs: const [
                              Tab(icon: null, text: 'My Contests(5)'),
                              Tab(icon: null, text: 'My Teams(2)')
                            ]),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListView.separated(
                              itemCount: 5,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return myContestsView();
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(height: spacingStandard);
                              },
                            ).wrapPadding(
                                padding: const EdgeInsets.only(
                                    top: spacingStandard,
                                    bottom: spacingStandard)),
                            ListView.separated(
                              itemCount: 5,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return myTeamView();
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(height: spacingStandard);
                              },
                            ).wrapPadding(
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: spacingControl))
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  myContestsView() {
    return Stack(
      alignment: Alignment.center,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Gujarat Titan',
                    style: semiSubTitleTextStyle, textAlign: TextAlign.center),
                Text('500 pts',
                    style: semiSubTitleTextStyle, textAlign: TextAlign.center),
                Text('19,000 spots',
                    style: semiSubTitleTextStyle, textAlign: TextAlign.center),
              ],
            ).wrapPadding(
                padding: const EdgeInsets.only(
                    left: spacingStandard, right: spacingStandard, bottom: 28)),
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
              color: Colors.green.shade900,
              elevation: 8,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rank: 2nd',
                          style: smallMediumTextStyle.copyWith(
                              color: Colors.white))
                      .addMarginLeft(spacingControl),
                  const SizedBox(width: 16),
                  Text('Won: ₹ 500',
                          style: smallMediumTextStyle.copyWith(
                              color: Colors.white))
                      .addMarginLeft(spacingControl)
                ],
              ).wrapPaddingAll(spacingStandard)),
        )
      ],
    );
  }

  myTeamView() {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10))),
      child: InkWell(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/team_bg.png',
                    width: context.width,
                    fit: BoxFit.fill,
                    height: 160,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.green.shade900.withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text('Gujarat Titan(T1)',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: mediumTextStyle.copyWith(
                                      color: Colors.white))
                              .wrapPadding(
                                  padding: const EdgeInsets.only(
                                      left: 12,
                                      top: spacingStandard,
                                      bottom: spacingStandard)),
                        ),
                        Text('326.5 Points',
                                style: mediumTextStyle.copyWith(
                                    color: Colors.white))
                            .wrapPadding(
                                padding: const EdgeInsets.only(right: 12))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text('INR',
                                    style: boldTextStyle.copyWith(
                                        color: Colors.white)),
                                const SizedBox(height: spacingControl),
                                Image.asset(
                                  'assets/india_ball.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(height: spacingControl),
                                Text('6',
                                    style: boldTextStyle.copyWith(
                                        color: Colors.white)),
                              ],
                            ),
                            Column(
                              children: [
                                Text('PAK',
                                    style: boldTextStyle.copyWith(
                                        color: Colors.white)),
                                const SizedBox(height: spacingControl),
                                Image.asset(
                                  'assets/pakistan_ball.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(height: spacingControl),
                                Text('5',
                                    style: boldTextStyle.copyWith(
                                        color: Colors.white)),
                              ],
                            ).addMarginLeft(spacingContainer)
                          ],
                        ).wrapPaddingAll(spacingContainer),
                        Row(
                          children: [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    Image.asset('assets/captain_logo.png',
                                        height: 50, width: 50),
                                    Container(
                                      height: 18,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Text('Vicky',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style:
                                                  smallNormalTextStyle.copyWith(
                                                      color: Colors.white,
                                                      fontSize: textSizeSmall))
                                          .wrapPadding(
                                              padding: const EdgeInsets.only(
                                                  left: spacingControlHalf,
                                                  right: spacingControlHalf)),
                                    )
                                  ],
                                ).wrapPadding(
                                    padding: const EdgeInsets.only(top: 12)),
                                Positioned(
                                  top: 0,
                                  right: 12,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/captain_symbol.png',
                                          height: 25, width: 25),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    Image.asset('assets/vcaption_logo.png',
                                        height: 50, width: 50),
                                    Container(
                                      height: 18,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Text('Ashu',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style:
                                                  smallNormalTextStyle.copyWith(
                                                      color: Colors.white,
                                                      fontSize: textSizeSmall))
                                          .wrapPadding(
                                              padding: const EdgeInsets.only(
                                                  left: spacingControlHalf,
                                                  right: spacingControlHalf)),
                                    )
                                  ],
                                ).wrapPadding(
                                    padding: const EdgeInsets.only(top: 12)),
                                Positioned(
                                  top: 0,
                                  right: 12,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/vcaptain_symbol.png',
                                          height: 25, width: 25),
                                    ],
                                  ),
                                ),
                              ],
                            ).addMarginLeft(spacingContainer),
                          ],
                        ).wrapPaddingAll(spacingContainer)
                      ],
                    )
                  ],
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('WK(4)', style: smallMediumTextStyle),
                  Text('BAT(2)', style: smallMediumTextStyle),
                  Text('AR(2)', style: smallMediumTextStyle),
                  Text('BOWL(3)', style: smallMediumTextStyle)
                ],
              ).wrapPadding(
                  padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      top: spacingStandard,
                      bottom: spacingStandard))
            ],
          ),
        ),
        onTap: () => Navigator.of(context)
            .push(SlideRightRoute(page: const PreviewScreen())),
      ),
    ).wrapPadding(
        padding: const EdgeInsets.only(
            left: 12, right: 12, bottom: spacingStandard));
  }
}
