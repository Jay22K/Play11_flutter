import 'package:fantasy11_flutter/ui/widgets/error_widget.dart' as error_view;
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../values/values.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UpcomingScreenState();
}

class UpcomingScreenState extends State<UpcomingScreen> {
  List<UpComing> upcomingMatchList = [
    UpComing('India', 'Pakistan', 'Tomorrow | 05:30 PM'),
    UpComing('India', 'Pakistan', 'Tomorrow | 05:30 PM'),
    UpComing('India', 'Pakistan', 'Tomorrow | 05:30 PM'),
    UpComing('India', 'Pakistan', 'Tomorrow | 05:30 PM'),
    UpComing('India', 'Pakistan', 'Tomorrow | 05:30 PM')
  ];

  @override
  Widget build(BuildContext context) {
    return upcomingMatchList.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              itemCount: 15,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return upcomingCard();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: spacingStandard);
              },
            ),
          )
        : error_view.ErrorWidget(
            image: 'assets/error_contest.png',
            title: 'You don\'t have join any content yet!',
            subTitle: 'Go to mycontest page and find a mycontest',
            isRetry: true,
            onPress: () {},
            retry: 'Join a Contest');
  }

  upcomingCard() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 4,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: Text('India',
                        textAlign: TextAlign.start,
                        style: mediumLargeTextStyle,
                        maxLines: 1)
                    .addMarginLeft(spacingContainer)),
            Expanded(
              child: Row(
                children: [
                  Image.asset('assets/india_ball.png', height: 40, width: 40),
                  Image.asset('assets/vs.png', height: 20, width: 20),
                  Image.asset('assets/pakistan_ball.png',
                      height: 40, width: 40),
                ],
              ).addMarginBottom(16),
            ),
            Expanded(
                child: Text('Pakistan',
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        style: mediumLargeTextStyle)
                    .addMarginRight(spacingContainer))
          ]).wrapPaddingAll(spacingContainer),
        ).wrapPadding(
            padding: const EdgeInsets.only(
                left: spacingLarge,
                right: spacingLarge,
                bottom: spacingContainer)),
        Positioned(
          left: 0,
          top: 20,
          child: Image.asset(
            'assets/india_hand.png',
            height: 60,
          ),
        ),
        Positioned(
          right: 0,
          top: 20,
          child: Image.asset(
            'assets/pakistan_hand.png',
            height: 60,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Card(
              color: Colors.white,
              elevation: 8,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text("Tomorrow | 02:55 PM",
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      style: smallMediumTextStyle,
                      textAlign: TextAlign.center)
                  .wrapPadding(padding: const EdgeInsets.only(left: 12, right: 12, top: spacingStandard, bottom: spacingStandard))),
        )
      ],
    );
  }
}

class UpComing {
  String? teamA, teamB, time;

  UpComing(this.teamA, this.teamB, this.time);
}
