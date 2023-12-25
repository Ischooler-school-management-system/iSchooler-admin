part of '../mawjood_button.dart';

//elevated button with text only
class _ElevatedButtonWidget extends StatelessWidget {
  final MawjoodElevatedButton mawjoodElevatedButton;
  const _ElevatedButtonWidget({
    required this.mawjoodElevatedButton,
  });

  @override
  Widget build(BuildContext context) {
    //switch colors for the button
    final Color buttonColor = mawjoodElevatedButton.isLightMode
        ? MawjoodColors.white // Background color in light mode
        : MawjoodColors.secondaryColor; // Background color in dark mode

    final Color textColor = mawjoodElevatedButton.isLightMode
        ? MawjoodColors.secondaryColor
        : MawjoodColors.white; // Text color

    final Color borderColor = mawjoodElevatedButton.isLightMode
        ? textColor
        : MawjoodColors.transparent; // Border color

    return ElevatedButton(
      onPressed: mawjoodElevatedButton.onPressed,
      style: ElevatedButton.styleFrom(
        padding: mawjoodElevatedButton.textPadding,
        foregroundColor: textColor,
        backgroundColor: buttonColor,
        surfaceTintColor: buttonColor,
        alignment: Alignment.center,
        minimumSize: Size(
          mawjoodElevatedButton.width ?? double.infinity,
          mawjoodElevatedButton.height ??
              EduConnectConstants.mawjood_button_height,
        ),
        shape: mawjoodElevatedButton.shape ??
            RoundedRectangleBorder(
              borderRadius: mawjoodElevatedButton.hasRoundedCorners
                  ? BorderRadius.circular(
                      EduConnectConstants.mawjood_button_radius)
                  : BorderRadius.zero,
              side: BorderSide(
                color: borderColor,
              ),
            ),
      ),
      child: Text(
        mawjoodElevatedButton.text,
        style: mawjoodElevatedButton.textStyle ??
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
