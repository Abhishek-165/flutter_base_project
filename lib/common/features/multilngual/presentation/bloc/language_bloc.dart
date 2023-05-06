import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flavour_clean_bloc/common/features/multilngual/presentation/bloc/language_event.dart';

import '../../data/language.dart';
import '../../data/local_language.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<GetLanguage>(onGetLanguage);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    // store the local language preference
    LocalLanguage.getInstance()
        .storeKey(event.selectedLanguage.value.languageCode);
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  onGetLanguage(GetLanguage event, Emitter<LanguageState> emit) async {
    // get the local language preference
    final selectedLanguage = LocalLanguage.getInstance().readValue();
    emit(state.copyWith(
      selectedLanguage: selectedLanguage != null
          ? Language.values
              .where((item) => item.value.languageCode == selectedLanguage)
              .first
          : Language.english,
    ));
  }
}
