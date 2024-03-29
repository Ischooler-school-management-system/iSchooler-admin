// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../common/ischooler_assets.dart';
import '../../../../common/common_features/widgets/ischooler_image_widget.dart';
import '../../../../common/style/ischooler_text_theme.dart';

class EduconnecDashboardListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Function()? onTap;
  final bool isName;

  const EduconnecDashboardListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.isName = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      // titleAlignment: ListTileTitleAlignment.top,
      leading: isName
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: IschoolerImageWidget(
                url: IschoolerAssets.blankProfileImage,
                circleAvatarRadius: 25,
              ),
            )
          : null,
      title: Text(
        title,
        style: IschoolerTextStyles.style14,
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              // style: IschoolerTextStyles.style14,
              textAlign: TextAlign.center,
            )
          : null,
      onTap: onTap,
      trailing: trailing,
    );
  }
}
