import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common_features/widgets/ischooler_screen.dart';
import '../../../users/admins/data/models/admin_model.dart';
import '../../logic/cubit/profile_cubit.dart';
import '../widgets/profile_details_widget.dart';
import '../widgets/profile_overview_widget.dart';

class ProfileScreen extends StatefulWidget {
  // final StudentModel studentData;
  const ProfileScreen({
    super.key,
    /* required this.studentData */
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AdminModel adminData = AdminModel.empty();
  @override
  void initState() {
    super.initState();
    getDataRequest();
  }

  void getDataRequest() {
    context.read<ProfileCubit>().getItem(id: 'id');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state.isLoaded()) {
        adminData = state.ischoolerModel as AdminModel;
      }
      return IschoolerScreen(
          // appBarTitle: Text(
          //   IschoolerConstants.localization().profile,
          //   style: const TextStyle(
          //     fontSize: 18,
          //   ),
          // ),
          // appBarCenterTitle: true,
          // appBarLeading: IschoolerButton(
          //   button: IschoolerIconButton(
          //     onPressed: () {
          //       // IschoolerNavigator.push(
          //       //   Routes.settingsScreen,
          //       //   // replace: true,
          //       // );
          //     },
          //     icon: const Icon(
          //       Icons.settings,
          //     ),
          //   ),
          // ),
          // appBarActions: [
          //   IschoolerButton(
          //     button: IschoolerIconButton(
          //       onPressed: () {
          //         context.read<AuthCubit>().signOut();
          //       },
          //       icon: const Icon(
          //         Icons.logout,
          //       ),
          //     ),
          //   ),
          // ],
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileOverviewWidget(adminData: adminData),
          ProfileDetailsWidget(adminData: adminData),
        ],
      ));
    });
  }
}
