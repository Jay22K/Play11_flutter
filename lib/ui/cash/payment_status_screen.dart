/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:fantasy11_flutter/utils/extension_widget.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../../values/values.dart';

class PaymentStatusScreen extends StatefulWidget {
  final int? status;
  const PaymentStatusScreen({Key? key, this.status}) : super(key: key);

  @override
  State<PaymentStatusScreen> createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  ConfettiController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(
      duration: const Duration(seconds: 2),
    );
    _controller!.play();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
          appBar: toolbarBack('Payment Status', context),
          backgroundColor: backGroundColor,
          body: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Container(color: Colors.white),
              widget.status! == 0
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Payment Added Successfully!', style: mediumLargeTextStyle),
                  Image.asset(
                    "assets/success.png",
                    height: 250,
                    width: 250,
                  ).addMarginTop(spacingLarge),
                  InkWell(
                    child: SizedBox(
                      child: Card(
                          color: Colors.green.shade900,
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Text("Finish",
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
                    ).addMarginTop(spacingStandard),
                    onTap: () => Navigator.pop(context),).addMarginTop(spacingContainer)
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Payment Failed!', style: mediumLargeTextStyle),
                  Image.asset(
                    "assets/failure.png",
                    height: 250,
                    width: 250,
                  ),
                  InkWell(
                    child: SizedBox(
                      child: Card(
                          color: Colors.red.shade900,
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Text("Back",
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
                    ).addMarginTop(spacingStandard),
                    onTap: () => Navigator.pop(context)).addMarginTop(spacingContainer)
                ],
              ),
              widget.status! == 0
                  ? Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  blastDirectionality: BlastDirectionality.explosive,
                  confettiController: _controller!,
                  particleDrag: 0.03,
                  emissionFrequency: 0.05,
                  blastDirection: 360,
                  numberOfParticles: 15,
                  minimumSize: const Size.fromRadius(2),
                  maximumSize: const Size.fromRadius(8),
                  gravity: 0.02,
                  shouldLoop: true,
                  colors: const [
                    Colors.green,
                    Colors.red,
                    Colors.yellow,
                    Colors.pink,
                    Colors.orange,
                    Colors.deepPurple,
                    Colors.teal,
                    Colors.purpleAccent,
                    Colors.blue,
                  ],
                ),
              )
                  : Container(),
            ],
          ),
      )
    );
  }
}
