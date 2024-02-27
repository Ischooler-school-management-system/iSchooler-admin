import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/common_features/widgets/educonnect_image_widget.dart';
import '../../../../common/style/educonnect_colors.dart';
import '../../data/models/student_model.dart';

class ProfileOverviewWidget extends StatelessWidget {
  final StudentModel studentData;
  const ProfileOverviewWidget({
    super.key,
    required this.studentData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Stack(
        children: [
          /// background curved blue container
          Container(
            height: 120.h,
            decoration: BoxDecoration(
              color: IschoolerColors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.r),
                bottomRight: Radius.circular(35.r),
                topLeft: Radius.zero,
                topRight: Radius.zero,
              ),
            ),
          ),

          /// background white container that contains the description
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 18.w,
              ),
              height: 150.h,
              decoration: BoxDecoration(
                color: IschoolerColors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 80.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                        vertical: 4.0.h,
                      ),
                      child: const Text(
                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor',
                        style: TextStyle(
                          fontSize: 14,
                          color: IschoolerColors.lightBlack,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// image and name and profile picture
          Align(
            alignment: const Alignment(0.0, -0.4),
            child: SizedBox(
              height: 140.h,
              child: Column(
                children: [
                  IschoolerImageWidget(
                    circleAvatarRadius: 40.r,
                    url: studentData.profilePicture,
                  ),
                  Text(
                    studentData.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${studentData.classData.grade.name} | ${studentData.classData.name}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: IschoolerColors.lightBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
