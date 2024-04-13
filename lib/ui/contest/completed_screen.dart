import 'package:fantasy11_flutter/ui/contest/completed_details_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../utils/slide_route.dart';
import '../../values/values.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CompletedScreenState();
}

class CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 15,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return completeCard();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: spacingStandard);
        },
      ),
    );
  }

  completeCard() {
    return InkWell(
      child: Stack(alignment: Alignment.center, children: [
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
                        style:
                            smallMediumTextStyle.copyWith(color: Colors.white))
                    .wrapPadding(
                        padding: const EdgeInsets.only(
                            left: spacingContainer,
                            right: spacingContainer,
                            top: spacingStandard,
                            bottom: spacingStandard))),
          ),
        )
      ]),
      onTap: () => Navigator.of(context)
          .push(SlideRightRoute(page: const CompletedDetailsScreen())),
    );
  }
}
