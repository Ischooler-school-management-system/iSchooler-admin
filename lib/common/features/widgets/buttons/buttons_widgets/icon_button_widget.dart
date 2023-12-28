part of '../educonnect_button.dart';

//button with icon only
class _IconButtonWidget extends StatelessWidget {
  final EduconnectIconButton educonnectIconButton;
  const _IconButtonWidget({
    required this.educonnectIconButton,
  });
  @override
  Widget build(BuildContext context) {
    final Color buttonColor = educonnectIconButton.isLightMode
        ? EduConnectColors.white // Background color in light mode
        : EduConnectColors.secondaryColor; // Background color in dark mode

    final Color textColor = educonnectIconButton.isLightMode
        ? EduConnectColors.secondaryColor
        : EduConnectColors.white; // Text color

    final Color borderColor = educonnectIconButton.isLightMode
        ? textColor
        : EduConnectColors.transparent; // Border color

    return IconButton(
      style: IconButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: educonnectIconButton.color ?? buttonColor,
          surfaceTintColor: educonnectIconButton.color ?? buttonColor,
          minimumSize: Size(
            educonnectIconButton.width ?? EduConnectConstants.educonnect_button_height,
            educonnectIconButton.height ?? EduConnectConstants.educonnect_button_height,
          ),
          shape: educonnectIconButton.hasBorder
              ? CircleBorder(
                  side: BorderSide(
                    color: borderColor,
                  ),
                )
              : null),
      onPressed: educonnectIconButton.onPressed,
      icon: educonnectIconButton.icon,
    );
  }
}
//elevated button with text and icon
//the icon either at the beginning or the end of the button
