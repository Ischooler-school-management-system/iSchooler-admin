part of '../educonnect_button.dart';

class _EduconnectAddRemoveButtonWidget extends StatelessWidget {
  final EduconnectAddRemoveButton educonnectAddRemoveButton;

  const _EduconnectAddRemoveButtonWidget(
      {required this.educonnectAddRemoveButton});
  //int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EduconnectButton(
          button: EduconnectIconButton(
            height: EduconnectConstants.educonnect_screen_height / 30,
            width: EduconnectConstants.educonnect_screen_width / 30,
            onPressed: educonnectAddRemoveButton.addButtonFunction,
            icon: Icon(Icons.add,
                size: EduconnectConstants.isTablet
                    ? EduconnectConstants.educonnect_screen_height / 25
                    : EduconnectConstants.educonnect_screen_height / 35),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            width: EduconnectConstants.isTablet ? 50 : 25,
            height: EduconnectConstants.isTablet ? 50 : 25,
            child: FittedBox(
              child: Text(
                '${educonnectAddRemoveButton.count}',
                style: EduconnectConstants.textTheme.displaySmall!.copyWith(
                  color: EduconnectColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        EduconnectButton(
          button: EduconnectIconButton(
            height: EduconnectConstants.educonnect_screen_height / 30,
            width: EduconnectConstants.educonnect_screen_width / 30,
            onPressed: educonnectAddRemoveButton.subtractButtonFunction,
            icon: Icon(Icons.remove,
                size: EduconnectConstants.isTablet
                    ? EduconnectConstants.educonnect_screen_height / 25
                    : EduconnectConstants.educonnect_screen_height / 35),
          ),
        ),
      ],
    );
  }
}
