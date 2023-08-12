import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_pay/enums.dart';
import 'package:meta/meta.dart';

part 'upi_event.dart';
part 'upi_state.dart';

class UpiBloc extends Bloc<UpiEvent, UpiState> {
  UpiBloc() : super(UpiInitial("",false)) {
    on<KeyboardButtonClicked>(handlerKeyPress);
    on<VisibilityToggleClicked>(handlerVisibilityToggle);
  }

  FutureOr<void> handlerKeyPress(KeyboardButtonClicked event, Emitter<UpiState> emit) {
    var upiPin = state.upiPin;
    var showPin = state.isPinVisiable;
    if(event.upiKey == UpiKeyboardKey.back) {
      if(upiPin.isNotEmpty){
      emit(BackKeyPressedState(upiPin.substring(0,upiPin.length -1),showPin));
      }
    }
    else if (event.upiKey == UpiKeyboardKey.done) {
      emit(DoneKeyPressedState(upiPin,showPin));
    }
    else{
      emit(NumberKeyPressedState(upiPin + event.upiKey.numberAsString,showPin));
    }
  }

  FutureOr<void> handlerVisibilityToggle(VisibilityToggleClicked event, Emitter<UpiState> emit) {
    emit(VisibilityToggleState(state.upiPin,!state.isPinVisiable));
  }
}
