// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/comon_features/widgets/educonnect_drop_down_widget.dart';
import '../../../../common/educonnect_model.dart';
import '../../logic/cubit/educonnect_cubit.dart';

class DashboardDropDownWidget<C extends EduconnectCubit>
    extends StatefulWidget {
  final Function(EduconnectModel) onChanged;
  final String value;
  final String labelText;
  const DashboardDropDownWidget({
    super.key,
    required this.onChanged,
    required this.value,
    required this.labelText,
  });

  @override
  State<DashboardDropDownWidget<C>> createState() =>
      _DashboardDropDownWidgetState<C>();
}

class _DashboardDropDownWidgetState<C extends EduconnectCubit>
    extends State<DashboardDropDownWidget<C>> {
  EduconnectModel selectedData = EduconnectModel.empty();
  @override
  void initState() {
    super.initState();
    context.read<C>().getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, EduconnectState>(
      builder: (context, state) {
        EduconnectListModel educonnectAllModel = EduconnectListModel.empty();
        if (state.isLoaded()) {
          educonnectAllModel = state.educonnectAllModel;
        }
        return EduConnectDropdownWidget(
          labelText: widget.labelText,
          hint: widget.value,
          onChanged: (value) {
            setState(() {
              if (value != null && value != '') {
                EduconnectModel? selectedData =
                    educonnectAllModel.getModelByName(value);
                if (selectedData != null) {
                  widget.onChanged(selectedData);
                }
              }
            });
          },
          options: educonnectAllModel.getItemNames(),
        );
      },
    );
  }
}
