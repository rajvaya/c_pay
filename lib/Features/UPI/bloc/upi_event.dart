part of 'upi_bloc.dart';

@immutable
abstract class UpiEvent {}

class KeyboardButtonClicked extends UpiEvent{
  final UpiKeyboardKey upiKey;
  KeyboardButtonClicked(this.upiKey);
}

class VisibilityToggleClicked extends UpiEvent{}