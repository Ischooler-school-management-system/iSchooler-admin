part of '../educonnect_button.dart';

//text button either with or without leading text
class _TextButtonWidget extends StatelessWidget {
  final MawjoodTextButton educonnectTextButton;
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
          ? SizedBox(
              width: EduConnectConstants.educonnect_screen_width / 1.3,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "${educonnectTextButton.leadingText!} ",
                  style: educonnectTextButton.style ??
                      EduConnectConstants.text_theme.bodyMedium!
                          .copyWith(color: MawjoodColors.grey),
                  children: [
                    TextSpan(
                      text: educonnectTextButton.textButton,
                      style: educonnectTextButton.style ??
                          EduConnectConstants.text_theme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: MawjoodColors.primaryColor,
                          ),
                    ),
                  ],
                ),
                maxLines: 2, // Set the maximum number of lines
                overflow: TextOverflow.visible, // Set the overflow behavior
              ),
            )
          : educonnectTextButton.widget != null
              ? Row(
                  children: [
                    Text(
                      educonnectTextButton.textButton,
                      style: educonnectTextButton.style ??
                          EduConnectConstants.text_theme.bodyMedium!.copyWith(
                            // decoration: educonnectTextButton.hasUnderline
                            //     ? TextDecoration.underline
                            //     : TextDecoration.none,
                            decorationColor:
                                educonnectTextButton.color ?? MawjoodColors.primaryColor,
                            color:
                                educonnectTextButton.color ?? MawjoodColors.black,
                          ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 3.w),
                        educonnectTextButton.widget!
                      ],
                    ),
                  ],
                )
              : Text(
                  educonnectTextButton.textButton,
                  style: educonnectTextButton.style ??
                      EduConnectConstants.text_theme.bodyMedium!.copyWith(
                        // decoration: educonnectTextButton.hasUnderline
                        //     ? TextDecoration.underline
                        //     : TextDecoration.none,
                        decorationColor:
                            educonnectTextButton.color ?? MawjoodColors.primaryColor,
                        color: educonnectTextButton.color ?? MawjoodColors.black,
                      ),
                ),
    );
  }
}
