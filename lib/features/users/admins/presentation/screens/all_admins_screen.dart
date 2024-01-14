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
  var adminModel = AdminModel(
    id: '123',
    displayName: 'Joe',
    adminName: 'JohnDoe',
    dateOfBirth: DateTime(2000, 1, 1),
    phoneNumber: '1234567890',
    address: '123 Main St',
    gender: 'Male',
    email: 'ziad@mail.com',
  );
  @override
  void initState() {
    super.initState();
    // context.read<AllAdminsCubit>().getAllAdminsData();
  }

  onAddButtonPressed() {
/*     context.read<AllAdminsCubit>().addAdmin(
          admin: adminModel,
        ); */
    // adminList.add(newAdmin);
    // setState(() {});
  }

  /// A function that creates a button that adds a new user to the system.
  EduconnectButton addButton() {
    return EduconnectButton(
      button: EduconnectElevatedButton(
        /// A function that is called when the add button is pressed.
        onPressed: onAddButtonPressed,

        /// The text that appears on the button.
        text: 'Add Admin',

        /// The width of the button.
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
      enableScrolling: true,
      // enableflexibleScrolling: true,
      padding: const EdgeInsets.all(8),
      body: BlocBuilder<AllAdminsCubit, AllAdminsState>(
        builder: (context, state) {
          // AllAdminsModel allAdminsModel = AllAdminsModel.empty();
          AllAdminsModel allAdminsModel =
              AllAdminsModel(items: List.generate(20, (index) => adminModel));
          if (state.isLoaded()) {
            // allAdminsModel = state.alladminsModel;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              addButton(),
              EduconnectConditionalWidget(
                condition: Responsive.isMobile(),
                whenTrue: AllAdminsMobileVeiw(
                  adminsList: allAdminsModel.items,
                ),
                whenFalse: AllUsersWebVeiw(
                  // usersList: [],
                  usersList: allAdminsModel.toDisplayList(),
                ),
                // whenFalse: testFunction(allAdminsModel.toDisplayList()),
              ),
            ],
          );
        },
      ),
    );
  }
}
