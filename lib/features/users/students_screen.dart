import 'package:flutter/material.dart';

import '../../common/educonnect_constants.dart';
import '../../common/features/widgets/educonnect_conditional_widget.dart';
import '../../common/features/widgets/educonnect_screen.dart';
import '../../common/style/educonnect_colors.dart';
import 'user/data/models/user_model.dart';

class StudentsTab extends StatefulWidget {
  const StudentsTab({super.key});

  @override
  State<StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  List<UserModel> userList = [];

  @override
  Widget build(BuildContext context) {
    return EduconnectScreen(
      enableflexibleScrolling: true,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // Create a UserModel with initial values
              UserModel initialUser = UserModel(
                id: '123',
                username: 'JohnDoe',
                dateOfBirth: DateTime(2000, 1, 1),
                classId: '101',
                gradeId: 'A',
                phoneNumber: '1234567890',
                address: '123 Main St',
                paymentStatus: true,
                gender: 'Male',
              );

              // Add the new user to the list
              setState(() {
                userList.add(initialUser);
              });
            },
            child: const Text('Add User'),
          ),
          EduconnectConditionalWidget(
            condition: EduconnectConstants.educonnect_screen_width >= 800,
            whenTrue: webVeiw(),
            whenFalse: listTileVeiw(),
          ),
        ],
      ),
    );
  }

  Widget listTileVeiw() {
    return Column(
      children: userList.map((user) {
        return ListTile(
          title: Text('User ID: ${user.id}'),
          subtitle: Text('Username: ${user.username}'),
          onTap: () {
            // Add any action when a user is tapped
          },
        );
      }).toList(),
    );
  }

  Column webVeiw() {
    return Column(
      children: [
        _valuesRow(UserModel.allPropertyNames, false),
        Column(
          children: userList.asMap().entries.map(
            (entry) {
              final UserModel user = entry.value;
              final index = entry.key;
              final isEven = index % 2 == 0;
              // return _valueTextWidget(propertyName, isEven: isEven);

              return _valuesRow(user.getPropertyValues(), isEven);
            },
          ).toList(),
        ) // UserCard(user: user),
      ],
    );
  }

  Widget _valuesRow(List<String> list, bool isEven) {
    return Container(
      color: isEven ? EduconnectColors.blue.withOpacity(0.3) : null,
      padding: const EdgeInsets.all(8.0),
      // margin: const EdgeInsets.all(8.0),
      child: Row(
        // UserModel.allPropertyNames
        children:
            list.map((propertyName) => _valueTextWidget(propertyName)).toList(),
      ),
    );
  }

  Expanded _valueTextWidget(String e) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        e,
        textAlign: TextAlign.center,
      ),
    ));
  }
}
