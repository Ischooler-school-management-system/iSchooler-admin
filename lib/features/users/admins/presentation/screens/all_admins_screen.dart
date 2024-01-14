import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/features/responsive/responsive.dart';
import '../../../../../common/features/widgets/buttons/educonnect_button.dart';
import '../../../../../common/features/widgets/buttons/models/buttons_model.dart';
import '../../../../../common/features/widgets/educonnect_conditional_widget.dart';
import '../../../../../common/features/widgets/educonnect_screen.dart';
import '../../../../../common/madpoly.dart';
import '../../../all_users_web_veiw.dart';
import '../../data/models/all_admins_model.dart';
import '../../logic/all_admins_cubit/all_admins_cubit.dart';
import 'all_studdents_views/all_admins_mobile_veiw.dart';

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

  onAddButtonPressed() {
/*     context.read<AllAdminsCubit>().addAdmin(
          admin: adminModel,
        ); */
    // adminList.add(newAdmin);
    // setState(() {});
  }

  /// A function that creates a button that adds a new user to the system.
  Widget addButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: EduconnectButton(
        button: EduconnectElevatedButton(
          /// A function that is called when the add button is pressed.
          onPressed: onAddButtonPressed,

          /// The text that appears on the button.
          text: 'Add Admin',

          /// The width of the button.
          width: 200,
        ),
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
      // enableScrolling: true,
      enableflexibleScrolling: true,
      // padding: const EdgeInsets.all(8),
      body: BlocBuilder<AllAdminsCubit, AllAdminsState>(
        builder: (context, state) {
          AllAdminsModel allAdminsModel = AllAdminsModel.empty();
          /* AllAdminsModel allAdminsModel = AllAdminsModel(
            items: List.generate(
              60,
              (index) => AdminModel(
                id: '$index',
                displayName: 'Joe allawi habib galbi',
                userName: 'JohnDoe',
                dateOfBirth: DateTime(2000, 1, 1),
                phoneNumber: '1234567890',
                address: '123 Main St',
                gender: 'Male',
                email: 'ziad@mail.com',
              ),
            ),
          ); */
          if (state.isLoaded()) {
            allAdminsModel = state.alladminsModel;
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
                  allUsers: allAdminsModel,
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
