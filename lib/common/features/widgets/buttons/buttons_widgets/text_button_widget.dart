part of '../mawjood_button.dart';

//text button either with or without leading text
class _TextButtonWidget extends StatelessWidget {
  final MawjoodTextButton mawjoodTextButton;
  const _TextButtonWidget({
    required this.mawjoodTextButton,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        padding: EdgeInsets.zero,
      ),
      onPressed: mawjoodTextButton.onPressed,
      child: (mawjoodTextButton.leadingText != null)
          ? SizedBox(
              width: MawjoodConstants.mawjood_screen_width / 1.3,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "${mawjoodTextButton.leadingText!} ",
                  style: mawjoodTextButton.style ??
                      MawjoodConstants.text_theme.bodyMedium!
                          .copyWith(color: MawjoodColors.grey),
                  children: [
                    TextSpan(
                      text: mawjoodTextButton.textButton,
                      style: mawjoodTextButton.style ??
                          MawjoodConstants.text_theme.bodyMedium!.copyWith(
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
          : mawjoodTextButton.widget != null
              ? Row(
                  children: [
                    Text(
                      mawjoodTextButton.textButton,
                      style: mawjoodTextButton.style ??
                          MawjoodConstants.text_theme.bodyMedium!.copyWith(
                            // decoration: mawjoodTextButton.hasUnderline
                            //     ? TextDecoration.underline
                            //     : TextDecoration.none,
                            decorationColor:
                                mawjoodTextButton.color ?? MawjoodColors.primaryColor,
                            color:
                                mawjoodTextButton.color ?? MawjoodColors.black,
                          ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 3.w),
                        mawjoodTextButton.widget!
                      ],
                    ),
                  ],
                )
              : Text(
                  mawjoodTextButton.textButton,
                  style: mawjoodTextButton.style ??
                      MawjoodConstants.text_theme.bodyMedium!.copyWith(
                        // decoration: mawjoodTextButton.hasUnderline
                        //     ? TextDecoration.underline
                        //     : TextDecoration.none,
                        decorationColor:
                            mawjoodTextButton.color ?? MawjoodColors.primaryColor,
                        color: mawjoodTextButton.color ?? MawjoodColors.black,
                      ),
                ),
    );
  }
}
