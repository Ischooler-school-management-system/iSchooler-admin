import 'package:flutter/material.dart';

import '../../../../../common/common_features/widgets/buttons/educonnect_button_export.dart';
import '../../../../../common/common_features/widgets/educonnect_timeline_tile.dart';
import '../../../weekly_session/data/models/weekly_session_model.dart';
import '../../../weekly_session/data/models/weekly_sessions_list_model.dart';
import 'table_session_widget.dart';

class DayTableWidget extends StatelessWidget {
  final Function()? onAddSessionPressed;
  final WeeklySessionsListModel weeklySessionsListModel;
  const DayTableWidget({
    super.key,
    required this.weeklySessionsListModel,
    this.onAddSessionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...weeklySessionsListModel.items.asMap().entries.map((e) {
          WeeklySessionModel item = e.value as WeeklySessionModel;
          int index = e.key;
          return TableSessionWidget(
            session: item,
            isFirst: index == 0,
            isLast: (onAddSessionPressed != null)
                ? false
                : index == weeklySessionsListModel.items.length - 1,
          );
        }),
        if (onAddSessionPressed != null)
          IschoolerTimelineTile(
            isLast: true,
            endChild: IschoolerButton(
              button: IschoolerContainerButton(
                borderRadius: 12,
                margin: const EdgeInsets.all(8),
                child: const ListTile(
                  title: Text('add new session'),
                  leading: Icon(Icons.add, color: Colors.black),
                ),
                onPressed: onAddSessionPressed,
              ),
            ),
          ),
      ],
    );
  }
}
