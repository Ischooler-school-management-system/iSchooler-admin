// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class EduconnectModel extends Equatable {
  final String id;
  const EduconnectModel({required this.id});
  factory EduconnectModel.empty() {
    return const EduconnectModel(id: '-1');
  }
  factory EduconnectModel.fromMap(Map<String, dynamic> map) {
    return EduconnectModel(id: map['id'] ?? '');
  }
  Map<String, dynamic> toMap() => {};
  Map<String, dynamic> toDisplayMap() => {};

  EduconnectModel copyWith({String? id}) {
    return EduconnectModel(id: id ?? this.id);
  }

  @override
  List<Object?> get props => [id];
}
