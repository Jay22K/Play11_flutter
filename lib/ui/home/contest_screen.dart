import 'package:fantasy11_flutter/ui/contest/live_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../values/values.dart';
import '../contest/completed_screen.dart';
import '../contest/upcoming_screen.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ContestScreenState();
}

class ContestScreenState extends State<ContestScreen> {
  late int _currentDrawerIndex = 0;

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
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                            color: _currentDrawerIndex == 0
                                ? primaryColor
                                : Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        child: Center(
                          child: Text("Upcoming",
                                  style: boldTextStyle.copyWith(
                                      color: _currentDrawerIndex == 0
                                          ? Colors.white
                                          : primaryColor))
                              .wrapPaddingAll(spacingStandard),
                        ),
                      ),
                      onTap: () => setState(() {
                        _currentDrawerIndex = 0;
                      }),
                    ).wrapPaddingAll(spacingControl),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: _currentDrawerIndex == 1
                                ? primaryColor
                                : Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        width: 120,
                        child: Center(
                          child: Text("Live",
                                  style: boldTextStyle.copyWith(
                                      color: _currentDrawerIndex == 1
                                          ? Colors.white
                                          : primaryColor))
                              .wrapPaddingAll(spacingStandard),
                        ),
                      ),
                      onTap: () => setState(() {
                        _currentDrawerIndex = 1;
                      }),
                    ).wrapPaddingAll(spacingControl),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: _currentDrawerIndex == 2
                                ? primaryColor
                                : Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        width: 120,
                        child: Center(
                          child: Text("Completed",
                                  style: boldTextStyle.copyWith(
                                      color: _currentDrawerIndex == 2
                                          ? Colors.white
                                          : primaryColor))
                              .wrapPaddingAll(spacingStandard),
                        ),
                      ),
                      onTap: () => setState(() {
                        _currentDrawerIndex = 2;
                      }),
                    ).wrapPaddingAll(spacingControl)
                  ],
                ),
              ).wrapPadding(
                  padding: const EdgeInsets.only(
                      top: spacingContainer,
                      left: spacingContainer,
                      right: spacingContainer,
                      bottom: spacingControl)),
              const SizedBox(height: spacingStandard),
              tabView()
            ],
          ).wrapPadding(
              padding: const EdgeInsets.only(bottom: spacingContainer))),
    );
  }

  tabView() {
    if (_currentDrawerIndex == 1) {
      return const LiveScreen();
    } else if (_currentDrawerIndex == 2) {
      return const CompletedScreen();
    } else {
      return const UpcomingScreen();
    }
  }
}
