import 'dart:ui';

enum Language {
  english(
    Locale('en', ''),
  ),
  hindi(
    Locale('hi', ''),
  );

  const Language(this.value);

  final Locale value;
}
