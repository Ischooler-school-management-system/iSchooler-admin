part of '../educonnect_button.dart';

class _EduconnectContainerButtonWidget extends StatelessWidget {
  final EduconnectContainerButton educonnectContainerButton;
  const _EduconnectContainerButtonWidget({
    required this.educonnectContainerButton,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: const ContinuousRectangleBorder(),
        padding: EdgeInsets.zero,
      ),
      onPressed: educonnectContainerButton.onPressed,
      icon: educonnectContainerButton.child,
    );
  }
}
