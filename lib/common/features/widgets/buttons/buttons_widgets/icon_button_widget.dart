part of '../mawjood_button.dart';

//button with icon only
class _IconButtonWidget extends StatelessWidget {
  final MawjoodIconButton mawjoodIconButton;
  const _IconButtonWidget({
    required this.mawjoodIconButton,
  });
  @override
  Widget build(BuildContext context) {
    final Color buttonColor = mawjoodIconButton.isLightMode
        ? MawjoodColors.white // Background color in light mode
        : MawjoodColors.secondaryColor; // Background color in dark mode

    final Color textColor = mawjoodIconButton.isLightMode
        ? MawjoodColors.secondaryColor
        : MawjoodColors.white; // Text color

    final Color borderColor = mawjoodIconButton.isLightMode
        ? textColor
        : MawjoodColors.transparent; // Border color

    return IconButton(
      style: IconButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: mawjoodIconButton.color ?? buttonColor,
          surfaceTintColor: mawjoodIconButton.color ?? buttonColor,
          minimumSize: Size(
            mawjoodIconButton.width ?? MawjoodConstants.mawjood_button_height,
            mawjoodIconButton.height ?? MawjoodConstants.mawjood_button_height,
          ),
          shape: mawjoodIconButton.hasBorder
              ? CircleBorder(
                  side: BorderSide(
                    color: borderColor,
                  ),
                )
              : null),
      onPressed: mawjoodIconButton.onPressed,
      icon: mawjoodIconButton.icon,
    );
  }
}
//elevated button with text and icon
//the icon either at the beginning or the end of the button
