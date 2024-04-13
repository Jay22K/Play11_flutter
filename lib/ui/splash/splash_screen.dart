/*
 * *
 *  * Created by Vishal Patolia on 9/20/21, 5:09 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/20/21, 4:46 PM
 *
 */
import 'dart:async';

import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../utils/slide_route.dart';
import '../user/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/splash_bg.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(child: Image.asset('assets/logo.png', height: 300, width: 300), top: context.height / 30),
            Positioned(child: Image.asset('assets/splash_icon.png', height: 350, width: 350), bottom: context.height / 8, )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context)
            .pushReplacement(SlideRightRoute(page: const SignInScreen())));
  }
}
