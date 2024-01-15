import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangInitial()) {
    on<UpdateLangEvent>(_onUpdateLang);
  }

  void _onUpdateLang(UpdateLangEvent event, Emitter<LangState> emit) {
    emit(LangUpdated(event.newLang));
  }
}
