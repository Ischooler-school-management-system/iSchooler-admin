import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../app_constants.dart';
import '../../../style/mawjood_colors.dart';
import '../data/models/loading_model.dart';
import 'mawjood_loading_snackbar.dart';

class LoadingPopup {
  static show(LoadingModel loading) {
    if (loading.loadingStatus == LoadingStatus.loading) {
      if (loading.loadingType == LoadingType.normal) {
        SmartDialog.dismiss();
        return normalLoadingDialog();
      } else {
        SmartDialog.dismiss();
        return quickLoadingWidget();
      }
      //SmartDialog.show(builder: (context) {});
    } else if (loading.loadingStatus == LoadingStatus.finished) {
      SmartDialog.dismiss();
    }
  }

  static normalLoadingDialog() {
    SmartDialog.show(
      clickMaskDismiss: false,
      builder: (context) => Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: MawjoodColors.secondaryColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15.0),
            shape: BoxShape.rectangle // Add rounded corners
            ),
        child: Center(
          child: SizedBox(
            width: 25.w,
            height: 25.h,
            child: const SpinKitRing(
              color: MawjoodColors.white,
              lineWidth: 3,
            ),
          ),
        ),
      ),
    );
  }

  static void quickLoadingWidget() {
    SmartDialog.showNotify(
      clickMaskDismiss: false,
      builder: (context) => Padding(
        padding: EdgeInsets.all(30.0.h),
        child: MawjoodLoadingSnackbar(
          message: EduConnectConstants.localization().loading,
        ),
      ),
      msg: 'text',
      notifyType: NotifyType.alert,
      alignment: const Alignment(0.0, 0.9),
      displayTime: const Duration(seconds: 40),
    );
  }
}
