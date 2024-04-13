/*
 * *
 *  * Created by Vishal Patolia on 9/27/21, 6:10 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/27/21, 6:10 PM
 *
 */

import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../values/values.dart';

circularImageBorder(double size, String placeHolder, String imageUrl) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: backGroundColor,
      borderRadius: BorderRadius.all(Radius.circular(size / 2)),
      border: Border.all(
        color: primaryColor,
        width: borderWidth,
      ),
    ),
    child: ClipOval(
        child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage(placeHolder),
            image: AssetImage(imageUrl))),
  );
}

toolbarBack(String title, BuildContext context) {
  return AppBar(
      titleSpacing: 5,
      elevation: 0.0,
      backgroundColor: primaryColor,
      title: Text(title, style: appBarStyle),
      leading: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset('assets/arrow.png', height: 24, width: 24)
            .wrapPaddingAll(16),
        onTap: () => moveToLast(context),
      ));
}

moveToLast(var context) {
  Navigator.pop(context);
}

dismissDialog(BuildContext context, String title) {
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: primaryColor,
      content: Text(title, style: mediumTextStyle)));
}

snackBarMsg(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: primaryColor,
      content: Text(title, style: mediumTextStyle)));
}

launchURL(String url, BuildContext context) async => await canLaunch(url)
    ? await launch(url)
    : throw ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(url)));
