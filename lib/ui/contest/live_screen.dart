import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../values/values.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LiveScreenState();
}

class LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 15,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return liveCard();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: spacingStandard);
        },
      ),
    );
  }

  liveCard() {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10))),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Text('India Vs Pakistan',
                      maxLines: 1,
                      style: smallBoldTextStyle.copyWith(color: Colors.black54))
                  .wrapPadding(
                      padding: const EdgeInsets.only(
                          left: spacingStandard,
                          top: spacingStandard,
                          bottom: spacingStandard)),
            ),
            Row(
              children: [
                Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: Colors.green.shade900,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)))),
                Text('Live',
                        textAlign: TextAlign.center,
                        style: smallBoldTextStyle.copyWith(
                            color: Colors.green.shade900))
                    .wrapPadding(
                        padding: const EdgeInsets.only(
                            left: spacingControl,
                            right: spacingStandard,
                            top: spacingStandard,
                            bottom: spacingStandard)),
              ],
            ).wrapPadding(
                padding: const EdgeInsets.only(
                    left: spacingStandard, right: spacingStandard)),
            Expanded(
              flex: 1,
              child: Text('Today',
                      textAlign: TextAlign.end,
                      style: smallBoldTextStyle.copyWith(color: Colors.black54))
                  .wrapPadding(
                      padding: const EdgeInsets.only(
                          left: 12,
                          right: spacingStandard,
                          top: spacingStandard,
                          bottom: spacingStandard)),
            ),
          ],
        ),
        Container(
          height: 1,
          color: Colors.black26,
        ),
        const SizedBox(height: spacingStandard),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 16,
                  child: Image.asset(
                    'assets/india_flag.png',
                    height: 80,
                    fit: BoxFit.fill,
                    width: 120,
                  ),
                ),
                Image.asset(
                  'assets/play_a.png',
                  height: 120,
                  width: 120,
                )
              ],
            ),
            Row(children: [
              Column(
                children: [
                  Text('IND', style: boldLargeTextStyle),
                  Text('205/5', style: mediumTextStyle)
                      .addMarginTop(spacingControl),
                  Text('(20)', style: smallNormalTextStyle),
                ],
              ),
              Image.asset('assets/vs.png', height: 20, width: 20)
                  .wrapPaddingAll(spacingStandard),
              Column(
                children: [
                  Text('PAK', style: boldLargeTextStyle),
                  Text('89/8', style: mediumTextStyle)
                      .addMarginTop(spacingControl),
                  Text('(12.5)', style: smallNormalTextStyle),
                ],
              )
            ]),
            Stack(
              children: [
                Positioned(
                  top: 16,
                  child: Image.asset(
                    'assets/pakistan_flag.png',
                    height: 80,
                    fit: BoxFit.fill,
                    width: 120,
                  ),
                ),
                Image.asset(
                  'assets/play_b.png',
                  height: 120,
                  width: 120,
                )
              ],
            )
          ],
        ),
        const SizedBox(height: spacingStandard)
      ]),
    ).wrapPadding(
        padding: const EdgeInsets.only(
            left: spacingStandard, right: spacingStandard));
  }
}
