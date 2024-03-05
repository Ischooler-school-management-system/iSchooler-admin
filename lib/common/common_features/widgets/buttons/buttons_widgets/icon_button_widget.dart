part of '../ischooler_button.dart';

//button with icon only
class _IconButtonWidget extends StatelessWidget {
  final IschoolerIconButton ischoolerIconButton;
  const _IconButtonWidget({
    required this.ischoolerIconButton,
  });
  @override
  Widget build(BuildContext context) {
    final Color buttonColor = ischoolerIconButton.isLightMode
        ? IschoolerColors.white // Background color in light mode
        : IschoolerColors.secondaryColor; // Background color in dark mode

    final Color textColor = ischoolerIconButton.isLightMode
        ? IschoolerColors.secondaryColor
        : IschoolerColors.white; // Text color

    final Color borderColor = ischoolerIconButton.isLightMode
        ? textColor
        : IschoolerColors.transparent; // Border color

    CircleBorder? shape2;
    if (ischoolerIconButton.hasBorder) {
      shape2 = CircleBorder(
        side: BorderSide(
          color: borderColor,
        ),
      );
    } else if (ischoolerIconButton.isContainer) {
      const ContinuousRectangleBorder();
    } else {
      shape2 = null;
    }
    return IconButton(
      style: IconButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: ischoolerIconButton.isContainer
            ? null
            : ischoolerIconButton.color ?? buttonColor,
        surfaceTintColor: ischoolerIconButton.isContainer
            ? null
            : ischoolerIconButton.color ?? buttonColor,
        padding: ischoolerIconButton.isContainer ? EdgeInsets.zero : null,
        minimumSize: ischoolerIconButton.isContainer
            ? null
            : Size(
                ischoolerIconButton.width ??
                    IschoolerConstants.ischooler_button_height,
                ischoolerIconButton.height ??
                    IschoolerConstants.ischooler_button_height,
              ),
        shape: shape2,
      ),
      onPressed: ischoolerIconButton.onPressed,
      icon: ischoolerIconButton.icon,
    );
  }
}
//elevated button with text and icon
//the icon either at the beginning or the end of the button
