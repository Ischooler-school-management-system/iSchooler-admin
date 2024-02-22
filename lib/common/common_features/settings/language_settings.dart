import 'package:flutter/material.dart';

import '../../educonnect_constants.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(IschoolerConstants.localization().settings);
  }
}
