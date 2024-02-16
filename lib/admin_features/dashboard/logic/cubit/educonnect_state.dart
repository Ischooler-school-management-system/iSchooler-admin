part of 'educonnect_cubit.dart';

enum EduconnectStatus { init, updated, loaded, failed }
// @immutable

class EduconnectState extends Equatable {
  final EduconnectListModel educonnectAllModel;
  final EduconnectStatus status;

  const EduconnectState({
    required this.educonnectAllModel,
    required this.status,
  });

  factory EduconnectState.init() {
    return EduconnectState(
      educonnectAllModel: EduconnectListModel.empty(),
      status: EduconnectStatus.init,
    );
  }

  EduconnectState updateData(EduconnectListModel newData) {
    return _copyWith(
      educonnectAllModel: newData,
      status: EduconnectStatus.loaded,
    );
  }

  EduconnectState updateStatus({EduconnectStatus? newStatus}) {
    return _copyWith(
      status: newStatus ?? EduconnectStatus.updated,
    );
  }

  EduconnectState _copyWith({
    EduconnectListModel? educonnectAllModel,
    EduconnectStatus? status,
  }) {
    return EduconnectState(
      educonnectAllModel: educonnectAllModel ?? this.educonnectAllModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == EduconnectStatus.loaded;

  @override
  List<Object> get props => [educonnectAllModel];
}
