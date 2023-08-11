part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

abstract class AppActionState extends AppState {}

class NavigateToPaymentViewActionState extends AppActionState {}
class UserInputState extends AppState {}
class UserInputDoneState extends AppState {}
class ErrorState extends AppState {}


class PaymentState {
   final bool showFab ;
   final bool showBs;
  PaymentState(this.showFab, this.showBs);
}
