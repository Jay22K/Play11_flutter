import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../values/values.dart';

/// Created by Vishal Patel
/// Copyright (c) 2021-22. All rights reserved.
/// Sdreatech Pvt. Ltd.

class ErrorWidget extends StatelessWidget {
  final String? image, title, subTitle, retry;
  final bool? isRetry;
  final VoidCallback? onPress;

  const ErrorWidget(
      {Key? key,
      this.image,
      this.title,
      this.subTitle,
      this.isRetry,
      this.retry,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: spacingContainer * 2,
              left: spacingContainer,
              right: spacingContainer,
              bottom: spacingStandard),
          child: Text(
            title!,
            textAlign: TextAlign.center,
            style: normalTextStyle,
          ),
        ),
        Image.asset(image!,
            fit: BoxFit.scaleDown,
            width: AppConstant.imageSize,
            height: AppConstant.imageSize),
        Padding(
          padding: const EdgeInsets.only(
              left: spacingContainer, right: spacingContainer),
          child: Text(subTitle!,
              textAlign: TextAlign.center, style: normalTextStyle),
        ),
        const SizedBox(height: spacingContainer),
        isRetry!
            ? ElevatedButton(
                child: Text(retry!,
                    style: mediumTextStyle.copyWith(color: Colors.white)),
                onPressed: onPress,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
              )
            : Container(),
      ],
    ));
  }
}
