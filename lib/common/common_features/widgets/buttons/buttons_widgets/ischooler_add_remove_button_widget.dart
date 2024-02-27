part of '../ischooler_button.dart';

class _IschoolerAddRemoveButtonWidget extends StatelessWidget {
  final IschoolerAddRemoveButton educonnectAddRemoveButton;

  const _IschoolerAddRemoveButtonWidget(
      {required this.educonnectAddRemoveButton});
  //int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IschoolerButton(
          button: IschoolerIconButton(
            height: IschoolerConstants.educonnect_screen_height / 30,
            width: IschoolerConstants.educonnect_screen_width / 30,
            onPressed: educonnectAddRemoveButton.addButtonFunction,
            icon: Icon(Icons.add,
                size: IschoolerConstants.isTablet
                    ? IschoolerConstants.educonnect_screen_height / 25
                    : IschoolerConstants.educonnect_screen_height / 35),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            width: IschoolerConstants.isTablet ? 50 : 25,
            height: IschoolerConstants.isTablet ? 50 : 25,
            child: FittedBox(
              child: Text(
                '${educonnectAddRemoveButton.count}',
                style: IschoolerConstants.textTheme.displaySmall!.copyWith(
                  color: IschoolerColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        IschoolerButton(
          button: IschoolerIconButton(
            height: IschoolerConstants.educonnect_screen_height / 30,
            width: IschoolerConstants.educonnect_screen_width / 30,
            onPressed: educonnectAddRemoveButton.subtractButtonFunction,
            icon: Icon(Icons.remove,
                size: IschoolerConstants.isTablet
                    ? IschoolerConstants.educonnect_screen_height / 25
                    : IschoolerConstants.educonnect_screen_height / 35),
          ),
        ),
      ],
    );
  }
}
