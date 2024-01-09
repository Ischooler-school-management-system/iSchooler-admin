// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common/educonnect_assets.dart';
import '../../common/features/widgets/educonnect_image_widget.dart';
import '../../common/style/educonnect_text_theme.dart';

class EduconnecDashboardListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Function()? onTap;
  final double? width;
  final bool isName;

  const EduconnecDashboardListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.width,
    this.isName = false,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      // width: width,
      child: ListTile(
        // titleAlignment: ListTileTitleAlignment.top,
        leading: isName
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: EduconnectImageWidget.asset(
                  url: EduconnectAssets.blankProfileImage,
                  circleShape: true,
                ),
              )
            : null,
        title: Text(
          title,
          style: EduconnectTextStyles.style14,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                // style: EduconnectTextStyles.style14,
                textAlign: TextAlign.center,
              )
            : null,
        onTap: onTap,
        trailing: trailing,
      ),
    );
  }
}
