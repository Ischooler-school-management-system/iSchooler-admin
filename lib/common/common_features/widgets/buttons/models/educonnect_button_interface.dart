//parent class for all the button classes
abstract class IEduconnectButton {
  final Function()? onPressed;
  final bool disabled;

  const IEduconnectButton({
    required this.onPressed,
    this.disabled = false,
  });
}
