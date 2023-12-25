part of '../mawjood_button.dart';

class _CartButtonWidget extends StatelessWidget {
  final MawjoodCartButton mawjoodCartButton;

  const _CartButtonWidget({
    required this.mawjoodCartButton,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: MawjoodColors.grey,
          borderRadius: BorderRadius.circular(30.r),
        ),
        height: EduConnectConstants.mawjood_screen_height / 28,
        width: EduConnectConstants.mawjood_screen_width / 5,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: SizedBox(
          width: 80.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: mawjoodCartButton.removeOnPressed,
                child: Icon(
                  Icons.remove,
                  size: 17.w,
                  color: MawjoodColors.secondaryColor,
                ),
              ),
              SizedBox(
                width: 30.w,
                height: 25.h,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    mawjoodCartButton.text,
                    style: EduConnectConstants.text_theme.bodyMedium!.copyWith(
                      color: MawjoodColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: mawjoodCartButton.addOnPressed,
                child: Icon(
                  Icons.add,
                  size: 17.w,
                  color: MawjoodColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
