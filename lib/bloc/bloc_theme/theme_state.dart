part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class SuccessChangeTheme extends ThemeState {
  ThemeData theme;
  int groupValue;

  SuccessChangeTheme({required this.theme, required this.groupValue});

  @override
  List<Object> get props => [theme, groupValue];
}
