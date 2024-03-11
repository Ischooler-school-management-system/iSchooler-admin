import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/functions/ischooler_date_time_helper.dart';
import '../../../../common/ischooler_constants.dart';
import '../../../../common/style/ischooler_colors.dart';
import '../../../users/admins/data/models/admin_model.dart';

class ProfileDetailsWidget extends StatelessWidget {
  final AdminModel adminData;

  const ProfileDetailsWidget({
    super.key,
    required this.adminData,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> profileDetailsList = [
      // detailsRowWidget(
      //   // IschoolerConstants.localization().the_class,
      //   'the_class',
      //   adminData.classData.name,
      // ),

      // /// grade
      // detailsRowWidget(
      //   // IschoolerConstants.localization().grade,
      //   'grade',
      //   adminData.classData.grade.name,
      // ),

      /// Roll Number
      detailsRowWidget(
        // IschoolerConstants.localization().roll_number,
        'roll_number',
        adminData.id,
      ),

      /// date of birth
      detailsRowWidget(
        IschoolerConstants.localization().date_of_birth,
        IschoolerDateAndTimeHelper.dateFormat(adminData.dateOfBirth) ??
            'Unknown',
      ),

      /// Phone Number
      detailsRowWidget(
        IschoolerConstants.localization().phone_number,
        adminData.phoneNumber,
      ),

      /// Address
      detailsRowWidget(
        IschoolerConstants.localization().address,
        adminData.address,
      ),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.w,
              // vertical: 24.w,
            ),
            child: const Text(
              // 'Student Detail',
              'بيانات الطالب',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 12.w,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: IschoolerColors.grey.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: profileDetailsList,
            ),
          ),
        ],
      ),
    );
  }

  Widget detailsRowWidget(String title, String data) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0.w,
          vertical: 10.0.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                // color: IschoolerColors.lightBlack,
              ),
            ),
            SizedBox(
              width: 120,
              child: Text(
                data,
                style: const TextStyle(
                  fontSize: 16,
                  // color: IschoolerColors.lightBlack,
                ),
              ),
            ),
          ],
        ));
  }
}
