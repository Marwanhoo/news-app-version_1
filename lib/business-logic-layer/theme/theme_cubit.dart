import 'package:flutter/material.dart';
import 'package:flutter_app_2/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode(){
    isDark = !isDark;
      emit(AppChangeModeState());
  }
}
