part of '../mawjood_button.dart';
class _MawjoodAddRemoveButtonWidget extends StatelessWidget {
  final MawjoodAddRemoveButton mawjoodAddRemoveButton;

  const _MawjoodAddRemoveButtonWidget({required this.mawjoodAddRemoveButton});
  //int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MawjoodButton(
          button: MawjoodIconButton(
            height: EduConnectConstants.mawjood_screen_height / 30,
            width: EduConnectConstants.mawjood_screen_width / 30,
            onPressed: mawjoodAddRemoveButton.addButtonFunction,
            icon: Icon(Icons.add,
                size: EduConnectConstants.isTablet
                    ? EduConnectConstants.mawjood_screen_height / 25
                    : EduConnectConstants.mawjood_screen_height / 35),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            width: EduConnectConstants.isTablet ? 50 : 25,
            height: EduConnectConstants.isTablet ? 50 : 25,
            child: FittedBox(
              child: Text(
                '${mawjoodAddRemoveButton.count}',
                style: EduConnectConstants.text_theme.displaySmall!.copyWith(
                  color: MawjoodColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        MawjoodButton(
          button: MawjoodIconButton(
            height: EduConnectConstants.mawjood_screen_height / 30,
            width: EduConnectConstants.mawjood_screen_width / 30,
            onPressed: mawjoodAddRemoveButton.subtractButtonFunction,
            icon: Icon(Icons.remove,
                size: EduConnectConstants.isTablet
                    ? EduConnectConstants.mawjood_screen_height / 25
                    : EduConnectConstants.mawjood_screen_height / 35),
          ),
        ),
      ],
    );
  }
}