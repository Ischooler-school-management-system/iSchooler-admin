part of '../ischooler_button.dart';

class _IschoolerAddRemoveButtonWidget extends StatelessWidget {
  final IschoolerAddRemoveButton ischoolerAddRemoveButton;

  const _IschoolerAddRemoveButtonWidget(
      {required this.ischoolerAddRemoveButton});
  //int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IschoolerButton(
          button: IschoolerIconButton(
            height: IschoolerConstants.ischooler_screen_height / 30,
            width: IschoolerConstants.ischooler_screen_width / 30,
            onPressed: ischoolerAddRemoveButton.addButtonFunction,
            icon: Icon(Icons.add,
                size: IschoolerConstants.isTablet
                    ? IschoolerConstants.ischooler_screen_height / 25
                    : IschoolerConstants.ischooler_screen_height / 35),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            width: IschoolerConstants.isTablet ? 50 : 25,
            height: IschoolerConstants.isTablet ? 50 : 25,
            child: FittedBox(
              child: Text(
                '${ischoolerAddRemoveButton.count}',
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
            height: IschoolerConstants.ischooler_screen_height / 30,
            width: IschoolerConstants.ischooler_screen_width / 30,
            onPressed: ischoolerAddRemoveButton.subtractButtonFunction,
            icon: Icon(Icons.remove,
                size: IschoolerConstants.isTablet
                    ? IschoolerConstants.ischooler_screen_height / 25
                    : IschoolerConstants.ischooler_screen_height / 35),
          ),
        ),
      ],
    );
  }
}
