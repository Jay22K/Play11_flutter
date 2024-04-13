/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/ui/team/select_captain_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:fantasy11_flutter/utils/extension_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils/slide_route.dart';
import '../../values/values.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({Key? key}) : super(key: key);

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  bool isEnable = false;
  int selectPlayType = 0;
  List<PlayerModel> playerList = [
    PlayerModel(
        'IND', 'assets/man_profile.png', 'Vicky P', '90.80', '90', '9', false),
    PlayerModel(
        'IND', 'assets/man_profile.png', 'Ashu C', '70.00', '80', '7', false),
    PlayerModel('IND', 'assets/man.png', 'Sagar P', '75.80', '60', '6', false),
    PlayerModel(
        'PAK', 'assets/winner_a.png', 'Mohmad R', '86.40', '80', '8', false),
    PlayerModel(
        'IND', 'assets/winner_b.png', 'Bhavin K', '80.80', '77', '6.5', false),
    PlayerModel(
        'PAK', 'assets/winner_c.png', 'Rehman M', '60.65', '60', '5.6', false)
  ];

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
              title: Text('Create Team', style: appBarStyle),
              actions: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/stopwatch.png',
                          height: 20, width: 20, color: Colors.white)
                      .addMarginRight(spacingStandard),
                  Text("02:55:57",
                          style: boldTextStyle.copyWith(color: Colors.white))
                      .addMarginRight(spacingContainer)
                ])
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
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Card(
                          elevation: 2,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          color: Colors.white,
                          child: Column(children: [
                            Text('India Vs Pakistan',
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
                                Stack(
                                  children: [
                                    Positioned(
                                      top: 16,
                                      child: Image.asset(
                                        'assets/india_flag.png',
                                        height: 60,
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/play_a.png',
                                      height: 100,
                                      width: 100,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(children: [
                                      Column(
                                        children: [
                                          Text('IND', style: mediumTextStyle),
                                          Image.asset('assets/india_ball.png',
                                              width: 30, height: 30),
                                          Text('(2)',
                                                  style: smallNormalTextStyle)
                                              .addMarginTop(spacingControl),
                                        ],
                                      ),
                                      Text('VS', style: smallMediumTextStyle)
                                          .wrapPaddingAll(spacingContainer),
                                      Column(
                                        children: [
                                          Text('PAK', style: mediumTextStyle),
                                          Image.asset(
                                              'assets/pakistan_ball.png',
                                              width: 30,
                                              height: 30),
                                          Text('(0)',
                                                  style: smallNormalTextStyle)
                                              .addMarginTop(spacingControl),
                                        ],
                                      )
                                    ]),
                                    Text(
                                      'Credit left: 9',
                                      style: smallMediumTextStyle,
                                    ).addMarginTop(spacingContainer),
                                  ],
                                ).addMarginTop(spacingStandard),
                                Stack(
                                  children: [
                                    Positioned(
                                      top: 16,
                                      child: Image.asset(
                                        'assets/pakistan_flag.png',
                                        height: 60,
                                        fit: BoxFit.fill,
                                        width: 100,
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/play_b.png',
                                      height: 100,
                                      width: 100,
                                    )
                                  ],
                                )
                              ],
                            ),
                            RatingBar(
                              initialRating: 2,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemSize: 20,
                              ignoreGestures: true,
                              itemCount: 11,
                              ratingWidget: RatingWidget(
                                full: _image('assets/favourite.png'),
                                empty: _image('assets/unfavourite.png'),
                                half: _image('assets/unfavourite.png'),
                              ),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {},
                            ).addMarginTop(spacingStandard)
                          ]).addMarginBottom(56),
                        ).wrapPadding(
                            padding: const EdgeInsets.only(
                                left: spacingStandard,
                                right: spacingStandard,
                                bottom: 64)),
                        Positioned(
                          bottom: 36,
                          child: SizedBox(
                            width: context.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 50,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: backGroundColor),
                                ),
                                Container(
                                  width: 50,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: backGroundColor),
                                ),
                                Container(
                                  width: 50,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: backGroundColor),
                                ),
                                Container(
                                  width: 50,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: backGroundColor),
                                )
                              ],
                            ).wrapPadding(
                                padding: const EdgeInsets.only(
                              left: spacingStandard,
                              right: spacingStandard,
                            )),
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          child: SizedBox(
                            width: context.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/wicket.png',
                                          color: selectPlayType == 0
                                              ? primaryColor
                                              : Colors.black54,
                                          height: 35,
                                          width: 35),
                                      Text('WK',
                                              style:
                                                  smallBoldTextStyle.copyWith(
                                                      fontSize: textSizeSmall,
                                                      color: selectPlayType == 0
                                                          ? primaryColor
                                                          : Colors.black54))
                                          .addMarginTop(spacingControl),
                                      Container(
                                        width: 20,
                                        height: 18,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: selectPlayType == 0
                                                ? primaryColor
                                                : Colors.black54),
                                        child: Text('0',
                                            textAlign: TextAlign.center,
                                            style: smallNormalTextStyle
                                                .copyWith(color: Colors.white, fontSize: textSizeSmall)),
                                      ).addMarginTop(spacingControl),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectPlayType = 0;
                                    });
                                  },
                                ),
                                InkWell(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/batting.png',
                                          height: 30,
                                          width: 30,
                                          color: selectPlayType == 1
                                              ? primaryColor
                                              : Colors.black54),
                                      Text('BT',
                                              style:
                                                  smallBoldTextStyle.copyWith(
                                                      fontSize: textSizeSmall,
                                                      color: selectPlayType == 1
                                                          ? primaryColor
                                                          : Colors.black54))
                                          .addMarginTop(spacingControl),
                                      Container(
                                        width: 20,
                                        height: 18,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: selectPlayType == 1
                                                ? primaryColor
                                                : Colors.black54),
                                        child: Text('2',
                                            textAlign: TextAlign.center,
                                            style: smallNormalTextStyle
                                                .copyWith(color: Colors.white, fontSize: textSizeSmall)),
                                      ).addMarginTop(spacingControl),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectPlayType = 1;
                                    });
                                  },
                                ),
                                InkWell(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/bowling.png',
                                          height: 30,
                                          width: 30,
                                          color: selectPlayType == 2
                                              ? primaryColor
                                              : Colors.black54),
                                      Text('BW',
                                              style:
                                                  smallBoldTextStyle.copyWith(
                                                      fontSize: textSizeSmall,
                                                      color: selectPlayType == 2
                                                          ? primaryColor
                                                          : Colors.black54))
                                          .addMarginTop(spacingControl),
                                      Container(
                                        width: 20,
                                        height: 18,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: selectPlayType == 2
                                                ? primaryColor
                                                : Colors.black54),
                                        child: Text('0',
                                            textAlign: TextAlign.center,
                                            style: smallNormalTextStyle
                                                .copyWith(color: Colors.white, fontSize: textSizeSmall)),
                                      ).addMarginTop(spacingControl),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectPlayType = 2;
                                    });
                                  },
                                ),
                                InkWell(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/allrounder.png',
                                          height: 35,
                                          width: 35,
                                          color: selectPlayType == 3
                                              ? primaryColor
                                              : Colors.black54),
                                      Text('AR',
                                              style:
                                                  smallBoldTextStyle.copyWith(
                                                      fontSize: textSizeSmall,
                                                      color: selectPlayType == 3
                                                          ? primaryColor
                                                          : Colors.black54))
                                          .addMarginTop(spacingControl),
                                      Container(
                                        width: 20,
                                        height: 18,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: selectPlayType == 3
                                                ? primaryColor
                                                : Colors.black54),
                                        child: Text('0',
                                            textAlign: TextAlign.center,
                                            style: smallNormalTextStyle
                                                .copyWith(color: Colors.white, fontSize: textSizeSmall)),
                                      ).addMarginTop(spacingControl),
                                    ],
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectPlayType = 3;
                                    });
                                  },
                                )
                              ],
                            ).wrapPadding(
                                padding: const EdgeInsets.only(
                              left: spacingStandard,
                              right: spacingStandard,
                            )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: spacingContainer),
                    Container(
                      color: Colors.grey.shade300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Players',
                            style: mediumTextStyle,
                          ),
                          Text(
                            'Points',
                            style: mediumTextStyle,
                          ).addMarginLeft(spacingContainer),
                          Text(
                            'Credits',
                            style: mediumTextStyle,
                          ),
                        ],
                      ).wrapPaddingAll(spacingStandard),
                    ),
                    const SizedBox(height: spacingStandard),
                    Expanded(
                      child: ListView.separated(
                        itemCount: playerList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: playerList[index].isStatus ? const Color(0xFFfceae8) : Colors.grey.shade300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.asset(
                                                  playerList[index].previewImg!,
                                                  height: 50,
                                                  width: 50)
                                              .wrapPaddingAll(spacingStandard),
                                          Positioned(
                                            top: 6,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: primaryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4))),
                                              child: Text(
                                                playerList[index].team!,
                                                style:
                                                    smallBoldTextStyle.copyWith(
                                                        fontSize: 8,
                                                        color: Colors.white),
                                              ).wrapPadding(
                                                  padding: const EdgeInsets
                                                          .only(
                                                      left: spacingControl,
                                                      right: spacingControl,
                                                      top: spacingControlHalf,
                                                      bottom:
                                                          spacingControlHalf)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            playerList[index].name!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: smallMediumTextStyle,
                                          ),
                                          Text(
                                            'sell by ${playerList[index].sellRatio}%',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                smallNormalTextStyle.copyWith(
                                                    fontSize: textSizeSmall,
                                                    color: Colors.black
                                                        .withOpacity(0.7)),
                                          ),
                                        ],
                                      ).addMarginLeft(spacingControl),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    playerList[index].point!,
                                    style: mediumTextStyle,
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          playerList[index].credit!,
                                          textAlign: TextAlign.end,
                                          style: mediumTextStyle,
                                        ),
                                        playerList[index].isStatus
                                            ? InkWell(
                                                child: Icon(
                                                  Icons
                                                      .remove_circle_outline_rounded,
                                                  color: Colors.red.shade800,
                                                  size: 28,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    playerList[index].isStatus =
                                                        false;
                                                    enableContinue();
                                                  });
                                                },
                                              )
                                            : InkWell(
                                                child: Icon(
                                                  Icons
                                                      .add_circle_outline_rounded,
                                                  color: Colors.green.shade800,
                                                  size: 28,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    playerList[index].isStatus =
                                                        true;
                                                    enableContinue();
                                                  });
                                                },
                                              )
                                      ],
                                    )),
                              ],
                            ).wrapPadding(
                                padding: const EdgeInsets.only(
                                    left: spacingContainer)),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: spacingStandard);
                        },
                      ),
                    ),
                    const SizedBox(height: spacingControl),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: context.width,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Text('Team Preview',
                              textAlign: TextAlign.center,
                              style:
                                  boldTextStyle.copyWith(color: Colors.white))
                          .wrapPaddingAll(spacingStandard),
                    ).addMarginLeft(spacingStandard),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        width: context.width,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color:
                              isEnable ? Colors.green.shade800 : Colors.black54,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text('Continue',
                                textAlign: TextAlign.center,
                                style:
                                    boldTextStyle.copyWith(color: Colors.white))
                            .wrapPaddingAll(spacingStandard),
                      ).addMarginRight(spacingStandard),
                      onTap: () {
                        Navigator.of(context).push(
                            SlideRightRoute(page: const SelectCaptainScreen()));
                      },
                    ),
                  )
                ],
              ).wrapPaddingAll(spacingStandard)
            ],
          )),
    );
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 20.0,
      width: 20.0,
    );
  }

  enableContinue() {
    var contain = playerList.where((element) => element.isStatus == true);
    if (contain.isEmpty) {
      isEnable = false;
    } else {
      isEnable = true;
    }
    setState(() {});
  }
}

class PlayerModel {
  String? team, previewImg, name, sellRatio, point, credit;
  bool isStatus = false;

  PlayerModel(this.team, this.previewImg, this.name, this.sellRatio, this.point,
      this.credit, this.isStatus);
}
