import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../ui/theme/app_themes.dart';

part 'theme_bloc.freezed.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeStateChanged(themeData: appThemeData[AppTheme.DarkTheme]!)) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeEventChange) {
        emit.call(ThemeStateChanged(themeData: appThemeData[event.theme]!));
      }
    });
  }
}
