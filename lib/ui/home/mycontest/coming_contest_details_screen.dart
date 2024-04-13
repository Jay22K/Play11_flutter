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

import '../../../values/values.dart';

class ComingContestDetailsScreen extends StatefulWidget {
  const ComingContestDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ComingContestDetailsScreen> createState() =>
      _ComingContestDetailsScreenState();
}

class _ComingContestDetailsScreenState extends State<ComingContestDetailsScreen>
    with SingleTickerProviderStateMixin {
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            titleSpacing: 5,
            elevation: 0.0,
            backgroundColor: primaryColor,
            title: RichText(
              text: TextSpan(
                text: 'Ind vs Pak\n',
                style: appBarStyle,
                children: <TextSpan>[
                  TextSpan(
                      text: '1h 40m left',
                      style:
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
                color: Colors.white,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price Pool',
                          style: smallMediumTextStyle.copyWith(
                              color: secondaryTextColor,
                              fontSize: textSizeSmall)),
                      Text('Entry',
                          style: smallMediumTextStyle.copyWith(
                              color: secondaryTextColor,
                              fontSize: textSizeSmall))
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
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
                                    color: primaryColor,
                                    fontSize: textSizeSmall)),
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
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
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
                child: SizedBox(
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
                              top: spacingControl))),
                ),
              )
            ]),
            const SizedBox(height: spacingControl),
            ElevatedButton(
              child: Text('Join Contest Now',
                  style: mediumTextStyle.copyWith(color: Colors.white)),
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade800)),
            ),
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
                            tabs: [
                              Tab(
                                  icon: Image.asset('assets/award_strip.png',
                                      color: selectTab == 0
                                          ? primaryColor
                                          : Colors.black87,
                                      width: 30,
                                      height: 30),
                                  text: 'Details'),
                              Tab(
                                  icon: Image.asset('assets/podium.png',
                                      width: 30,
                                      height: 30,
                                      color: selectTab == 1
                                          ? primaryColor
                                          : Colors.black87),
                                  text: 'Leaderboard')
                            ]),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Rank', style: mediumTextStyle),
                                      Text('Prize', style: mediumTextStyle)
                                    ]).wrapPaddingAll(spacingContainer),
                                Expanded(
                                  child: ListView.separated(
                                    itemCount: 15,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return rankView();
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                          height: spacingStandard);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Teams', style: mediumTextStyle),
                                      Text('Rank', style: mediumTextStyle)
                                    ]).wrapPaddingAll(spacingContainer),
                                Expanded(
                                  child: ListView.separated(
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return leaderView();
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                          height: spacingStandard);
                                    },
                                  ),
                                ),
                              ],
                            )
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

  rankView() {
    return Container(
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('1', style: mediumTextStyle),
        Text('₹ 10000', style: mediumTextStyle)
      ]).wrapPaddingAll(spacingContainer),
    );
  }

  leaderView() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/man_profile.png', width: 40, height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jason Roy',
                      style: smallNormalTextStyle.copyWith(
                          color: Colors.black54, fontSize: textSizeSmall)),
                  Text('Point - 0',
                      textAlign: TextAlign.start,
                      style: smallNormalTextStyle.copyWith(
                          color: Colors.black54, fontSize: textSizeSmall))
                ],
              ).addMarginLeft(spacingControl),
            ],
          ),
          Text('1', style: mediumTextStyle),
        ],
      ).wrapPaddingAll(spacingContainer),
    );
  }
}
