/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */

import 'package:fantasy11_flutter/ui/home/home_screen.dart';
import 'package:fantasy11_flutter/ui/user/signin_screen.dart';
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/extension_widget.dart';
import '../../utils/slide_route.dart';
import '../../values/values.dart';
import '../widgets/bg_image_widget.dart';
import '../widgets/text_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool selectTerms = false;

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
                      "Already Member?",
                      style:
                          boldLargeTextStyle.copyWith(fontSize: textSizeLarge),
                    ).wrapPadding(
                        padding: const EdgeInsets.only(
                            left: spacingContainer,
                            right: spacingContainer,
                            top: spacingContainer)),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacement(
                          SlideRightRoute(page: const SignInScreen())),
                      child: Text(
                        "Sign In",
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
                                  "Sign Up",
                                  style: boldLargeTextStyle.copyWith(
                                      fontSize: textSizeLarge),
                                ),
                              ),
                              const SizedBox(height: spacingContainer),
                              Text("Username", style: smallNormalTextStyle)
                                  .addMarginLeft(spacingContainer),
                              TextFormWidget(
                                  textEditingController: emailController,
                                  hintText: "Enter Username"),
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
                              const SizedBox(height: spacingContainer),
                              Text("Confirm Password",
                                      style: smallNormalTextStyle)
                                  .addMarginLeft(spacingContainer),
                              TextFormWidget(
                                  textEditingController: passwordController,
                                  textInputType: TextInputType.visiblePassword,
                                  hintText: "Enter Confirm Password"),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: primaryColor,
                                    fillColor:
                                        MaterialStateProperty.all(primaryColor),
                                    hoverColor: primaryColor.withOpacity(0.3),
                                    value: selectTerms,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectTerms = value!;
                                      });
                                    },
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'I read and agree with ',
                                        style: normalTextStyle,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Terms & Conditions',
                                              style: boldTextStyle.copyWith(
                                                  color: primaryColor,
                                                  decoration:
                                                      TextDecoration.underline),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  launchURL(
                                                      termsCondition, context);
                                                })
                                        ]),
                                  ).wrapPaddingAll(spacingStandard),
                                ],
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
