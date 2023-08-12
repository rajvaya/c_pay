part of 'upi_bloc.dart';

@immutable
abstract class UpiState {
  final String upiPin;
  final bool showPin;
  const UpiState(this.upiPin, this.showPin);}


class UpiInitial extends UpiState {
  const UpiInitial(super.upiPin, super.showPin);

}
class NumberKeyPressedState extends UpiState {
  const NumberKeyPressedState(super.upiPin, super.showPin);
}
class BackKeyPressedState extends UpiState {
  const BackKeyPressedState(super.upiPin, super.showPin);
}
class DoneKeyPressedState extends UpiState {
  const DoneKeyPressedState(super.upiPin, super.showPin);
}
 class VisibilityToggleState extends UpiState {
  const VisibilityToggleState(super.upiPin, super.showPin);
 }



