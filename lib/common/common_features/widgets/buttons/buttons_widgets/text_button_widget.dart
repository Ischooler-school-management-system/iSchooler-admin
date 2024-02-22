part of '../educonnect_button.dart';

//text button either with or without leading text
class _TextButtonWidget extends StatelessWidget {
  final IschoolerTextButton educonnectTextButton;
  const _TextButtonWidget({
    required this.educonnectTextButton,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        padding: EdgeInsets.zero,
      ),
      onPressed: educonnectTextButton.onPressed,
      child: (educonnectTextButton.leadingText != null)
          ? childWithLeadingText()
          : educonnectTextButton.widget != null
              ? childWithWidget()
              : buttonText(),
    );
  }

  Text buttonText() {
    return Text(
      educonnectTextButton.textButton,
      style: educonnectTextButton.style ?? buttonTextStyle(),
    );
  }

  SizedBox childWithLeadingText() {
    return SizedBox(
      width: IschoolerConstants.educonnect_screen_width / 1.3,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "${educonnectTextButton.leadingText!} ",
          style:
              educonnectTextButton.style ?? IschoolerTextStyles.styleBlackW500,
          children: [
            TextSpan(
              text: educonnectTextButton.textButton,
              style: educonnectTextButton.style ?? buttonTextStyle(),
            ),
          ],
        ),
        maxLines: 2, // Set the maximum number of lines
        overflow: TextOverflow.visible, // Set the overflow behavior
      ),
    );
  }

  TextStyle buttonTextStyle() {
    return IschoolerTextStyles.style14BlueW500.copyWith(
      decoration: educonnectTextButton.hasUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: IschoolerColors.primaryColor,
    );
    /* TextStyle(
      decoration: educonnectTextButton.hasUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: IschoolerColors.primaryColor,
      color: IschoolerColors.primaryColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ); */
  }

  Row childWithWidget() {
    return Row(
      children: [
        buttonText(),
        Row(
          children: [SizedBox(width: 3.w), educonnectTextButton.widget!],
        ),
      ],
    );
  }
}
