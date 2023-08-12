part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

abstract class AppActionState extends AppState {}

class NavigateToPaymentViewActionState extends AppActionState {}

