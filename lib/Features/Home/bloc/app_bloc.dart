import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  int _selectedPinSize = 4;
  AppBloc() : super(AppInitial(4)) {
    on<InitiatePaymentEvent>(navigateToPaymentView);
  }

  FutureOr<void> navigateToPaymentView(
      InitiatePaymentEvent event, Emitter<AppState> emit) {
    emit(NavigateToPaymentViewActionState());
  }

  void setPinSize(int size) {
    _selectedPinSize = size;
    emit(PinToggled());
  }

  int getPinSize() => _selectedPinSize;
}
