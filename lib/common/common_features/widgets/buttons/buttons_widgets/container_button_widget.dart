part of '../ischooler_button.dart';

class _IschoolerContainerButtonWidget extends StatelessWidget {
  final IschoolerContainerButton ischoolerContainerButton;
  const _IschoolerContainerButtonWidget({
    required this.ischoolerContainerButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: IschoolerColors.blue.withOpacity(0.3),
        borderRadius:
            BorderRadius.circular(ischoolerContainerButton.borderRadius ?? 0),
      ),
      margin: ischoolerContainerButton.margin,
      child: IconButton(
        style: IconButton.styleFrom(
          shape: ischoolerContainerButton.borderRadius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      ischoolerContainerButton.borderRadius!))
              : const ContinuousRectangleBorder(),
          padding: ischoolerContainerButton.padding ?? EdgeInsets.zero,
          backgroundColor: ischoolerContainerButton.color,
        ),
        onPressed: ischoolerContainerButton.onPressed,
        icon: ischoolerContainerButton.child,
      ),
    );
  }
}
