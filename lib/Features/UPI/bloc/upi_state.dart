part of 'upi_bloc.dart';

@immutable
abstract class UpiState {
  final String upiPin;
  final bool isPinVisiable;
  UpiState(this.upiPin, this.isPinVisiable);
}

class UpiInitial extends UpiState {
  UpiInitial(String upiPin, bool showPin) : super(upiPin, showPin);
}

class NumberKeyPressedState extends UpiState {
  NumberKeyPressedState(String upiPin, bool showPin) : super(upiPin, showPin);
}

class BackKeyPressedState extends UpiState {
  BackKeyPressedState(String upiPin, bool showPin) : super(upiPin, showPin);
}

class DoneKeyPressedState extends UpiState {
  DoneKeyPressedState(String upiPin, bool showPin) : super(upiPin, showPin);
}

class VisibilityToggleState extends UpiState {
  VisibilityToggleState(String upiPin, bool showPin) : super(upiPin, showPin);
}
