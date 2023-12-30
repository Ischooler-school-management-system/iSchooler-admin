import 'package:flutter/material.dart';

import '../../educonnect_constants.dart';
import '../../style/educonnect_colors.dart';

class EduconnectCheckbox extends StatefulWidget {
  final String text;
  final String? subtitle;
  final Function(bool)? onChanged;
  final TextStyle? subtitleStyle;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final bool isToggle;

  const EduconnectCheckbox({
    super.key,
    required this.text,
    this.subtitle,
    required this.onChanged,
    this.subtitleStyle,
    this.padding,
    this.textStyle,
    this.isToggle = false,
  });

  @override
  State<EduconnectCheckbox> createState() => _EduconnectCheckboxState();
}

class _EduconnectCheckboxState extends State<EduconnectCheckbox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onIconTap();
      },
      child: Container(
        alignment: Alignment.center,
        padding: widget.padding ?? const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              decideIcon(),
              size: EduconnectConstants.educonnect_screen_height / 35,
              color: EduconnectColors.blue,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                widget.text,
                style: widget.textStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (widget.subtitle != null) const Spacer(),
            if (widget.subtitle != null)
              Text(
                widget.subtitle!,
                style: widget.subtitleStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
          ],
        ),
      ),
    );
  }

  IconData decideIcon() {
    if (isSelected) {
      if (widget.isToggle) {
        return Icons.remove;
      } else {
        return Icons.check_box_outlined;
      }
    } else {
      if (widget.isToggle) {
        return Icons.add;
      } else {
        return Icons.check_box_outline_blank_sharp;
      }
    }
  }

  void onIconTap() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onChanged?.call(isSelected);
  }
}
