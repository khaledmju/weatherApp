part of 'home_view_cubit.dart';

@immutable
sealed class HomeViewState {}

// the HomeViewInitial is the no weather state so will show the no weather body
final class HomeViewInitial extends HomeViewState {}

final class HomeViewSuccess extends HomeViewState {}

final class HomeViewFailure extends HomeViewState {}
