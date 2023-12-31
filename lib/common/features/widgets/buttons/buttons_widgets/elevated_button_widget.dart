part of '../educonnect_button.dart';

//elevated button with text only
class _ElevatedButtonWidget extends StatelessWidget {
  final EduconnectElevatedButton educonnectElevatedButton;
  const _ElevatedButtonWidget({
    required this.educonnectElevatedButton,
  });

  @override
  Widget build(BuildContext context) {
    //switch colors for the button
    final Color buttonColor = educonnectElevatedButton.isLightMode
        ? EduconnectColors.light_grey // Background color in light mode
        : EduconnectColors.secondaryColor; // Background color in dark mode

    final Color textColor = educonnectElevatedButton.isLightMode
        ? EduconnectColors.secondaryColor
        : EduconnectColors.light_grey; // Text color

    final Color borderColor = educonnectElevatedButton.isLightMode
        ? textColor
        : EduconnectColors.transparent; // Border color

    return ElevatedButton(
      onPressed: educonnectElevatedButton.disabled
          ? null
          : educonnectElevatedButton.onPressed,
      style: buttonStyle(textColor, buttonColor, borderColor),
      child: Text(educonnectElevatedButton.text,
          style: educonnectElevatedButton.textStyle ??
              EduconnectTextStyles.style16.copyWith(color: textColor)
          /*  TextStyle(
              fontSize: EduconnectTextStyles.font14,
              // fontWeight: FontWeight.w600,
              color: textColor,
            ), */

          // EduconnectConstants.text_theme.bodyLarge!.copyWith(color: textColor),
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
            EduconnectConstants.educonnect_button_height,
      ),
      shape: educonnectElevatedButton.shape ??
          RoundedRectangleBorder(
            borderRadius: educonnectElevatedButton.hasRoundedCorners
                ? BorderRadius.circular(
                    EduconnectConstants.educonnect_button_radius)
                : BorderRadius.zero,
            side: BorderSide(
              color: borderColor,
            ),
          ),
    );
  }
}
