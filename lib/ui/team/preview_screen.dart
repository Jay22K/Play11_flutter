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

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  List<Player> wicketPlayerList = [
    Player('Joson Roy', 'assets/man_profile.png', 'wicket', 'assets/wicket.png',
        '2.5', false, false),
    Player('Messy Andy', 'assets/winner_a.png', 'wicket', 'assets/wicket.png',
        '1.5', false, false),
    Player('Vicky', 'assets/winner_b.png', 'wicket', 'assets/wicket.png', '0.5',
        true, false),
    Player('Ashu Mote', 'assets/winner_c.png', 'wicket', 'assets/wicket.png',
        '4.5', false, false)
  ];

  List<Player> batsmanPlayerList = [
    Player('Joson Roy', 'assets/man_profile.png', 'batsman', 'assets/bat.png',
        '2.5', false, false),
    Player('Messy Andy', 'assets/winner_a.png', 'batsman', 'assets/bat.png',
        '1.5', false, false),
  ];

  List<Player> allRounderPlayerList = [
    Player('Joson Roy', 'assets/man_profile.png', 'allRounder',
        'assets/all_rounder.png', '2.5', false, false),
    Player('Messy Andy', 'assets/winner_a.png', 'allRounder',
        'assets/all_rounder.png', '1.5', false, false),
    Player('Vicky', 'assets/winner_b.png', 'allRounder',
        'assets/all_rounder.png', '0.5', false, true),
  ];

  List<Player> bowlerPlayerList = [
    Player('Joson Roy', 'assets/man_profile.png', 'bowler', 'assets/ball.png',
        '2.5', false, false),
    Player('Messy Andy', 'assets/winner_a.png', 'bowler', 'assets/ball.png',
        '1.5', false, false),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: toolbarBack('T1 Preview', context),
        backgroundColor: backGroundColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/ground_bg.png',
              width: context.width,
              height: context.height,
              fit: BoxFit.fill,
            ),
            Image.asset('assets/ground.png',
                width: context.width / 2.5, height: context.height / 2.5),
            Container(
              width: context.width,
              height: context.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(color: Colors.white, width: 0.8)),
            ).wrapPadding(
                padding: const EdgeInsets.only(
                    left: spacingLarge * 2.5,
                    right: spacingLarge * 2.5,
                    top: spacingLarge * 3,
                    bottom: spacingLarge * 3)),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Text("Wicket Keeper",
                      style: boldLargeTextStyle.copyWith(color: Colors.white)),
                  SizedBox(
                    height: context.height / 10,
                    child: ListView.separated(
                      itemCount: wicketPlayerList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return wicketKeeper(wicketPlayerList[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 22);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: spacingLarge * 1.2,
                  ),
                  Text("Batsman",
                      style: boldLargeTextStyle.copyWith(color: Colors.white)),
                  SizedBox(
                    height: context.height / 10,
                    child: ListView.separated(
                      itemCount: batsmanPlayerList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return batsman(batsmanPlayerList[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 22);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: spacingControl,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/header_icon.png',
                      width: 250,
                      height: 70,
                    ),
                  ),
                  const SizedBox(
                    height: spacingLarge,
                  ),
                  Text("All Rounder",
                      style: boldLargeTextStyle.copyWith(color: Colors.white)),
                  SizedBox(
                    height: context.height / 10,
                    child: ListView.separated(
                      itemCount: allRounderPlayerList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return allRounder(allRounderPlayerList[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 22);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: spacingLarge * 1.2,
                  ),
                  Text("Bowler",
                      style: boldLargeTextStyle.copyWith(color: Colors.white)),
                  SizedBox(
                    height: context.height / 10,
                    child: ListView.separated(
                      itemCount: bowlerPlayerList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return bowler(bowlerPlayerList[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 22);
                      },
                    ),
                  ),
                ],
              ).wrapPaddingAll(spacingContainer),
            )
          ],
        ),
      ),
    );
  }

  wicketKeeper(Player player) {
    return Stack(
        alignment: Alignment.topLeft ,children: [
      showProfilePic(player.icon!),
      Positioned(
        bottom: 0,
        child: Image.asset(
          player.typeIcon!,
          width: 30,
          height: 30,
        ).addMarginBottom(spacingLarge * 1.1),
      ),
      showCaptain(player.isCaptain),
      showViceCaptain(player.isViceCaptain),
      showNamePoint(player.name!, player.point!)
    ]);
  }

  batsman(Player player) {
    return Stack(
      children: [
        showProfilePic(player.icon!),
        Positioned(
          bottom: 4,
          left: -8,
          child: Image.asset(
            player.typeIcon!,
            width: 50,
            height: 50,
          ).addMarginBottom(spacingLarge * 1.1),
        ),
        showCaptain(player.isCaptain),
        showViceCaptain(player.isViceCaptain),
        showNamePoint(player.name!, player.point!)
      ],
    );
  }

  allRounder(Player player) {
    return Stack(
      children: [
        showProfilePic(player.icon!),
        Positioned(
          bottom: 10,
          left: -8,
          child: Image.asset(
            player.typeIcon!,
            width: 50,
            height: 50,
          ).addMarginBottom(spacingLarge * 1.1),
        ),
        showCaptain(player.isCaptain),
        showViceCaptain(player.isViceCaptain),
        showNamePoint(player.name!, player.point!)
      ],
    );
  }

  bowler(Player player) {
    return Stack(
      children: [
        showProfilePic(player.icon!),
        Positioned(
          top: 0,
          left: 12,
          child: Image.asset(
            player.typeIcon!,
            width: 15,
            height: 15,
          ).addMarginBottom(spacingLarge * 1.1),
        ),
        showCaptain(player.isCaptain),
        showViceCaptain(player.isViceCaptain),
        showNamePoint(player.name!, player.point!)
      ],
    );
  }

  showProfilePic(String profileImage) {
    return Image.asset(
      profileImage,
      width: context.width / 6,
      height: context.height / 15,
    );
  }

  showCaptain(bool isCaptain) {
    return isCaptain
        ? Positioned(
            top: 0,
            right: 4,
            child: Image.asset(
              'assets/select_captain.png',
              width: 25,
              height: 25,
            ))
        : Container();
  }

  showViceCaptain(bool isViceCaptain) {
    return isViceCaptain
        ? Positioned(
            top: 0,
            right: 4,
            child: Image.asset(
              'assets/select_vcaptain.png',
              width: 25,
              height: 25,
            ))
        : Container();
  }

  showNamePoint(String name, String point) {
    return Positioned(
      bottom: 0,
      child: Column(
        children: [
          Container(
              width: context.width / 6,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Text(
                name,
                style: smallNormalTextStyle.copyWith(fontSize: textSizeSmall),
                maxLines: 1,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ).wrapPadding(
                  padding: const EdgeInsets.only(
                      left: spacingControl,
                      right: spacingControl,
                      top: spacingControlHalf,
                      bottom: spacingControlHalf))),
          const SizedBox(height: spacingControlHalf),
          Text('$point pts',
              style: smallBoldTextStyle.copyWith(color: Colors.white))
        ],
      ),
    );
  }
}

class Player {
  String? name, icon, type, typeIcon, point;
  bool isCaptain = false, isViceCaptain = false;

  Player(this.name, this.icon, this.type, this.typeIcon, this.point,
      this.isCaptain, this.isViceCaptain);
}
