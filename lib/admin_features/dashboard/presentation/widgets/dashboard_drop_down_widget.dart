// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common_features/widgets/ischooler_drop_down_widget.dart';
import '../../../../common/ischooler_model.dart';
import '../../logic/cubit/ischooler_list_cubit.dart';

class DashboardDropDownWidget<C extends IschoolerListCubit>
    extends StatefulWidget {
  final Function(IschoolerModel) onChanged;
  final String? hint;
  final String? labelText;
  const DashboardDropDownWidget({
    super.key,
    required this.onChanged,
    this.hint,
    this.labelText,
  });

  @override
  State<DashboardDropDownWidget<C>> createState() =>
      _DashboardDropDownWidgetState<C>();
}

class _DashboardDropDownWidgetState<C extends IschoolerListCubit>
    extends State<DashboardDropDownWidget<C>> {
  IschoolerModel selectedData = IschoolerModel.empty();
  @override
  void initState() {
    super.initState();
    context.read<C>().getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, IschoolerListState>(
      builder: (context, state) {
        IschoolerListModel educonnectAllModel = IschoolerListModel.empty();
        if (state.isLoaded()) {
          educonnectAllModel = state.educonnectAllModel;
        }
        List<String> options = educonnectAllModel.getItemNames();
        return EduConnectDropdownWidget(
          labelText: widget.labelText,
          hint: widget.hint ?? options.first,
          onChanged: (value) {
            setState(() {
              if (value != null && value != '') {
                IschoolerModel? selectedData =
                    educonnectAllModel.getModelByName(value);
                if (selectedData != null) {
                  widget.onChanged(selectedData);
                }
              }
            });
          },
          options: options,
        );
      },
    );
  }
}
