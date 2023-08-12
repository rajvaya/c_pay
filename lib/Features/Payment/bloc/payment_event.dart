part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class InitiateUpi extends PaymentEvent{}
class AmountConfirmedButtonPressed extends PaymentEvent{
  final String amount;
  AmountConfirmedButtonPressed(this.amount);
}
class AmountInputFocused extends PaymentEvent{}