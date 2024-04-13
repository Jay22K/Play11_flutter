/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/ui/home/contest_screen.dart';
import 'package:fantasy11_flutter/ui/home/dashboard_screen.dart';
import 'package:fantasy11_flutter/ui/home/leaderboard_screen.dart';
import 'package:fantasy11_flutter/ui/home/setting_screen.dart';
import 'package:fantasy11_flutter/ui/home/wallet_screen.dart';
import 'package:fantasy11_flutter/ui/user/account_verify_screen.dart';
import 'package:fantasy11_flutter/ui/user/profile_screen.dart';
import 'package:fantasy11_flutter/ui/user/signin_screen.dart';
import 'package:fantasy11_flutter/ui/wallet/withdrawal_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/slide_route.dart';
import '../../values/values.dart';

class HomeScreen extends StatefulWidget {
  final int? indexPosition;

  const HomeScreen({Key? key, this.indexPosition}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late int _currentIndex, _currentDrawerIndex = 0;
  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 600));

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.indexPosition != null ? widget.indexPosition! : 0;
  }

  void changePage(int? index) {
    setState(() {
      _currentIndex = index!;
    });
    selectNavScreen();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      maintainBottomViewPadding: true,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: backGroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150.0),
            child: Container(
              height: 60,
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Image.asset('assets/profile_icon.png'),
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  ).wrapPaddingAll(12),
                  Image.asset('assets/header_icon.png'),
                  Image.asset('assets/notification.png', color: Colors.white)
                      .wrapPaddingAll(spacingContainer),
                ],
              ),
            )),
        drawer: SizedBox(
          width: defaultTargetPlatform == TargetPlatform.windows && kIsWeb
              ? 400
              : 304,
          child: Drawer(
            child: Container(
                color: backGroundColor.withOpacity(0.9),
                child: Column(children: [
                  InkWell(
                    child: Container(
                      height: 80,
                      color: primaryColor,
                      child: Row(children: [
                        ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset('assets/man.png',
                                    width: 50, height: 50))
                            .addMarginLeft(spacingContainer),
                        Expanded(
                            child: Text("Welcome \nVishal",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: boldLargeTextStyle.copyWith(
                                        color: Colors.white))
                                .wrapPaddingAll(spacingContainer)),
                        const Icon(Icons.arrow_forward_ios_rounded)
                            .addMarginRight(spacingStandard)
                      ]),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(SlideRightRoute(
                          page: const ProfileScreen()));
                    },
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Sign In Button
                        InkWell(
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                                color: _currentDrawerIndex == 0
                                    ? primaryColor
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Center(
                              child: Text("Account",
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
                        ).wrapPaddingAll(spacingControlHalf),
                        // Sign Up Button
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: _currentDrawerIndex == 1
                                    ? primaryColor
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            width: 120,
                            child: Center(
                              child: Text("More",
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
                        ).wrapPaddingAll(spacingControlHalf)
                      ],
                    ),
                  ).wrapPadding(
                      padding: const EdgeInsets.only(
                          top: spacingContainer,
                          left: spacingContainer,
                          right: spacingContainer,
                          bottom: spacingStandard)),
                  Expanded(
                      child: _currentDrawerIndex == 0
                          ? ListView(
                              physics: const ClampingScrollPhysics(),
                              children: [
                                InkWell(
                                  child: drawerItem('assets/menu_verified.png',
                                      'Verify Your Account'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(SlideRightRoute(
                                        page: const AccountVerifyScreen()));
                                  },
                                ),
                                const SizedBox(height: 12),
                                drawerItem(
                                    'assets/menu_coupon.png', 'Promo & Offers'),
                                const SizedBox(height: 12),
                                drawerItem(
                                    'assets/menu_cashback.png', 'Cashback'),
                                const SizedBox(height: 12),
                                drawerItem('assets/menu_wallet.png', 'Wallet'),
                                const SizedBox(height: 12),
                                drawerItem('assets/menu_info.png', 'About Us'),
                                const SizedBox(height: 12),
                                drawerItem(
                                    'assets/menu_phone.png', 'Contact Us'),
                                const SizedBox(height: 12),
                                drawerItem('assets/menu_help.png', 'Support'),
                                const SizedBox(height: 12),
                                InkWell(
                                  child: drawerItem('assets/menu_withdrawl.png',
                                      'Withdrawal'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.of(context).push(SlideRightRoute(
                                        page: const WithdrawalScreen()));
                                  },
                                ),
                              ],
                            )
                          : ListView(
                              physics: const ClampingScrollPhysics(),
                              children: [
                                drawerItem('assets/menu_refer_and_earn.png',
                                    'Refer & Earn'),
                                const SizedBox(height: 12),
                                drawerItem('assets/menu_point.png',
                                    'Fantasy Points System'),
                                const SizedBox(height: 12),
                                drawerItem(
                                    'assets/menu_refer.png', 'Refer List'),
                                const SizedBox(height: 12),
                                drawerItem('assets/menu_how_to_play.png',
                                    'How to Play'),
                                const SizedBox(height: 12),
                                drawerItem(
                                    'assets/menu_legality.png', 'Legality'),
                                const SizedBox(height: 12),
                                drawerItem('assets/menu_privacy.png',
                                    'Privacy & Policy')
                              ],
                            )),
                  Card(
                          color: Colors.white,
                          child: Row(children: [
                            Image.asset('assets/support.png',
                                height: 30, width: 30),
                            Text("How can we help you?",
                                    style: mediumTextStyle.copyWith(
                                        color: Colors.green))
                                .addMarginLeft(spacingContainer)
                          ]).wrapPaddingAll(spacingContainer))
                      .wrapPaddingAll(spacingStandard),
                  Container(height: 2, color: primaryColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/bottom_power.png',
                              height: 40, width: 40)
                          .addInkWellTap(() {
                        Navigator.pop(context);

                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: backGroundColor,
                                title: Text(
                                  'Logout!',
                                  style: boldLargeTextStyle.copyWith(
                                      fontSize: textSizeNormal),
                                ),
                                // To display the title it is optional
                                content: Text(
                                    'Are you sure you want to logout now?',
                                    style: mediumTextStyle),
                                // Message which will be pop up on the screen
                                // Action widget which will provide the user to acknowledge the choice
                                actions: [
                                  SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(0),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30))),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  primaryColor)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      // function used to perform after pressing the button
                                      child: Text('Cancel',
                                          style: boldTextStyle.copyWith(
                                              color: Colors.white)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(0),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30))),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  primaryColor)),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignInScreen()),
                                            (Route<dynamic> route) => false);
                                      },
                                      child: Text('Ok',
                                          style: boldTextStyle.copyWith(
                                              color: Colors.white)),
                                    ),
                                  ),
                                ],
                              );
                            });
                      }),
                      Image.asset('assets/bottom_wallet.png',
                          height: 40, width: 40),
                      Image.asset('assets/bottom_more.png',
                          height: 40, width: 40)
                    ],
                  ).wrapPadding(
                      padding: const EdgeInsets.only(
                          left: spacingContainer,
                          right: spacingContainer,
                          top: spacingStandard,
                          bottom: spacingStandard))
                ])),
          ),
        ),
        body: selectNavScreen(),
        floatingActionButton: InkWell(
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: primaryColor),
            child: Image.asset(
              'assets/winner.png',
              height: 50,
              width: 50,
              color: Colors.white,
            ).wrapPaddingAll(12),
          ),
          onTap: () {
            setState(() {
              _currentIndex = 2;
            });
          },
        ),
        bottomNavigationBar: SizedBox(
          height: 56,
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                bottomBarWidget('assets/home.png', 0),
                bottomBarWidget('assets/trophy.png', 1),
                const Expanded(
                  child: Text(""),
                ),
                bottomBarWidget('assets/more.png', 3),
                bottomBarWidget('assets/wallet.png', 4)
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  bottomBarWidget(String icon, int bottomPosition) {
    return Expanded(
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _currentIndex == bottomPosition
                ? Container(height: 3, color: primaryColor)
                : Container(),
            _currentIndex == bottomPosition
                ? Container(
                        height: 5,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor))
                    .addMarginTop(spacingControl)
                : Container().addMarginTop(12),
            Center(
              child: Image.asset(
                icon,
                color: _currentIndex == bottomPosition
                    ? primaryColor
                    : Colors.black,
                height: 25,
                width: 25,
              ).wrapPaddingAll(spacingControl),
            ).addMarginTop(spacingControlHalf),
          ],
        ),
        onTap: () {
          setState(() {
            _currentIndex = bottomPosition;
          });
        },
      ),
    );
  }

  selectNavScreen() {
    if (_currentIndex == 1) {
      return const ContestScreen();
    } else if (_currentIndex == 2) {
      return const LeaderboardScreen();
    } else if (_currentIndex == 3) {
      return const SettingScreen();
    } else if (_currentIndex == 4) {
      return const WalletScreen();
    } else {
      return const DashboardScreen();
    }
  }

  drawerItem(String icon, String title) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 25,
          height: 25,
        ),
        Expanded(
            child: Text(title,
                    style: mediumLargeTextStyle.copyWith(color: primaryColor))
                .addMarginLeft(spacingContainer)),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: primaryColor,
        )
      ],
    ).wrapPadding(
        padding: const EdgeInsets.only(
            top: spacingStandard,
            left: spacingContainer,
            right: spacingStandard));
  }
}
