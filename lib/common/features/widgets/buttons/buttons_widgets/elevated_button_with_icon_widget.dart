part of '../mawjood_button.dart';

//elevated button with text and icon
//the icon either at the beginning or the end of the button

class _ElevatedButtonWithIconWidget extends StatelessWidget {
  final MawjoodElevatedButtonWithIcon mawjoodElevatedButtonWithIcon;
  const _ElevatedButtonWithIconWidget({
    required this.mawjoodElevatedButtonWithIcon,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = mawjoodElevatedButtonWithIcon.isLightMode
        ? MawjoodColors.white // Background color in light mode
        : MawjoodColors.secondaryColor; // Background color in dark mode

    final Color textColor = mawjoodElevatedButtonWithIcon.isLightMode
        ? MawjoodColors.secondaryColor
        : MawjoodColors.white; // Text color

    final Color borderColor = mawjoodElevatedButtonWithIcon.isLightMode
        ? textColor
        : MawjoodColors.transparent; // Border color

    return mawjoodElevatedButtonWithIcon.leftIcon
        ? buttonWithLeftIcon(buttonColor, borderColor, textColor)
        : buttonWithRightIcon(buttonColor, borderColor, textColor);
  }

  ElevatedButton buttonWithLeftIcon(
      Color? buttonColor, Color? borderColor, Color? textColor) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(3.h),
      foregroundColor: textColor,
      backgroundColor: buttonColor,
      surfaceTintColor: buttonColor,
      fixedSize: Size(205.w, 44.h),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MawjoodConstants.mawjood_button_radius),
        side: BorderSide(
          color: borderColor!,
        ),
      ),
    );

    return ElevatedButton(
      style: buttonStyle,
      onPressed: mawjoodElevatedButtonWithIcon.onPressed,
      //first row to make the sized box at the end of the button
      child: Stack(
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //sized box to take width so the text will be in the center

          Text(
            mawjoodElevatedButtonWithIcon.text,
            style: MawjoodConstants.text_theme.bodyLarge!
                .copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),

          Align(
            alignment: MawjoodConstants.isCurrentLocaleArabic()
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MawjoodConstants.mawjood_button_radius),
                // gradient: LinearGradient(colors: [
                //   MawjoodColors.white.withOpacity(0),
                //   MawjoodColors.white.withOpacity(0.1),
                //   MawjoodColors.white.withOpacity(0.2),
                //   MawjoodColors.white.withOpacity(0.4),
                // ])
              ),
              child: mawjoodElevatedButtonWithIcon.icon,
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton buttonWithRightIcon(
      Color? buttonColor, Color? borderColor, Color? textColor) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        //alignment: Alignment.centerLeft,
        foregroundColor: textColor,
        backgroundColor: buttonColor,
        surfaceTintColor: buttonColor,
        minimumSize:
            Size(double.infinity, MawjoodConstants.mawjood_button_height),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(MawjoodConstants.mawjood_button_radius),
          side: BorderSide(
            color: borderColor!,
          ),
        ),
      ),
      onPressed: mawjoodElevatedButtonWithIcon.onPressed,
      icon: mawjoodElevatedButtonWithIcon.icon,
      label: Text(
        mawjoodElevatedButtonWithIcon.text,
        style:
            MawjoodConstants.text_theme.bodyLarge!.copyWith(color: textColor),
      ),
    );
  }
}
