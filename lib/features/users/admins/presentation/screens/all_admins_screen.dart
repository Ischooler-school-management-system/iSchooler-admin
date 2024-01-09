import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/features/responsive/responsive.dart';
import '../../../../../common/features/widgets/buttons/educonnect_button.dart';
import '../../../../../common/features/widgets/buttons/models/buttons_model.dart';
import '../../../../../common/features/widgets/educonnect_conditional_widget.dart';
import '../../../../../common/features/widgets/educonnect_screen.dart';
import '../../../../../common/madpoly.dart';
import '../../data/models/admin_model.dart';
import '../../data/models/all_admins_model.dart';
import '../../logic/all_admins_cubit/all_admins_cubit.dart';
import 'all_studdents_views/all_admins_mobile_veiw.dart';
import 'all_studdents_views/all_admins_web_veiw.dart';

class AllAdminsScreen extends StatefulWidget {
  const AllAdminsScreen({super.key});

  @override
  State<AllAdminsScreen> createState() => _AllAdminsScreenState();
}

class _AllAdminsScreenState extends State<AllAdminsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AllAdminsCubit>().getAllAdminsData();
  }

  int limit = 0;

  onAddButtonPressed() {
    // AdminModel newAdmin =
    // EduconnectNavigator.navigateToScreen(const AddAdminScreen());
    context.read<AllAdminsCubit>().addAdmin(
          admin: AdminModel(
            id: '123',
            displayName: 'Joe',
            adminName: 'JohnDoe',
            dateOfBirth: DateTime(2000, 1, 1),
            phoneNumber: '1234567890',
            address: '123 Main St',
            gender: 'Male',
            email: 'ziad@mail.com',
          ),
        );
    // adminList.add(newAdmin);
    // setState(() {});
  }

  EduconnectButton addButton() {
    return EduconnectButton(
      button: EduconnectElevatedButton(
        onPressed: onAddButtonPressed,
        text: 'Add Admin',
        width: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Madpoly.print(
      'building',
      tag: 'all_admins_screen > build',
      developer: "Ziad",
    );
    return EduconnectScreen(
      enableflexibleScrolling: true,
      padding: const EdgeInsets.all(8),
      body: BlocBuilder<AllAdminsCubit, AllAdminsState>(
        builder: (context, state) {
          AllAdminsModel allAdminsModel = AllAdminsModel.empty();
          List<AdminModel> adminList = [];
          if (state.isLoaded()) {
            allAdminsModel = state.alladminsModel;
            adminList = allAdminsModel.items;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addButton(),
              EduconnectConditionalWidget(
                condition: Responsive.isMobile(),
                whenTrue: AllAdminsMobileVeiw(adminList: adminList),
                whenFalse: AllAdminsWebVeiw(adminsList: adminList),
              ),
            ],
          );
        },
      ),
    );
  }
}
