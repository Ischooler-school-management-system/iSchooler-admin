part of '../ischooler_button.dart';

//elevated button with text only
class _ElevatedButtonWidget extends StatelessWidget {
  final IschoolerElevatedButton educonnectElevatedButton;
  const _ElevatedButtonWidget({
    required this.educonnectElevatedButton,
  });

  @override
  Widget build(BuildContext context) {
    //switch colors for the button
    final Color buttonColor = educonnectElevatedButton.isLightMode
        ? IschoolerColors.light_grey // Background color in light mode
        : IschoolerColors.secondaryColor; // Background color in dark mode

    final Color textColor = educonnectElevatedButton.isLightMode
        ? IschoolerColors.secondaryColor
        : IschoolerColors.light_grey; // Text color

    final Color borderColor = educonnectElevatedButton.isLightMode
        ? textColor
        : IschoolerColors.transparent; // Border color

    return ElevatedButton(
      onPressed: educonnectElevatedButton.disabled
          ? null
          : educonnectElevatedButton.onPressed,
      style: buttonStyle(textColor, buttonColor, borderColor),
      child: Text(educonnectElevatedButton.text,
          style: educonnectElevatedButton.textStyle ??
              IschoolerTextStyles.style16.copyWith(color: textColor)
          /*  TextStyle(
              fontSize: IschoolerTextStyles.font14,
              // fontWeight: FontWeight.w600,
              color: textColor,
            ), */

          // IschoolerConstants.text_theme.bodyLarge!.copyWith(color: textColor),
          ),
    );
  }

  ButtonStyle buttonStyle(
      Color textColor, Color buttonColor, Color borderColor) {
    return ElevatedButton.styleFrom(
      padding: educonnectElevatedButton.textPadding,
      foregroundColor: textColor,
      backgroundColor: buttonColor,
      surfaceTintColor: buttonColor,
      alignment: Alignment.center,
      minimumSize: Size(
        educonnectElevatedButton.width ?? double.infinity,
        educonnectElevatedButton.height ??
            IschoolerConstants.educonnect_button_height,
      ),
      shape: educonnectElevatedButton.shape ??
          RoundedRectangleBorder(
            borderRadius: educonnectElevatedButton.hasRoundedCorners
                ? BorderRadius.circular(
                    IschoolerConstants.educonnect_button_radius)
                : BorderRadius.zero,
            side: BorderSide(
              color: borderColor,
            ),
          ),
    );
  }
}
