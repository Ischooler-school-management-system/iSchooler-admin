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

class EduconnectAllModel extends Equatable {
  final List<EduconnectModel> items;

  const EduconnectAllModel({required this.items});
  factory EduconnectAllModel.empty() {
    return const EduconnectAllModel(items: []);
  }
  factory EduconnectAllModel.fromMap(Map map) {
    final List<EduconnectModel> items = List<EduconnectModel>.from(
      map['items'].map(
        (item) => EduconnectModel.fromMap(item),
      ),
    );
    return EduconnectAllModel(items: items);
  }
  Map<String, dynamic> toMap() {
    return {
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  List<Map<String, dynamic>> toDisplayList() {
    return items.map((item) => item.toDisplayMap()).toList();
  }

  @override
  List<Object> get props => [items];

  EduconnectAllModel copyWith({
    List<EduconnectModel>? items,
  }) {
    return EduconnectAllModel(
      items: items ?? this.items,
    );
  }
}
