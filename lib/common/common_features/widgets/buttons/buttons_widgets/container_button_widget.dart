part of '../educonnect_button.dart';

class _EduconnectContainerButtonWidget extends StatelessWidget {
  final EduconnectContainerButton educonnectContainerButton;
  const _EduconnectContainerButtonWidget({
    required this.educonnectContainerButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: EduconnectColors.blue.withOpacity(0.3),
        borderRadius:
            BorderRadius.circular(educonnectContainerButton.borderRadius ?? 0),
      ),
      margin: educonnectContainerButton.margin,
      child: IconButton(
        style: IconButton.styleFrom(
          shape: educonnectContainerButton.borderRadius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      educonnectContainerButton.borderRadius!))
              : const ContinuousRectangleBorder(),
          padding: educonnectContainerButton.padding ?? EdgeInsets.zero,
          backgroundColor: educonnectContainerButton.color,
        ),
        onPressed: educonnectContainerButton.onPressed,
        icon: educonnectContainerButton.child,
      ),
    );
  }
}
