import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/madpoly.dart';
import '../../educonnect_constants.dart';
import '../../style/educonnect_colors.dart';

class DropdownButtonWidget extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final String? hint;
  final double? width;
  final String? value;
  final bool enableValidation;

  const DropdownButtonWidget({
    super.key,
    required this.options,
    required this.onChanged,
    this.hint,
    this.width,
    this.value,
    this.enableValidation = true,
  });

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String? selectedValue;

  String? validator(value) {
    final bool validValue = isValidValue(value);
    Madpoly.print(
      'widget.value = ${widget.value}',
      tag: "_DropdownButtonWidgetState > build",
      developer: 'ziad',
      isInspect: true,
      isLog: true,
    );
    if (value == null || !validValue) {
      // SmartDialog.showToast(EduconnectConstants.localization().select_option_prompt);
      return EduconnectConstants.localization().select_option_prompt;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Madpoly.print(
    //   'creating dropdown menu contains this list:${widget.options}',
    //   tag: "DropdownButtonWidget > build function",
    //   developer: 'ziad',
    //   isInspect: true,
    //   isLog: true,
    // );
    final bool validValue = isValidValue(selectedValue);
    if (!validValue) {
      setState(() {
        selectedValue = null;
      });
    }
    // Madpoly.print(
    //   'widget.value = ${widget.value}',
    //   tag: "_DropdownButtonWidgetState > build",
    //   developer: 'ziad',
    //   isInspect: true,
    //   isLog: true,
    // );
    return SizedBox(
      width: widget.width,
      child: DropdownButtonFormField2(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.enableValidation ? validator : null,
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
          ),
        ),
        value: selectedValue,
        isExpanded: true,
        // icon: const Icon(
        //   Icons.keyboard_arrow_down,
        // ),
        onChanged: (value) => setState(() {
          selectedValue = value;
          widget.onChanged(value);
        }),
        items: (widget.options.isEmpty)
            ? [itemWidget('Nothing', context)]
            : widget.options.map((item) => itemWidget(item, context)).toList(),
        hint: (widget.hint != null)
            ? Text(
                widget.hint!,
                style: EduconnectConstants.text_theme.labelMedium!.copyWith(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: EduconnectColors.light_grey,
                ),
              )
            : null,
      ),
    );
  }

  bool isValidValue(v) => widget.options.contains(v);

  DropdownMenuItem<String> itemWidget(String item, BuildContext context) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(
        item,
        style: EduconnectConstants.text_theme.labelMedium!.copyWith(
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: EduconnectColors.blue,
        ),
      ),
    );
  }
}
