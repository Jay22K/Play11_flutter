/*
 * *
 *  * Created by Vishal Patolia on 9/28/21, 1:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Sdreatech Solutions Pvt. Ltd.
 *  * Last modified 9/23/21, 12:19 PM
 *
 */
import 'dart:io';
import 'dart:ui';

import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:fantasy11_flutter/utils/extension_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../values/values.dart';
import '../widgets/text_form_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  DateTime? selectDate = DateTime.now();
  int id = 1;

  XFile? _image;
  ImagePicker picker = ImagePicker();
  FilePickerResult? _imageW;

  //For Window
  Future getWindowImage() async {
    _imageW = (await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.image,
        allowedExtensions: ['jpg', 'png']));

    setState(() {
      if (_imageW != null) {
        _image = XFile(_imageW!.files[0].path!);
      } else {
        snackBarMsg(context, 'Not Selected Any Images...');
      }
    });
  }

  Future getImage(int selectType) async {
    _image = (await picker.pickImage(
        source: selectType == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 100));

    setState(() {
      if (_image != null) {
        _image = XFile(_image!.path);
      } else {
        snackBarMsg(context, 'Not Selected Any Images...');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
          appBar: toolbarBack('Profile', context),
          backgroundColor: backGroundColor,
          body: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              },
            ),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  userPic(context),
                  const SizedBox(height: spacingContainer),
                  Text("Name", style: smallNormalTextStyle)
                      .addMarginLeft(spacingContainer),
                  TextFormWidget(
                      textEditingController: emailController,
                      hintText: "Enter Name"),
                  const SizedBox(height: spacingContainer),
                  Text("Email", style: smallNormalTextStyle)
                      .addMarginLeft(spacingContainer),
                  TextFormWidget(
                      textInputType: TextInputType.emailAddress,
                      textEditingController: emailController,
                      hintText: "Enter Email Address"),
                  const SizedBox(height: spacingContainer),
                  Text("Mobile No.", style: smallNormalTextStyle)
                      .addMarginLeft(spacingContainer),
                  TextFormWidget(
                      textInputType: TextInputType.visiblePassword,
                      textEditingController: passwordController,
                      hintText: "Enter Mobile No."),
                  const SizedBox(height: spacingContainer),
                  Text("Date Of Birth", style: smallNormalTextStyle)
                      .addMarginLeft(spacingContainer),
                  InkWell(
                    child: TextFormWidget(
                        textEditingController: passwordController,
                        textInputType: TextInputType.visiblePassword,
                        readOnly: false,
                        hintText: "Select Date Of Birth"),
                    onTap: () {
                      _selectToDate(context);
                    },
                  ),
                  const SizedBox(height: spacingContainer),
                  Text("Gender", style: smallNormalTextStyle)
                      .addMarginLeft(spacingContainer),
                  _radioGroup(),
                  Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 5),
                          shape: BoxShape.circle,
                          color: primaryColor),
                      child: const Icon(Icons.save),
                    ).wrapPaddingAll(spacingStandard),
                  ),
                ],
              ).wrapPaddingAll(spacingContainer),
            ),
          )),
    );
  }

  userPic(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            GestureDetector(
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 12.0),
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primaryColor, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5, // changes position of shadow
                              ),
                            ],
                            image: _image != null
                                ? DecorationImage(
                                    image: _imageDisplay(_image!.path),
                                    fit: BoxFit.cover)
                                : const DecorationImage(
                                    image:
                                        AssetImage("assets/man_profile.png")))),
                    Positioned(
                        bottom: 9,
                        right: 9,
                        //give the values according to your requirement
                        child: InkWell(
                          child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: primaryColor,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 10,
                                ),
                              ], color: primaryColor, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 16,
                              )),
                          onTap: () {
                            selectImage();
                          },
                        )),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }

  selectImage() {
    showBarModalBottomSheet(
      context: context,
      builder: (context) => Material(
          color: Colors.transparent.withOpacity(0.5),
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                        width: context.width,
                        height: 60,
                        alignment: Alignment.center,
                        child: Text("Choose option",
                                style: boldLargeTextStyle.copyWith(
                                    fontSize: textSizeNormal,
                                    color: Colors.white))
                            .wrapPaddingAll(spacingContainer),
                        color: primaryColor),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  child: const Icon(Icons.camera_alt_rounded,
                                          color: primaryColor, size: 45)
                                      .wrapPaddingAll(24),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: primaryColor),
                                    shape: BoxShape.circle,
                                  ),
                                  height: 120,
                                ),
                                Text("Camera", style: boldLargeTextStyle)
                                    .addMarginBottom(spacingContainer)
                              ],
                            ),
                            onTap: () {
                              getImage(1);
                              Navigator.pop(context);
                            },
                          ).wrapPaddingAll(spacingContainer),
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  child: const Icon(Icons.photo_library_rounded,
                                          color: primaryColor, size: 45)
                                      .wrapPaddingAll(24),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: primaryColor),
                                    shape: BoxShape.circle,
                                  ),
                                  height: 120,
                                ),
                                Text("Gallery", style: boldLargeTextStyle)
                                    .addMarginBottom(spacingContainer)
                              ],
                            ),
                            onTap: () {
                              getImage(2);
                              Navigator.pop(context);
                            },
                          ).wrapPaddingAll(spacingContainer)
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }

  _imageDisplay(String imagePath) {
    return FileImage(File(imagePath));
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 150),
        lastDate: DateTime.now(),
        builder: (BuildContext? context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: primaryColor,
              colorScheme: const ColorScheme.light(primary: primaryColor),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        });
    if (d != null) {
      setState(() {
        selectDate = d;
        dobController.text = DateFormat("dd-MM-yyyy").format(selectDate!);
      });
    }
  }

  _radioGroup() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (int? value) {
                setState(() {
                  id = value!;
                });
              },
              fillColor: MaterialStateProperty.all(primaryColor),
            ),
            Text("Male", style: boldTextStyle)
          ],
        ),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: id,
              onChanged: (int? value) {
                setState(() {
                  id = value!;
                });
              },
              fillColor: MaterialStateProperty.all(primaryColor),
            ),
            Text("Female", style: boldTextStyle)
          ],
        ),
        Row(
          children: [
            Radio(
              value: 3,
              groupValue: id,
              onChanged: (int? value) {
                setState(() {
                  id = value!;
                });
              },
              fillColor: MaterialStateProperty.all(primaryColor),
            ),
            Text("Transgender", style: boldTextStyle)
          ],
        )
      ],
    );
  }
}
