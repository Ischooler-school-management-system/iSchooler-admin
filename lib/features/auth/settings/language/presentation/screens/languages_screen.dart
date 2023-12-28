import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../../../common/app_constants.dart';
import '../../../../../../common/educonnect_local_settings.dart';
import '../../../../../../common/features/loading/presentation/loading_popup.dart';
import '../../../../../../common/features/widgets/educonnect_screen.dart';
import '../../../../../../common/madpoly.dart';
import '../../../../../../common/style/educonnect_colors.dart';
import '../../language_bloc/language_bloc.dart';
import '../widgets/language_widget.dart';

class LanguagesScreen extends StatefulWidget {
  // static final BehaviorSubject<int> languageSubject =
  //     BehaviorSubject<int>.seeded(-1);
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    getLang();
  }

  Future<void> getLang() async {
    selectedIndex = await EduconnectLocalSettings.getCurrentLang();
    setState(() {});
    Madpoly.print('selectedIndex$selectedIndex');
  }

  void _handleRadioValueChange(int index) async {
    setState(() {
      selectedIndex = index;
    });
    EduconnectLocalSettings.saveCurrentLang(selectedIndex);

    // Update the language using the static languageSubject
    // LanguagesScreen.languageSubject.sink.add(index);
    //  context.read<LangBloc>().on<UpdateLangEvent>((event, emit)
    BlocProvider.of<LangBloc>(context).add(UpdateLangEvent(selectedIndex));
    LoadingPopup.normalLoadingDialog();
    await Future.delayed(const Duration(seconds: 2), () {
      // EduconnectNavigator.navigateToScreen(const EduconnectBottomNavBar());
      SmartDialog.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return EduConnectScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            /* EduconnectConstants.localization(). */ 'language',
            style: EduConnectConstants.text_theme.titleSmall!
                .copyWith(color: EduConnectColors.blue),
          ),
          SizedBox(height: 10.h),
          LanguageWidget(
            title: 'عربي',
            isSelected: selectedIndex == 0,
            onChanged: (isSelected) {
              if (isSelected) {
                _handleRadioValueChange(0);
              }
            },
          ),
          LanguageWidget(
            title: 'English',
            isSelected: selectedIndex == 1,
            onChanged: (isSelected) {
              if (isSelected) {
                _handleRadioValueChange(1);
              }
            },
          ),
        ],
      ),
    );
  }
}
