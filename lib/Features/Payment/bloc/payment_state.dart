part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class NavigateToUpiViewActionState extends PaymentState {}
class UserInputState extends PaymentState {}
class ErrorState extends PaymentState {}
class AmountErrorState extends PaymentState {
  final String errorMessage;
  AmountErrorState(this.errorMessage);
}
class AmountConfirmedState extends PaymentState {}