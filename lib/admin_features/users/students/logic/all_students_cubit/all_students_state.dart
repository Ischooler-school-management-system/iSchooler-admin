part of 'all_students_cubit.dart';

enum AllStudentsStatus { init, updated, loaded, failed }
// @immutable

class AllStudentsState extends Equatable {
  final AllStudentsModel allstudentsModel;
  final AllStudentsStatus status;

  const AllStudentsState({
    required this.allstudentsModel,
    required this.status,
  });

  factory AllStudentsState.init() {
    return AllStudentsState(
      allstudentsModel: AllStudentsModel.empty(),
      status: AllStudentsStatus.init,
    );
  }

  AllStudentsState updateAllStudents(AllStudentsModel allstudentsModel) {
    return _copyWith(
      allstudentsModel: allstudentsModel,
      status: AllStudentsStatus.loaded,
    );
  }

  AllStudentsState _copyWith({
    AllStudentsModel? allstudentsModel,
    AllStudentsStatus? status,
  }) {
    return AllStudentsState(
      allstudentsModel: allstudentsModel ?? this.allstudentsModel,
      status: status ?? this.status,
    );
  }

  bool isLoaded() => status == AllStudentsStatus.loaded;
  @override
  List<Object> get props => [allstudentsModel, status];
}
