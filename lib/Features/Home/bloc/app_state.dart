part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {
  final int pinSize;
  AppInitial(this.pinSize);
}

class NavigateToPaymentViewActionState extends AppState {}
class PinToggled extends AppState{}

