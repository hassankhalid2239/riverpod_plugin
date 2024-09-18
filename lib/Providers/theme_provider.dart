import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeMode build() => ThemeMode.light;

  void setTheme(themeMode) {
    state = themeMode;
  }
}

// dart run build_runner watch --delete-conflicting-outputs
