import 'package:equatable/equatable.dart';

enum LoadingStatus { none, loading, finished }

enum LoadingType { none, quick, normal }

class LoadingModel extends Equatable {
  final LoadingStatus loadingStatus;
  final LoadingType loadingType;

  const LoadingModel({
    required this.loadingStatus,
    this.loadingType = LoadingType.normal,
  });

  static LoadingModel none = const LoadingModel(
    loadingStatus: LoadingStatus.none,
    loadingType: LoadingType.none,
  );

  @override
  List<Object?> get props => [loadingStatus, loadingType];
}
