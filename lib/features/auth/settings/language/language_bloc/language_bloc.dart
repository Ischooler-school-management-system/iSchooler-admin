import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

// class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
//   LanguageBloc() : super(LanguageInitial()) {
//     on<LanguageEvent>((LanguageEvent event,Emitter<LanguageState> emit){
//        Madpoly.print('lang tracking: event.newLang = ${event.newLanguage}');
//     emit(LanguageUpdated(event.newLanguage));
//     });
//   }
// }

// // Events
// abstract class LangEvent extends Equatable {}

// class UpdateLangEvent extends LangEvent {
//   final int newLang;

//   UpdateLangEvent(this.newLang);

//   @override
//   List<Object?> get props => [newLang];
// }

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangInitial()) {
    on<UpdateLangEvent>(_onUpdateLang);
  }

  void _onUpdateLang(UpdateLangEvent event, Emitter<LangState> emit) {
    // Madpoly.print('lang tracking: event.newLang = ${event.newLang}');
    emit(LangUpdated(event.newLang));
  }
}
