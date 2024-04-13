/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/ui/team/create_team_screen.dart';
import 'package:fantasy11_flutter/ui/widgets/error_widget.dart' as error_view;
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/slide_route.dart';
import '../../../values/values.dart';
import '../../team/preview_screen.dart';

class MyTeamScreen extends StatefulWidget {
  const MyTeamScreen({Key? key}) : super(key: key);

  @override
  State<MyTeamScreen> createState() => _MyTeamScreenState();
}

class _MyTeamScreenState extends State<MyTeamScreen> {
  List<String> myContestList = ['A'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: myContestList.isNotEmpty
            ? ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return myTeamCard();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: spacingStandard);
                },
              ).wrapPadding(
                padding: const EdgeInsets.only(
                    top: spacingContainer, bottom: spacingStandard))
            : error_view.ErrorWidget(
                image: 'assets/error_cricket.png',
                title: 'You haven\'t created any team!',
                subTitle: 'The first step to winning starts here',
                isRetry: true,
                onPress: () {},
                retry: 'Create a Team'));
  }

  myTeamCard() {
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
                        Row(
                          children: [
                            InkWell(
                                child:
                                    const Icon(Icons.edit, color: Colors.white)
                                        .addMarginRight(spacingStandard),
                                onTap: () => Navigator.of(context).push(
                                    SlideRightRoute(
                                        page: const CreateTeamScreen()))),
                            const Icon(Icons.copy, color: Colors.white)
                                .addMarginRight(12)
                          ],
                        )
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
