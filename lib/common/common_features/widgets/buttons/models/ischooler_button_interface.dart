//parent class for all the button classes
abstract class IIschoolerButton {
  final Function()? onPressed;
  final bool disabled;

  const IIschoolerButton({
    required this.onPressed,
    this.disabled = false,
  });
}
