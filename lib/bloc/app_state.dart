part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

abstract class AppActionState extends AppState {}

class NavigateToPaymentViewActionState extends AppActionState {}
class NavigateToUpiViewActionState extends AppActionState {}
class UserInputState extends AppState {}
class ErrorState extends AppState {}
class AmountErrorState extends AppActionState {
  final String errorMessage;
  AmountErrorState(this.errorMessage);
}
class AmountConfirmedState extends AppState {}
