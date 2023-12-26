part of '../educonnect_button.dart';

//elevated button with text only
class _ElevatedButtonWidget extends StatelessWidget {
  final MawjoodElevatedButton educonnectElevatedButton;
  const _ElevatedButtonWidget({
    required this.educonnectElevatedButton,
  });

  @override
  Widget build(BuildContext context) {
    //switch colors for the button
    final Color buttonColor = educonnectElevatedButton.isLightMode
        ? MawjoodColors.white // Background color in light mode
        : MawjoodColors.secondaryColor; // Background color in dark mode

    final Color textColor = educonnectElevatedButton.isLightMode
        ? MawjoodColors.secondaryColor
        : MawjoodColors.white; // Text color

    final Color borderColor = educonnectElevatedButton.isLightMode
        ? textColor
        : MawjoodColors.transparent; // Border color

    return ElevatedButton(
      onPressed: educonnectElevatedButton.onPressed,
      style: ElevatedButton.styleFrom(
        padding: educonnectElevatedButton.textPadding,
        foregroundColor: textColor,
        backgroundColor: buttonColor,
        surfaceTintColor: buttonColor,
        alignment: Alignment.center,
        minimumSize: Size(
          educonnectElevatedButton.width ?? double.infinity,
          educonnectElevatedButton.height ??
              EduConnectConstants.educonnect_button_height,
        ),
        shape: educonnectElevatedButton.shape ??
            RoundedRectangleBorder(
              borderRadius: educonnectElevatedButton.hasRoundedCorners
                  ? BorderRadius.circular(
                      EduConnectConstants.educonnect_button_radius)
                  : BorderRadius.zero,
              side: BorderSide(
                color: borderColor,
              ),
            ),
      ),
      child: Text(
        educonnectElevatedButton.text,
        style: educonnectElevatedButton.textStyle ??
            TextStyle(
              fontSize: 10.sp,
              // fontWeight: FontWeight.w600,
              color: textColor,
            ),
        // EduConnectConstants.text_theme.bodyLarge!.copyWith(color: textColor),
      ),
    );
  }
}
