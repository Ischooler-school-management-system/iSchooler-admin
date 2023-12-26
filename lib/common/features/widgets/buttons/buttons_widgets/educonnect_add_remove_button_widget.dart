part of '../educonnect_button.dart';
class _MawjoodAddRemoveButtonWidget extends StatelessWidget {
  final MawjoodAddRemoveButton educonnectAddRemoveButton;

  const _MawjoodAddRemoveButtonWidget({required this.educonnectAddRemoveButton});
  //int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MawjoodButton(
          button: MawjoodIconButton(
            height: EduConnectConstants.educonnect_screen_height / 30,
            width: EduConnectConstants.educonnect_screen_width / 30,
            onPressed: educonnectAddRemoveButton.addButtonFunction,
            icon: Icon(Icons.add,
                size: EduConnectConstants.isTablet
                    ? EduConnectConstants.educonnect_screen_height / 25
                    : EduConnectConstants.educonnect_screen_height / 35),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            width: EduConnectConstants.isTablet ? 50 : 25,
            height: EduConnectConstants.isTablet ? 50 : 25,
            child: FittedBox(
              child: Text(
                '${educonnectAddRemoveButton.count}',
                style: EduConnectConstants.text_theme.displaySmall!.copyWith(
                  color: EduConnectColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        MawjoodButton(
          button: MawjoodIconButton(
            height: EduConnectConstants.educonnect_screen_height / 30,
            width: EduConnectConstants.educonnect_screen_width / 30,
            onPressed: educonnectAddRemoveButton.subtractButtonFunction,
            icon: Icon(Icons.remove,
                size: EduConnectConstants.isTablet
                    ? EduConnectConstants.educonnect_screen_height / 25
                    : EduConnectConstants.educonnect_screen_height / 35),
          ),
        ),
      ],
    );
  }
}