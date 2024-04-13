/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */

import 'dart:ui';

import 'package:fantasy11_flutter/ui/home/home_screen.dart';
import 'package:fantasy11_flutter/ui/user/signup_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../utils/slide_route.dart';
import '../../values/values.dart';
import '../widgets/bg_image_widget.dart';
import '../widgets/text_form_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController =
      TextEditingController(text: "test@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "test@123");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImageWidget(),
        SafeArea(
          maintainBottomViewPadding: true,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                  },
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New User",
                      style:
                          boldLargeTextStyle.copyWith(fontSize: textSizeLarge),
                    ).wrapPadding(
                        padding: const EdgeInsets.only(
                            left: spacingContainer,
                            right: spacingContainer,
                            top: spacingContainer)),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacement(
                          SlideRightRoute(page: const SignUpScreen())),
                      child: Text(
                        "Sign Up",
                        style: mediumLargeTextStyle.copyWith(
                            fontSize: textSizeNormal, color: primaryColor),
                      ).wrapPadding(
                          padding: const EdgeInsets.only(
                              left: spacingContainer,
                              right: spacingContainer,
                              bottom: spacingContainer)),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: spacingContainer),
                              Center(
                                child: Text(
                                  "Sign In",
                                  style: boldLargeTextStyle.copyWith(
                                      fontSize: textSizeLarge),
                                ),
                              ),
                              const SizedBox(height: spacingContainer),
                              Text("Email", style: smallNormalTextStyle)
                                  .addMarginLeft(spacingContainer),
                              TextFormWidget(
                                  textInputType: TextInputType.emailAddress,
                                  textEditingController: emailController,
                                  hintText: "Enter Email Address"),
                              const SizedBox(height: spacingContainer),
                              Text("Password", style: smallNormalTextStyle)
                                  .addMarginLeft(spacingContainer),
                              TextFormWidget(
                                  textInputType: TextInputType.visiblePassword,
                                  textEditingController: passwordController,
                                  hintText: "Enter Password"),
                              GestureDetector(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Forgot password?",
                                    style: boldTextStyle,
                                  ).wrapPaddingAll(spacingStandard),
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: primaryColor,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0)),
                                    ),
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: SizedBox(
                                          height: 230,
                                          child: Card(
                                            color: primaryColor,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(20.0),
                                                  topLeft:
                                                      Radius.circular(20.0)),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                      height: spacingControl),
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            50)),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            color:
                                                                Colors.white),
                                                    height: 3,
                                                    width: 100,
                                                  ).addMarginTop(
                                                      spacingControlHalf),
                                                  Center(
                                                    child: Text(
                                                        "Forgot Password?",
                                                        style: boldLargeTextStyle
                                                            .copyWith(
                                                                color: Colors
                                                                    .white)),
                                                  ).addMarginTop(
                                                      spacingControl),
                                                  const SizedBox(
                                                      height: spacingContainer),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text("Email",
                                                        style:
                                                            smallNormalTextStyle
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white)),
                                                  ).addMarginLeft(
                                                      spacingContainer),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                    child: TextFormField(
                                                      controller:
                                                          emailController,
                                                      textAlign:
                                                          TextAlign.start,
                                                      showCursor: true,
                                                      readOnly: false,
                                                      maxLines: 1,
                                                      cursorColor: Colors.white,
                                                      style: normalTextStyle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                      buildCounter: (BuildContext?
                                                                  context,
                                                              {int?
                                                                  currentLength,
                                                              int? maxLength,
                                                              bool?
                                                                  isFocused}) =>
                                                          null,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      decoration:
                                                          InputDecoration(
                                                        filled: false,
                                                        hintText:
                                                            'Enter Email Address',
                                                        hintStyle:
                                                            hintTextStyle,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 14.0,
                                                                bottom: 0.0,
                                                                top: 0.0),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      textRadius),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      textRadius),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      textRadius),
                                                        ),
                                                        disabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      textRadius),
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      textRadius),
                                                        ),
                                                      ),
                                                    ),
                                                  ).addMarginTop(
                                                      spacingStandard),
                                                  InkWell(
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                    child: Center(
                                                      child: Container(
                                                        height: 50,
                                                        width:
                                                            context.width / 2,
                                                        decoration: const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            50)),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            color:
                                                                Colors.white),
                                                        child: Center(
                                                          child: Text(
                                                              'Forgot Password',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: mediumTextStyle
                                                                  .copyWith(
                                                                      color:
                                                                          primaryColor)),
                                                        ),
                                                      ),
                                                    ).addMarginTop(
                                                        spacingContainer),
                                                  ),
                                                ]).wrapPadding(
                                                padding: const EdgeInsets.only(
                                                    left: spacingContainer,
                                                    right: spacingContainer,
                                                    bottom: spacingContainer)),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              Center(
                                child: GestureDetector(
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white70, width: 5),
                                        shape: BoxShape.circle,
                                        color: primaryColor),
                                    child: const Icon(
                                        Icons.arrow_forward_ios_rounded),
                                  ).wrapPaddingAll(spacingStandard),
                                  onTap: () => Navigator.of(context)
                                      .pushReplacement(SlideRightRoute(
                                          page: const HomeScreen())),
                                ),
                              ),
                              const SizedBox(height: spacingStandard),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: primaryColor,
                                      width: MediaQuery.of(context).size.width,
                                    ).wrapPadding(
                                        padding: const EdgeInsets.only(
                                            left: spacingContainer,
                                            right: spacingContainer)),
                                  ),
                                  Text(
                                    "Or Sign In With",
                                    style: mediumTextStyle,
                                  ),
                                  Expanded(
                                    child: Container(
                                            height: 1,
                                            color: primaryColor,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width)
                                        .wrapPadding(
                                            padding: const EdgeInsets.only(
                                                left: spacingContainer,
                                                right: spacingContainer)),
                                  )
                                ],
                              ),
                              const SizedBox(height: spacingContainer),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: Image.asset(
                                      "assets/gp.png",
                                      height: 40,
                                      width: 40,
                                    )),
                                    const SizedBox(width: spacingContainer),
                                    Center(
                                        child: Image.asset(
                                      "assets/fb.png",
                                      height: 40,
                                      width: 40,
                                    )),
                                    const SizedBox(width: spacingContainer),
                                    Center(
                                        child: Image.asset(
                                      "assets/twitter.png",
                                      height: 40,
                                      width: 40,
                                    ))
                                  ])
                            ],
                          ).wrapPaddingAll(spacingContainer),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
