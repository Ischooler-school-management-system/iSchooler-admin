import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/madpoly.dart';
import '../../educonnect_constants.dart';
import '../../style/educonnect_colors.dart';
import '../../style/educonnect_text_theme.dart';

class EduConnectDropdownWidget extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String? hint;
  final double? width;
  final String? value;
  final bool enableValidation;
  final String labelText;

  const EduConnectDropdownWidget({
    super.key,
    required this.options,
    required this.onChanged,
    this.hint,
    this.width,
    this.value,
    this.enableValidation = true,
    required this.labelText,
  });

  @override
  State<EduConnectDropdownWidget> createState() =>
      _EduConnectDropdownWidgetState();
}

class _EduConnectDropdownWidgetState extends State<EduConnectDropdownWidget> {
  String? selectedValue;
  bool isValidValue(value) => widget.options.contains(value);

  String? validator(value) {
    final bool validValue = isValidValue(value);
    Madpoly.print(
      'widget.value = ${widget.value}',
      tag: "_DropdownButtonWidgetState > build",
      developer: 'ziad',
    );
    if (value == null || !validValue) {
      // SmartDialog.showToast(EduconnectConstants.localization().select_option_prompt);
      return EduconnectConstants.localization().select_option_prompt;
    }
    return null;
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? EduconnectColors.fieldsBorderColor,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  OutlineInputBorder buildErrorBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? EduconnectColors.red,
        width: 0.5,
      ),
      gapPadding: 14,
      borderRadius: BorderRadius.circular(10),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      filled: true,
      fillColor: EduconnectColors.white,
      focusColor: EduconnectColors.white,
      // alignLabelWithHint: true,
      // prefixIconColor: EduconnectColors.primaryColor,
      errorMaxLines: 5,
      // labelStyle: EduconnectTextStyles.style12Blue,
      // suffixIconColor: EduconnectColors.primaryColor,
      border: buildBorder(),
      enabledBorder: buildBorder(),
      focusedBorder: buildBorder(),
      errorBorder: buildErrorBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool validValue = isValidValue(selectedValue);
    if (!validValue) {
      setState(() {
        selectedValue = null;
      });
    }

    void onChanged(value) => setState(() {
          selectedValue = value;
          widget.onChanged(value);
        });

    DropdownMenuItem<String> itemWidget(String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: EduconnectConstants.textTheme.labelMedium!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: EduconnectColors.blue,
          ),
        ),
      );
    }

    List<DropdownMenuItem<String>> dropDownItems;
    if ((widget.options.isEmpty)) {
      dropDownItems = [itemWidget('Nothing')];
    } else {
      dropDownItems = widget.options.map((item) => itemWidget(item)).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.labelText,
            style: EduconnectTextStyles.style16,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          width: widget.width,
          child: DropdownButtonFormField2(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: decoration(),
            // validator: widget.enableValidation ? validator : null,
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down),
            ),

            value: selectedValue,
            isExpanded: true,
            // icon: const Icon(
            //   Icons.keyboard_arrow_down,
            // ),
            onChanged: onChanged,
            items: dropDownItems,
            hint: (widget.hint != null)
                ? Text(
                    widget.hint!,
                    style: EduconnectConstants.textTheme.labelMedium!.copyWith(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: EduconnectColors.light_grey,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
