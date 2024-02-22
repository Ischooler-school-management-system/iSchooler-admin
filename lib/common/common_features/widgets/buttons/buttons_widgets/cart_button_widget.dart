part of '../educonnect_button.dart';

class _CartButtonWidget extends StatelessWidget {
  final IschoolerCartButton educonnectCartButton;

  const _CartButtonWidget({
    required this.educonnectCartButton,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: IschoolerColors.light_grey,
          borderRadius: BorderRadius.circular(30.r),
        ),
        height: IschoolerConstants.educonnect_screen_height / 28,
        width: IschoolerConstants.educonnect_screen_width / 5,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: SizedBox(
          width: 80.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: educonnectCartButton.removeOnPressed,
                child: Icon(
                  Icons.remove,
                  size: 17.w,
                  color: IschoolerColors.secondaryColor,
                ),
              ),
              SizedBox(
                width: 30.w,
                height: 25.h,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    educonnectCartButton.text,
                    style: IschoolerConstants.textTheme.bodyMedium!.copyWith(
                      color: IschoolerColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: educonnectCartButton.addOnPressed,
                child: Icon(
                  Icons.add,
                  size: 17.w,
                  color: IschoolerColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
