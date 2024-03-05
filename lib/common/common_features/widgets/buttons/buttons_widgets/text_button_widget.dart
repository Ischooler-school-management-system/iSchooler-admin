part of '../ischooler_button.dart';

//text button either with or without leading text
class _TextButtonWidget extends StatelessWidget {
  final IschoolerTextButton ischoolerTextButton;
  const _TextButtonWidget({
    required this.ischoolerTextButton,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        padding: EdgeInsets.zero,
      ),
      onPressed: ischoolerTextButton.onPressed,
      child: (ischoolerTextButton.leadingText != null)
          ? childWithLeadingText()
          : ischoolerTextButton.widget != null
              ? childWithWidget()
              : buttonText(),
    );
  }

  Text buttonText() {
    return Text(
      ischoolerTextButton.textButton,
      style: ischoolerTextButton.style ?? buttonTextStyle(),
    );
  }

  SizedBox childWithLeadingText() {
    return SizedBox(
      width: IschoolerConstants.ischooler_screen_width / 1.3,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "${ischoolerTextButton.leadingText!} ",
          style:
              ischoolerTextButton.style ?? IschoolerTextStyles.styleBlackW500,
          children: [
            TextSpan(
              text: ischoolerTextButton.textButton,
              style: ischoolerTextButton.style ?? buttonTextStyle(),
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
      decoration: ischoolerTextButton.hasUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: IschoolerColors.primaryColor,
    );
    /* TextStyle(
      decoration: ischoolerTextButton.hasUnderline
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
          children: [SizedBox(width: 3.w), ischoolerTextButton.widget!],
        ),
      ],
    );
  }
}
