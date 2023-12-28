import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_constants.dart';
import '../../style/educonnect_colors.dart';
import 'buttons/educonnect_button_export.dart';

class EduConnectTextField extends StatelessWidget {
  final String? labelText;
  final double? width;
  final String? initialValue;
  final int maxLines;
  //final TextEditingController textController;
  final Function(String?)? onSaved;
  final Function(String?)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final bool hasBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  //final bool hasIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? enabled;

  const EduConnectTextField({
    super.key,
    this.labelText,
    this.width,
    //required this.textController,
    this.onSaved,
    this.validator,
    this.isObscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    // this.hasIcon = false,
    this.maxLines = 1,
    this.controller,
    this.prefixIcon,
    this.hasBorder = true,
    this.onFieldSubmitted,
    this.textInputAction,
    this.focusNode,
    this.textAlign,
    this.onEditingComplete,
    this.textDirection,
    this.enabled,
  });

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? EduConnectColors.grey,
        width: 0.5.w,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isArabic = EduConnectConstants.isCurrentLocaleArabic();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: width ?? double.infinity,
        child: TextFormField(
          enabled: enabled,
          textDirection: textDirection,
          textAlign: textAlign ?? (isArabic ? TextAlign.right : TextAlign.left),
          focusNode: focusNode,
          controller: controller,
          textCapitalization: textCapitalization,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          obscureText: isObscureText,
          //controller: textController,
          onSaved: onSaved,
          validator: validator,
          maxLines: maxLines,
          initialValue: initialValue,
          textInputAction: textInputAction ?? TextInputAction.next,
          decoration: decoration(),
          // ),
        ),
      ),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      alignLabelWithHint: true,
      prefixIcon: prefixIcon,
      prefixIconColor: EduConnectColors.grey,
      errorMaxLines: 5,
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      labelStyle: GoogleFonts.poppins(
        textStyle: EduConnectConstants.text_theme.bodyMedium!.copyWith(
            color: EduConnectColors.grey,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      labelText: labelText,
      suffixIcon: suffixIcon,
      suffixIconColor: EduConnectColors.grey,
      border: hasBorder ? buildBorder() : null,
      enabledBorder: hasBorder ? buildBorder() : null,
      focusedBorder: hasBorder ? buildBorder(color: EduConnectColors.blue) : null,
    );
  }
}

class EduconnectPromoCodeTextField extends StatelessWidget {
  final String hintText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const EduconnectPromoCodeTextField({
    super.key,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.keyboardType,
  });

  // bool isCurrentLocaleArabic(BuildContext context) {
  //   Locale? currentLocale = Localizations.localeOf(context);
  //   return currentLocale.languageCode.toLowerCase() == 'ar';
  // }

  @override
  Widget build(BuildContext context) {
    final bool isArabic = EduConnectConstants.isCurrentLocaleArabic();

    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: EduConnectColors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isArabic ? 0 : 10.r),
          bottomLeft: Radius.circular(isArabic ? 0 : 10.r),
          topRight: Radius.circular(isArabic ? 10.r : 0),
          bottomRight: Radius.circular(isArabic ? 10.r : 0),
        ),
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: validator,
        maxLines: 1,
        decoration: InputDecoration(
          errorMaxLines: 5,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
          labelStyle: GoogleFonts.poppins(
            textStyle: EduConnectConstants.text_theme.bodyMedium!.copyWith(
              color: EduConnectColors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          labelText: hintText,
          hintStyle: EduConnectConstants.text_theme.labelMedium!.copyWith(
            color: EduConnectColors.grey,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: EduconnectButton(
            button: EduconnectElevatedButton(
              width: 50.w,
              height: 60.h,
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              text: EduConnectConstants.localization().apply,
              textStyle: EduConnectConstants.text_theme.labelMedium!.copyWith(
                color: EduConnectColors.white,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isArabic ? 10.r : 0),
                  bottomLeft: Radius.circular(isArabic ? 10.r : 0),
                  topRight: Radius.circular(isArabic ? 0 : 10.r),
                  bottomRight: Radius.circular(isArabic ? 0 : 10.r),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
