import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ChangeTheme>((event, emit) {
      try {
        final int data = event.value;
        switch (data) {
          case 1:
            emit(SuccessChangeTheme(
                theme: ThemeData(
                    fontFamily: 'Gilroy', brightness: Brightness.light),
                groupValue: data));
            break;
          case 2:
            emit(SuccessChangeTheme(
                theme: ThemeData(
                    fontFamily: 'Gilroy', brightness: Brightness.dark),
                groupValue: data));
            break;
          default:
            emit(SuccessChangeTheme(
                theme: ThemeData(
                    fontFamily: 'Gilroy', brightness: Brightness.light),
                groupValue: data));
        }
      } catch (e) {
        throw Exception(e.toString());
        print(e.toString());
      }
    });
  }
}
