part of '../ischooler_button.dart';

//elevated button with text and icon
//the icon either at the beginning or the end of the button

class _ElevatedButtonWithIconWidget extends StatelessWidget {
  final IschoolerElevatedButtonWithIcon ischoolerElevatedButtonWithIcon;
  const _ElevatedButtonWithIconWidget({
    required this.ischoolerElevatedButtonWithIcon,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = ischoolerElevatedButtonWithIcon.isLightMode
        ? IschoolerColors.white // Background color in light mode
        : IschoolerColors.secondaryColor; // Background color in dark mode

    final Color textColor = ischoolerElevatedButtonWithIcon.isLightMode
        ? IschoolerColors.secondaryColor
        : IschoolerColors.white; // Text color

    final Color borderColor = ischoolerElevatedButtonWithIcon.isLightMode
        ? textColor
        : IschoolerColors.transparent; // Border color

    return ischoolerElevatedButtonWithIcon.leftIcon
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
            BorderRadius.circular(IschoolerConstants.ischooler_button_radius),
        side: BorderSide(
          color: borderColor!,
        ),
      ),
    );

    return ElevatedButton(
      style: buttonStyle,
      onPressed: ischoolerElevatedButtonWithIcon.onPressed,
      //first row to make the sized box at the end of the button
      child: Stack(
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //sized box to take width so the text will be in the center

          Text(
            ischoolerElevatedButtonWithIcon.text,
            style: IschoolerConstants.textTheme.bodyLarge!
                .copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),

          Align(
            alignment: IschoolerConstants.isCurrentLocaleArabic()
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    IschoolerConstants.ischooler_button_radius),
                // gradient: LinearGradient(colors: [
                //   IschoolerColors.white.withOpacity(0),
                //   IschoolerColors.white.withOpacity(0.1),
                //   IschoolerColors.white.withOpacity(0.2),
                //   IschoolerColors.white.withOpacity(0.4),
                // ])
              ),
              child: ischoolerElevatedButtonWithIcon.icon,
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
            Size(double.infinity, IschoolerConstants.ischooler_button_height),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(IschoolerConstants.ischooler_button_radius),
          side: BorderSide(
            color: borderColor!,
          ),
        ),
      ),
      onPressed: ischoolerElevatedButtonWithIcon.onPressed,
      icon: ischoolerElevatedButtonWithIcon.icon,
      label: Text(
        ischoolerElevatedButtonWithIcon.text,
        style:
            IschoolerConstants.textTheme.bodyLarge!.copyWith(color: textColor),
      ),
    );
  }
}
