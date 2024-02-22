import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final String? labelText;

  const EduConnectDropdownWidget({
    super.key,
    required this.options,
    required this.onChanged,
    this.hint,
    this.width,
    this.value,
    this.enableValidation = true,
    this.labelText,
  });

  @override
  State<EduConnectDropdownWidget> createState() =>
      _EduConnectDropdownWidgetState();
}

class _EduConnectDropdownWidgetState extends State<EduConnectDropdownWidget> {
  String? selectedValue;
  bool isValidValue(value) {
    return widget.options.contains(value);
  }

  String? validator(value) {
    final bool validValue = isValidValue(value);
    if (value == null || !validValue) {
      // SmartDialog.showToast(IschoolerConstants.localization().select_option_prompt);
      return IschoolerConstants.localization().select_option_prompt;
    }
    return null;
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? IschoolerColors.fieldsBorderColor,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  OutlineInputBorder buildErrorBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? IschoolerColors.red,
        width: 0.5,
      ),
      gapPadding: 14,
      borderRadius: BorderRadius.circular(10),
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
      filled: true,
      fillColor: IschoolerColors.white,
      focusColor: IschoolerColors.white,
      // alignLabelWithHint: true,
      // prefixIconColor: IschoolerColors.primaryColor,
      errorMaxLines: 5,
      // labelStyle: IschoolerTextStyles.style12Blue,
      // suffixIconColor: IschoolerColors.primaryColor,
      border: buildBorder(),
      enabledBorder: buildBorder(),
      focusedBorder: buildBorder(),
      errorBorder: buildErrorBorder(),
    );
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
        style: IschoolerConstants.textTheme.labelMedium!.copyWith(
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: IschoolerColors.blue,
        ),
      ),
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

    List<DropdownMenuItem<String>> dropDownItems;
    if ((widget.options.isEmpty)) {
      dropDownItems = [itemWidget('Nothing')];
    } else {
      dropDownItems = widget.options.map((item) => itemWidget(item)).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.labelText!,
              style: IschoolerTextStyles.style16,
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
                    style: IschoolerConstants.textTheme.labelLarge!.copyWith(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      // color: IschoolerColors.light_grey,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
