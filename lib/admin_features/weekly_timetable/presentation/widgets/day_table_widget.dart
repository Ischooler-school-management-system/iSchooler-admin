import 'package:flutter/material.dart';

import '../../../../common/comon_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../common/educonnect_model.dart';
import '../../weekly_session/data/models/weekly_session_model.dart';
import '../../weekly_session/data/models/weekly_sessions_list_model.dart';
import 'table_session_widget.dart';

class DayTableWidget extends StatelessWidget {
  const DayTableWidget({
    super.key,
    required this.weeklySessionsListModel,
  });

  final WeeklySessionsListModel weeklySessionsListModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: weeklySessionsListModel.items.length,
            itemBuilder: (BuildContext context, int index) {
              EduconnectModel item = weeklySessionsListModel.items[index];
              if (item is WeeklySessionModel) {
                return TableSessionWidget(
                  session: item,
                  isFirst: index == 0,
                  isLast: index == weeklySessionsListModel.items.length - 1,
                );
              }
              return null;
            },
          ),
        ),
        EduconnectButton(
          button: EduconnectElevatedButton(
            onPressed: () {},
            text: 'create new session',
          ),
        ),
      ],
    );
  }
}
