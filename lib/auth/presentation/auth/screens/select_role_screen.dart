/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../admin_features/users/user_model.dart';
import '../../../../common/common_features/responsive/responsive.dart';
import '../../../../common/common_features/widgets/buttons/ischooler_button_export.dart';
import '../../../../common/common_features/widgets/ischooler_screen.dart';
import '../../../../common/ischooler_assets.dart';
import '../../../../common/madpoly.dart';
import '../../../../common/navigation/router.export.dart';
import '../../../../common/style/ischooler_colors.dart';
import '../../../../common/style/ischooler_text_theme.dart';
import '../../../logic/cubit/auth_cubit.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  int selectedRole = -1;

  List<({String iconPath, UserRole role, String title})> rolesDataList = [
    (role: UserRole.admin, iconPath: IschoolerAssets.adminIcon, title: 'Admin'),
    (
      role: UserRole.instructor,
      iconPath: IschoolerAssets.teacherIcon,
      title: 'Teacher'
    ),
    (
      role: UserRole.student,
      iconPath: IschoolerAssets.studentIcon,
      title: 'Student'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'buiding',
      tag: 'select_role_screen > ',
      developer: "Ziad",
    );
    final List<Widget> children = rolesDataList.asMap().entries.map(
      (entry) {
        final roleButtonData = entry.value;
        final index = entry.key;
        return RoleButtonWidget(
          isSelected: index == selectedRole,
          iconPath: roleButtonData.iconPath,
          title: roleButtonData.title,
          // role: role,
          onChanged: (isSelected) {
            setState(() {
              if (isSelected) {
                selectedRole = index;
              }
            });
          },
        );
      },
    ).toList();
    var isMobile = MediaQuery.of(currentContext!).size.width < 400;

    return IschoolerScreen(
      keepMobileView: true,
      enableScrolling: true,
      alignment: Alignment.center,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Please select you role',
            style: IschoolerTextStyles.style20
                .copyWith(fontWeight: FontWeight.w600, fontSize: 22),
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: Responsive.childrenWithSpacing(
                  // horizontalSpacing: 10,
                  verticalSpacing: 15,
                  children: children,
                ) /*  Responsive.expandedChildren(children: ) */)
              : Row(
                  children: Responsive.expandedChildren(children: children),
                ),
          const SizedBox(height: 20),
          IschoolerButton(
            button: IschoolerElevatedButton(
              width: 200,
              onPressed: onContinueButtonPressed,
              disabled:
                  selectedRole == -1 || selectedRole >= rolesDataList.length,
              text: 'continue',
            ),
          ),
        ],
      ),
    );
  }

  onContinueButtonPressed() {
    Madpoly.print(
      // '${roles[selectedRole]}',~
      rolesDataList[selectedRole].role.name,
      tag: 'select_role_screen > onContinueButtonPressed',
      developer: "Ziad",
      showToast: true,
    );
    context.read<AuthCubit>().selectRole(rolesDataList[selectedRole].role);
    IschoolerNavigator.push(Routes.authScreen);
  }
}

class RoleButtonWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  // final UserRole role;
  final bool isSelected;
  final Function(bool isSelected)? onChanged;
  const RoleButtonWidget({
    super.key,
    // required this.role,
    required this.iconPath,
    required this.title,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Widget svgIcon = SvgPicture.asset(
      iconPath,
      height: 80,
      fit: BoxFit.fitHeight,
      colorFilter: ColorFilter.mode(
          isSelected ? IschoolerColors.blue : Colors.grey.withOpacity(0.3),
          BlendMode.srcIn),
      semanticsLabel: 'A red up arrow',
    );
    return IschoolerButton(
      button: IschoolerContainerButton(
        roundedCorners: true,
        child: Container(
          padding: const EdgeInsets.all(20),
          // margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(
                    color: IschoolerColors.blue,
                  )
                : null,
            color: isSelected
                ? const Color.fromARGB(255, 213, 237, 250)
                : IschoolerColors.backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(2, 2),
                spreadRadius: 6,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              svgIcon,
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? IschoolerColors.blue : Colors.grey,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
            // )),
            // onPressed: () {},
          ),
        ),
        onPressed: () {
          onChanged?.call(!isSelected);
        },
      ),
    );
  }
}
 */