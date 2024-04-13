import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../values/values.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LeaderboardScreenState();
}

class LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
          backgroundColor: backGroundColor,
          body: Column(
            children: [
              Container(
                color: primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('2nd',
                            style: boldTextStyle.copyWith(color: Colors.white)),
                        const SizedBox(height: spacingControl),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/winner_b.png'),
                              backgroundColor: Colors.transparent,
                              radius: 40,
                            ).wrapPadding(
                                padding: const EdgeInsets.only(
                                    bottom: spacingLarge + 20,
                                    left: spacingContainer,
                                    right: spacingContainer)),
                            Positioned(
                              bottom: 0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Container(
                                        width: 80,
                                        decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Text(
                                          'India',
                                          style: smallBoldTextStyle.copyWith(
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ).wrapPadding(
                                            padding: const EdgeInsets.only(
                                                left: spacingStandard,
                                                right: spacingStandard,
                                                top: spacingControlHalf,
                                                bottom: spacingControlHalf))),
                                    const SizedBox(height: spacingControl),
                                    Container(
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Text(
                                          'Jason Roy',
                                          style: smallNormalTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.center,
                                        ).wrapPadding(
                                            padding: const EdgeInsets.only(
                                                left: spacingStandard,
                                                right: spacingStandard,
                                                top: spacingControlHalf,
                                                bottom: spacingControlHalf))),
                                    const SizedBox(height: spacingControl),
                                    Text('99 Points',
                                        style: smallMediumTextStyle.copyWith(
                                            color: Colors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ).addMarginTop(spacingLarge * 1.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('1st',
                            style: boldTextStyle.copyWith(color: Colors.white)),
                        const SizedBox(height: spacingControl),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/winner_a.png'),
                              backgroundColor: Colors.transparent,
                              radius: 40,
                            ).wrapPadding(
                                padding: const EdgeInsets.only(
                                    bottom: spacingLarge + 20,
                                    left: spacingContainer,
                                    right: spacingContainer)),
                            Positioned(
                              bottom: 0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Container(
                                        width: 80,
                                        decoration: const BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Text(
                                          'India',
                                          style: smallBoldTextStyle.copyWith(
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ).wrapPadding(
                                            padding: const EdgeInsets.only(
                                                left: spacingStandard,
                                                right: spacingStandard,
                                                top: spacingControlHalf,
                                                bottom: spacingControlHalf))),
                                    const SizedBox(height: spacingControl),
                                    Container(
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Text(
                                          'Jason Roy',
                                          style: smallNormalTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.center,
                                        ).wrapPadding(
                                            padding: const EdgeInsets.only(
                                                left: spacingStandard,
                                                right: spacingStandard,
                                                top: spacingControlHalf,
                                                bottom: spacingControlHalf))),
                                    const SizedBox(height: spacingControl),
                                    Text('99 Points',
                                        style: smallMediumTextStyle.copyWith(
                                            color: Colors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('3rd',
                            style: boldTextStyle.copyWith(color: Colors.white)),
                        const SizedBox(height: spacingControl),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/winner_c.png'),
                              backgroundColor: Colors.transparent,
                              radius: 40,
                            ).wrapPadding(
                                padding: const EdgeInsets.only(
                                    bottom: spacingLarge + 20,
                                    left: spacingContainer,
                                    right: spacingContainer)),
                            Positioned(
                              bottom: 0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Container(
                                        width: 80,
                                        decoration: const BoxDecoration(
                                            color: Colors.brown,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Text(
                                          'India',
                                          style: smallBoldTextStyle.copyWith(
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ).wrapPadding(
                                            padding: const EdgeInsets.only(
                                                left: spacingStandard,
                                                right: spacingStandard,
                                                top: spacingControlHalf,
                                                bottom: spacingControlHalf))),
                                    const SizedBox(height: spacingControl),
                                    Container(
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Text(
                                          'Jason Roy',
                                          style: smallNormalTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.center,
                                        ).wrapPadding(
                                            padding: const EdgeInsets.only(
                                                left: spacingStandard,
                                                right: spacingStandard,
                                                top: spacingControlHalf,
                                                bottom: spacingControlHalf))),
                                    const SizedBox(height: spacingControl),
                                    Text('99 Points',
                                        style: smallMediumTextStyle.copyWith(
                                            color: Colors.white),
                                        maxLines: 1,
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ).addMarginTop(spacingLarge * 1.5)
                  ],
                ).wrapPadding(padding: const EdgeInsets.only(left: spacingStandard, right: spacingStandard, top: spacingStandard, bottom: spacingContainer)),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return winningCard();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: spacingStandard);
                  },
                ).wrapPaddingAll(spacingStandard),
              ),
            ],
          )),
    );
  }

  winningCard() {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10))),
      child: Row(children: [
        Text('#4', style: normalTextStyle),
        const SizedBox(
          width: 16,
        ),
        Image.asset('assets/man.png', height: 50, width: 50),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: Text('Jason Roy',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: normalTextStyle)),
        Text('80 Points', style: normalTextStyle)
      ]).wrapPaddingAll(spacingContainer),
    );
  }
}
