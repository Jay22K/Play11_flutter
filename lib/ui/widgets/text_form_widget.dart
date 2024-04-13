import 'package:fantasy11_flutter/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../values/values.dart';

class TextFormWidget extends StatelessWidget {
  final double? radius;
  final String? hintText, errorText;
  final TextStyle? style;
  final Color? fillColor, errorColor;
  final Function? onValidation;
  final Function? onSaved;
  final Icon? suffixIcon;
  final TextEditingController? textEditingController;
  final int? maxLength;
  final int? maxLines;
  final bool? readOnly;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;

  const TextFormWidget(
      {Key? key,
      this.radius,
      this.hintText,
      this.errorText,
      this.maxLength,
      this.textInputType,
      this.onValidation,
      this.onSaved,
      this.readOnly,
      this.maxLines,
      this.suffixIcon,
      this.textEditingController,
      this.textInputFormatter,
      this.fillColor,
      this.style,
      this.errorColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(radius ?? 50),
      ),
      child: TextFormField(
        controller: textEditingController,
        textAlign: TextAlign.start,
        showCursor: true,
        readOnly: false,
        maxLines: maxLines,
        enabled: readOnly != null ? readOnly! : true,
        cursorColor: primaryColor,
        validator: onValidation != null ? onValidation!() : null,
        onSaved: onSaved != null ? onSaved!() : null,
        style: style ?? normalTextStyle,
        inputFormatters: textInputFormatter,
        buildCounter: (BuildContext? context,
                {int? currentLength, int? maxLength, bool? isFocused}) =>
            null,
        keyboardType: textInputType,
        maxLength: maxLength,
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null ? suffixIcon! : null,
          filled: false,
          // fillColor: fillColor ?? Colors.white.withOpacity(0.5),
          hintText: hintText,
          hintStyle: hintTextStyle,
          errorStyle: errorTextStyle.copyWith(color: errorColor ?? errorColor),
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 0.0, top: 0.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(textRadius),
          ),
        ),
      ),
    ).addMarginTop(spacingControl);
  }
}
