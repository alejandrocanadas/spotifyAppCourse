import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    developer.log('ThemeCubit initialized with theme: ${state.toString()}');
  }

  // void setTheme(ThemeMode theme) => {emit(theme)};

  void setTheme(ThemeMode theme) {
    developer.log('Setting theme to: ${theme.toString()}');
    emit(theme);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try {
      final themeIndex = json['theme'] as int;
      developer.log('Loading theme from storage: ${ThemeMode.values[themeIndex]}');
      return ThemeMode.values[themeIndex];
    } catch (e) {
      developer.log('Error loading theme from storage: $e');
      return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    developer.log('Saving theme to storage: ${state.toString()}');
    return {'theme': state.index};
  }
}