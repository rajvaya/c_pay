part of 'upi_bloc.dart';

@immutable
abstract class UpiState {
  final String upiPin;
  final bool showPin;
  UpiState(this.upiPin, this.showPin);}


class UpiInitial extends UpiState {
  UpiInitial(super.upiPin, super.showPin);

}
class NumberKeyPressedState extends UpiState {
  NumberKeyPressedState(super.upiPin, super.showPin);
}
class BackKeyPressedState extends UpiState {
  BackKeyPressedState(super.upiPin, super.showPin);
}
class DoneKeyPressedState extends UpiState {
  DoneKeyPressedState(super.upiPin, super.showPin);
}
 class VisibilityToggleState extends UpiState {
  VisibilityToggleState(super.upiPin, super.showPin);
 }



