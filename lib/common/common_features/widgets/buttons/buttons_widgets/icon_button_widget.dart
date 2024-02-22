part of '../educonnect_button.dart';

//button with icon only
class _IconButtonWidget extends StatelessWidget {
  final IschoolerIconButton educonnectIconButton;
  const _IconButtonWidget({
    required this.educonnectIconButton,
  });
  @override
  Widget build(BuildContext context) {
    final Color buttonColor = educonnectIconButton.isLightMode
        ? IschoolerColors.white // Background color in light mode
        : IschoolerColors.secondaryColor; // Background color in dark mode

    final Color textColor = educonnectIconButton.isLightMode
        ? IschoolerColors.secondaryColor
        : IschoolerColors.white; // Text color

    final Color borderColor = educonnectIconButton.isLightMode
        ? textColor
        : IschoolerColors.transparent; // Border color

    CircleBorder? shape2;
    if (educonnectIconButton.hasBorder) {
      shape2 = CircleBorder(
        side: BorderSide(
          color: borderColor,
        ),
      );
    } else if (educonnectIconButton.isContainer) {
      const ContinuousRectangleBorder();
    } else {
      shape2 = null;
    }
    return IconButton(
      style: IconButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: educonnectIconButton.isContainer
            ? null
            : educonnectIconButton.color ?? buttonColor,
        surfaceTintColor: educonnectIconButton.isContainer
            ? null
            : educonnectIconButton.color ?? buttonColor,
        padding: educonnectIconButton.isContainer ? EdgeInsets.zero : null,
        minimumSize: educonnectIconButton.isContainer
            ? null
            : Size(
                educonnectIconButton.width ??
                    IschoolerConstants.educonnect_button_height,
                educonnectIconButton.height ??
                    IschoolerConstants.educonnect_button_height,
              ),
        shape: shape2,
      ),
      onPressed: educonnectIconButton.onPressed,
      icon: educonnectIconButton.icon,
    );
  }
}
//elevated button with text and icon
//the icon either at the beginning or the end of the button
