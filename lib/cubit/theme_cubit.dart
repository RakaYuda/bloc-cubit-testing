import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../assets/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: appThemeData[AppTheme.BlueLight]));

  Future<void> changeTheme(ThemeData theme) async {
    emit(ThemeState(themeData: theme));
  }
}
