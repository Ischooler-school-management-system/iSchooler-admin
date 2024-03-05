part of '../ischooler_button.dart';

//elevated button with text only
class _ElevatedButtonWidget extends StatelessWidget {
  final IschoolerElevatedButton ischoolerElevatedButton;
  const _ElevatedButtonWidget({
    required this.ischoolerElevatedButton,
  });

  @override
  Widget build(BuildContext context) {
    //switch colors for the button
    final Color buttonColor = ischoolerElevatedButton.isLightMode
        ? IschoolerColors.light_grey // Background color in light mode
        : IschoolerColors.secondaryColor; // Background color in dark mode

    final Color textColor = ischoolerElevatedButton.isLightMode
        ? IschoolerColors.secondaryColor
        : IschoolerColors.light_grey; // Text color

    final Color borderColor = ischoolerElevatedButton.isLightMode
        ? textColor
        : IschoolerColors.transparent; // Border color

    return ElevatedButton(
      onPressed: ischoolerElevatedButton.disabled
          ? null
          : ischoolerElevatedButton.onPressed,
      style: buttonStyle(textColor, buttonColor, borderColor),
      child: Text(ischoolerElevatedButton.text,
          style: ischoolerElevatedButton.textStyle ??
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
      padding: ischoolerElevatedButton.textPadding,
      foregroundColor: textColor,
      backgroundColor: buttonColor,
      surfaceTintColor: buttonColor,
      alignment: Alignment.center,
      minimumSize: Size(
        ischoolerElevatedButton.width ?? double.infinity,
        ischoolerElevatedButton.height ??
            IschoolerConstants.ischooler_button_height,
      ),
      shape: ischoolerElevatedButton.shape ??
          RoundedRectangleBorder(
            borderRadius: ischoolerElevatedButton.hasRoundedCorners
                ? BorderRadius.circular(
                    IschoolerConstants.ischooler_button_radius)
                : BorderRadius.zero,
            side: BorderSide(
              color: borderColor,
            ),
          ),
    );
  }
}
