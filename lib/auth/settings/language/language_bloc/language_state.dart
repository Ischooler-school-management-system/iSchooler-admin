part of 'language_bloc.dart';

abstract class LangState extends Equatable {}

class LangInitial extends LangState {
  @override
  List<Object?> get props => [];
}

class LangUpdated extends LangState {
  final int updatedLang;

  LangUpdated(this.updatedLang);

  @override
  List<Object?> get props => [updatedLang];
}
