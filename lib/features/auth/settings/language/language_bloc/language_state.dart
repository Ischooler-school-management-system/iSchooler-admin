part of 'language_bloc.dart';

// sealed class LanguageState extends Equatable {
//   const LanguageState();
  
//   @override
//   List<Object> get props => [];
// }

// final class LanguageInitial extends LanguageState {}

// // States
// abstract class LanguageState extends Equatable {}

// class LanguageInitial extends LanguageState {
//   @override
//   List<Object?> get props => [];
// }

// class LanguageUpdated extends LanguageState {
//   final int updatedLanguage;

//   LanguageUpdated(this.updatedLanguage);

//   @override
//   List<Object?> get props => [updatedLanguage];
// }

// States
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