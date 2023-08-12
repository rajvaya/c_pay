part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class InitiatePaymentEvent extends AppEvent{}
class InitiateUpi extends AppEvent{}
class AmountConfirmedButtonPressed extends AppEvent{
  final String amount;
  AmountConfirmedButtonPressed(this.amount);
}
class AmountInputFocused extends AppEvent{}
