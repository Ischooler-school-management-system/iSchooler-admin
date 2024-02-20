import 'dart:developer';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// LOVELY Naming (Mr. Maaaaaaaaaaaaaaaaaaaaaaaaaaadpoly)
///
/// Use it to print anything, DO NOT FORGOT TO PASS THE [DEVELOPER] NAME
///

enum MadpolyColor { blue, green, yellow, red, purple, black }

abstract class Madpoly {
  static void print(
    String? msg, {
    Object? inspectObject,
    String? developer,
    MadpolyColor? color,
    String? tag,
    bool isLog = false,
    bool showToast = false,
    bool addDivider = true,
  }) {
    String message = "";

    if (tag != null) message += "($tag) ";
    if (developer != null) message += "$developer :: ";
    // bool isInspect = msg is! String;
    if (msg != null) {
      message += msg;
    }
    if (inspectObject != null) {
      message += ', inspectObject: $inspectObject';
    }
    message += '\n ---------------------------------';
    if (color == null) {
      if (isLog == true) {
        color = MadpolyColor.yellow;
      } else {
        color = MadpolyColor.blue;
      }
    }
    if (showToast) {
      SmartDialog.dismiss();
      SmartDialog.showToast(msg.toString());
    }

    String formattedMessage = _formatLogMessage(message, color);
    log(formattedMessage);
    inspect(inspectObject);
  }

  static String _formatLogMessage(String message, MadpolyColor? color) {
    String colorCode = _getColorCode(color);
    return '$colorCode$message\x1B[0m';
  }

  static String _getColorCode(MadpolyColor? color) {
    switch (color) {
      case MadpolyColor.blue:
        return '\x1B[34m'; // Blue text
      case MadpolyColor.green:
        return '\x1B[32m'; // Green text
      case MadpolyColor.yellow:
        return '\x1B[33m'; // Yellow text
      case MadpolyColor.red:
        return '\x1B[31m'; // Red text
      case MadpolyColor.purple:
        return '\x1B[35m'; // Purple text
      case MadpolyColor.black:
        return '\x1B[30m'; // Black with white background
      default:
        return '\x1B[33m'; // Default to yellow
    }
  }
}
