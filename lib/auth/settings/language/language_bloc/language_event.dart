part of 'language_bloc.dart';

// sealed class LanguageuageEvent extends Equatable {
//   const LanguageuageEvent();

//   @override
//   List<Object> get props => [];
// }

// // Events
// abstract class LanguageEvent extends Equatable {}

// class UpdateLanguageEvent extends LanguageEvent {
//   final int newLanguage;

//   UpdateLanguageEvent(this.newLanguage);

//   @override
//   List<Object?> get props => [newLanguage];
// }

// Events
abstract class LangEvent extends Equatable {}

class UpdateLangEvent extends LangEvent {
  final int newLang;

  UpdateLangEvent(this.newLang);

  @override
  List<Object?> get props => [newLang];
}