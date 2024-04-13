/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/ui/team/preview_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:fantasy11_flutter/utils/extension_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/slide_route.dart';
import '../../values/values.dart';

class SelectCaptainScreen extends StatefulWidget {
  const SelectCaptainScreen({Key? key}) : super(key: key);

  @override
  State<SelectCaptainScreen> createState() => _SelectCaptainScreenState();
}

class _SelectCaptainScreenState extends State<SelectCaptainScreen> {
  Map<String, List<PlayerModel>> playerList = <String, List<PlayerModel>>{};
  bool isCaptainSelect = false, isViseCaptainSelect = false;

  @override
  void initState() {
    super.initState();
    playerList.putIfAbsent(
        'Wicket Keeper',
        () => [
              PlayerModel('IND', 'assets/man_profile.png', 'Vicky P', '90.80',
                  '120', '90', false, false, false),
              PlayerModel('IND', 'assets/man_profile.png', 'Ashu C', '70.00',
                  '80', '70', false, false, false),
              PlayerModel('IND', 'assets/man.png', 'Sagar P', '75.80', '60',
                  '60', false, false, false)
            ]);
    playerList.putIfAbsent(
        'Batsman',
        () => [
              PlayerModel('IND', 'assets/man_profile.png', 'Vicky P', '90.80',
                  '120', '90', false, false, false),
              PlayerModel('IND', 'assets/man_profile.png', 'Ashu C', '70.00',
                  '80', '70', false, false, false),
              PlayerModel('IND', 'assets/man.png', 'Sagar P', '75.80', '60',
                  '60', false, false, false)
            ]);
    playerList.putIfAbsent(
        'Bowler',
        () => [
              PlayerModel('IND', 'assets/man_profile.png', 'Vicky P', '90.80',
                  '120', '90', false, false, false),
              PlayerModel('IND', 'assets/man_profile.png', 'Ashu C', '70.00',
                  '80', '70', false, false, false)
            ]);
    playerList.putIfAbsent(
        'All Rounder',
        () => [
              PlayerModel('IND', 'assets/man_profile.png', 'Vicky P', '90.80',
                  '120', '90', false, false, false)
            ]);
  }

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
              title: Text('Choose Captain & Vice Captain', style: appBarStyle),
              leading: InkWell(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/arrow.png', height: 24, width: 24)
                    .wrapPaddingAll(spacingContainer),
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
                                    SizedBox(
                                      width: 120,
                                      child: Card(
                                          color: Colors.white,
                                          elevation: 8,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16))),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                        'assets/stopwatch.png',
                                                        height: 18,
                                                        width: 18)
                                                    .wrapPadding(
                                                        padding: const EdgeInsets
                                                                .only(
                                                            top:
                                                                spacingStandard,
                                                            bottom:
                                                                spacingStandard,
                                                            right:
                                                                spacingStandard)),
                                                Text("02:55:57",
                                                    style: smallBoldTextStyle)
                                              ])),
                                    ).addMarginTop(spacingStandard),
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
                            const SizedBox(height: spacingStandard),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: context.width,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.grey.shade300,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/select_captain.png',
                                            width: 25, height: 25),
                                        Text('Get 2x points',
                                                textAlign: TextAlign.center,
                                                style: normalTextStyle.copyWith(
                                                    color: primaryColor))
                                            .wrapPaddingAll(spacingStandard),
                                      ],
                                    ),
                                  ).addMarginLeft(spacingStandard),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Container(
                                    width: context.width,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.grey.shade300,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/select_vcaptain.png',
                                            width: 25,
                                            height: 25),
                                        Text('Get 1.5x points',
                                                textAlign: TextAlign.center,
                                                style: normalTextStyle.copyWith(
                                                    color:
                                                        Colors.green.shade700))
                                            .wrapPaddingAll(spacingStandard),
                                      ],
                                    ),
                                  ).addMarginRight(spacingStandard),
                                )
                              ],
                            ).wrapPaddingAll(spacingStandard),
                          ]).addMarginBottom(spacingStandard),
                        ).wrapPadding(
                            padding: const EdgeInsets.only(
                                top: spacingStandard,
                                left: spacingStandard,
                                right: spacingStandard)),
                      ],
                    ),
                    const SizedBox(height: spacingContainer),
                    Container(
                      color: Colors.grey.shade300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Text(
                              'Players',
                              style: mediumTextStyle,
                            ),
                          ),
                          SizedBox(width: context.width / 10),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              'Points',
                              textAlign: TextAlign.start,
                              style: mediumTextStyle,
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              'C',
                              textAlign: TextAlign.end,
                              style: mediumTextStyle,
                            ),
                          ),
                          SizedBox(width: context.width / 12),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              'VC',
                              textAlign: TextAlign.end,
                              style: mediumTextStyle,
                            ),
                          ),
                          SizedBox(width: context.width / 25),
                        ],
                      ).wrapPadding(
                          padding: const EdgeInsets.only(
                              left: spacingLarge + 24,
                              right: spacingContainer,
                              top: spacingStandard,
                              bottom: spacingStandard)),
                    ),
                    const SizedBox(height: spacingStandard),
                    Expanded(
                      child: ListView(
                          physics: const ClampingScrollPhysics(),
                          children: <Widget>[
                            ...generateList(),
                          ]),
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
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green.shade800,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Text('Team Preview',
                              textAlign: TextAlign.center,
                              style:
                                  boldTextStyle.copyWith(color: Colors.white))
                          .wrapPaddingAll(spacingStandard),
                    ),
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
                          color: (isCaptainSelect && isViseCaptainSelect)
                              ? primaryColor
                              : Colors.black54,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text('Save Team',
                                textAlign: TextAlign.center,
                                style:
                                    boldTextStyle.copyWith(color: Colors.white))
                            .wrapPaddingAll(spacingStandard),
                      ),
                      onTap: () {
                        (isCaptainSelect && isViseCaptainSelect)
                            ? Navigator.of(context).push(
                                SlideRightRoute(page: const PreviewScreen()))
                            : null;
                      },
                    ),
                  )
                ],
              ).wrapPadding(
                  padding: const EdgeInsets.only(
                      left: spacingContainer,
                      right: spacingContainer,
                      bottom: spacingContainer,
                      top: spacingStandard))
            ],
          )),
    );
  }

  List<Widget> generateList() {
    List<Widget>? listWidget = [];
    playerList.forEach((key, value) {
      listWidget.add(Column(
        children: [
          Container(
            width: context.width,
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text(key, style: boldTextStyle, textAlign: TextAlign.start)
                .wrapPadding(
                    padding: const EdgeInsets.only(
                        left: spacingContainer, right: spacingContainer)),
          ),
          ListView.separated(
            itemCount: value.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Image.asset(value[index].previewImg!,
                                      height: 50, width: 50)
                                  .wrapPaddingAll(spacingStandard),
                              Positioned(
                                top: 6,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: primaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  child: Text(
                                    value[index].team!,
                                    style: smallBoldTextStyle.copyWith(
                                        fontSize: 8, color: Colors.white),
                                  ).wrapPadding(
                                      padding: const EdgeInsets.only(
                                          left: spacingControl,
                                          right: spacingControl,
                                          top: spacingControlHalf,
                                          bottom: spacingControlHalf)),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value[index].name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: smallMediumTextStyle,
                                ),
                                Text(
                                  'sell by ${value[index].sellRatio!}%',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: smallNormalTextStyle.copyWith(
                                      fontSize: textSizeSmall,
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                              ],
                            ).addMarginLeft(spacingControl),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        value[index].point!,
                        textAlign: TextAlign.center,
                        style: mediumTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          InkWell(
                            child: Container(
                              child: value[index].isCaptain
                                  ? Image.asset('assets/select_captain.png',
                                      height: 25, width: 25)
                                  : Image.asset('assets/captain_symbol.png',
                                      height: 25, width: 25),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: value[index].isCaptain
                                          ? Colors.transparent
                                          : Colors.grey,
                                      width: 1)),
                            ),
                            onTap: () {
                              setState(() {
                                deselectCaptain();
                                value[index].isCaptain = true;
                                checkCaptainSelect();
                              });
                            },
                          ),
                          const SizedBox(height: spacingControl),
                          Text(
                            '1.2',
                            textAlign: TextAlign.center,
                            style: smallMediumTextStyle.copyWith(
                                fontSize: textSizeSmall),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          InkWell(
                            child: Container(
                              child: value[index].isViseCaptain
                                  ? Image.asset('assets/select_vcaptain.png',
                                      height: 25, width: 25)
                                  : Image.asset('assets/vcaptain_symbol.png',
                                      height: 25, width: 25),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: value[index].isViseCaptain
                                          ? Colors.transparent
                                          : Colors.grey,
                                      width: 1)),
                            ),
                            onTap: () {
                              setState(() {
                                deselectViseCaptain();
                                value[index].isViseCaptain = true;
                                checkViseCaptainSelect();
                              });
                            },
                          ),
                          const SizedBox(height: spacingControl),
                          Text(
                            '2.1',
                            textAlign: TextAlign.center,
                            style: smallMediumTextStyle.copyWith(
                                fontSize: textSizeSmall),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).wrapPadding(
                    padding: const EdgeInsets.only(left: spacingContainer)),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: spacingStandard);
            },
          )
        ],
      ));
    });
    return listWidget;
  }

  checkCaptainSelect() {
    playerList.forEach((key, value) {
      var contain = value.where((element) => element.isCaptain == true);
      if (contain.isEmpty) {
        isCaptainSelect = true;
      } else {
        isCaptainSelect = false;
      }
    });
    setState(() {});
  }

  checkViseCaptainSelect() {
    playerList.forEach((key, value) {
      var contain = value.where((element) => element.isViseCaptain == true);
      if (contain.isEmpty) {
        isViseCaptainSelect = true;
      } else {
        isViseCaptainSelect = false;
      }
    });
    setState(() {});
  }

  deselectCaptain() {
    playerList.forEach((key, value) {
      for (var element in value) {
        element.isCaptain = false;
      }
    });
    setState(() {});
  }

  deselectViseCaptain() {
    playerList.forEach((key, value) {
      for (var element in value) {
        element.isViseCaptain = false;
      }
    });
    setState(() {});
  }
}

class PlayerModel {
  String? team, previewImg, name, sellRatio, point, credit;
  bool isStatus = false, isCaptain = false, isViseCaptain = false;

  PlayerModel(this.team, this.previewImg, this.name, this.sellRatio, this.point,
      this.credit, this.isStatus, this.isCaptain, this.isViseCaptain);
}
