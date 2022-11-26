part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.change({
    required AppTheme theme,
  }) = ThemeEventChange;
}
