import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../utils/slide_route.dart';
import '../../values/values.dart';
import 'mycontest/contest_menu_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
          backgroundColor: backGroundColor,
          body: ListView.separated(
            itemCount: 5,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return matchCard();
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: spacingStandard);
            },
          ).wrapPaddingAll(spacingStandard)),
    );
  }

  matchCard() {
    return InkWell(
      child: Stack(
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('India Vs Pakistan',
                          style: smallMediumTextStyle.copyWith(
                              color: Colors.black54))
                      .wrapPadding(
                          padding: const EdgeInsets.only(
                              left: 12,
                              right: spacingStandard,
                              top: spacingStandard,
                              bottom: spacingStandard)),
                  Container(
                    height: 1,
                    width: context.width / 2,
                    color: Colors.black26,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        color: Colors.black12,
                        height: 16,
                      ),
                      Image.asset('assets/india_ball.png',
                          height: 40, width: 40),
                      const SizedBox(width: spacingStandard),
                      Text('IND', style: boldLargeTextStyle)
                    ],
                  ).addMarginTop(24),
                  const SizedBox(height: spacingStandard),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        color: Colors.black12,
                        height: 16,
                      ),
                      Image.asset('assets/pakistan_ball.png',
                          height: 40, width: 40),
                      const SizedBox(width: spacingStandard),
                      Text('PAK', style: boldLargeTextStyle)
                    ],
                  )
                ]),
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: Image.asset(
                            'assets/india_pak.png',
                            fit: BoxFit.cover,
                            height: 180,
                            width: context.width / 2,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 140,
            child: Card(
                color: Colors.white,
                elevation: 8,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('assets/stopwatch.png', height: 20, width: 20)
                      .wrapPadding(
                          padding: const EdgeInsets.only(
                              top: spacingStandard,
                              bottom: spacingStandard,
                              right: spacingStandard)),
                  Text("02:55:57", style: boldTextStyle)
                ])),
          )
        ],
      ),
      onTap: () => Navigator.of(context)
          .push(SlideRightRoute(page: const ContestMenuScreen())),
    );
  }
}
