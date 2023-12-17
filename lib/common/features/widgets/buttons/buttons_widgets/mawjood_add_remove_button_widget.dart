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
            height: MawjoodConstants.mawjood_screen_height / 30,
            width: MawjoodConstants.mawjood_screen_width / 30,
            onPressed: mawjoodAddRemoveButton.addButtonFunction,
            icon: Icon(Icons.add,
                size: MawjoodConstants.isTablet
                    ? MawjoodConstants.mawjood_screen_height / 25
                    : MawjoodConstants.mawjood_screen_height / 35),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            width: MawjoodConstants.isTablet ? 50 : 25,
            height: MawjoodConstants.isTablet ? 50 : 25,
            child: FittedBox(
              child: Text(
                '${mawjoodAddRemoveButton.count}',
                style: MawjoodConstants.text_theme.displaySmall!.copyWith(
                  color: MawjoodColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        MawjoodButton(
          button: MawjoodIconButton(
            height: MawjoodConstants.mawjood_screen_height / 30,
            width: MawjoodConstants.mawjood_screen_width / 30,
            onPressed: mawjoodAddRemoveButton.subtractButtonFunction,
            icon: Icon(Icons.remove,
                size: MawjoodConstants.isTablet
                    ? MawjoodConstants.mawjood_screen_height / 25
                    : MawjoodConstants.mawjood_screen_height / 35),
          ),
        ),
      ],
    );
  }
}