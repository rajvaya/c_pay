import 'dart:async';
import 'dart:ffi';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {

  AppBloc() : super(AppInitial()) {
    on<InitiatePaymentEvent>(navigateToPaymentView);
    on<FloatingButtonPressed>(toggleBottomSheet);
    on<PTP>(PTPP);
  }

  FutureOr<void> navigateToPaymentView(InitiatePaymentEvent event, Emitter<AppState> emit) {
    emit(NavigateToPaymentViewActionState());
    emit(UserInputState());
  }

  FutureOr<void> toggleBottomSheet(FloatingButtonPressed event, Emitter<AppState> emit) {
    FocusManager.instance.primaryFocus?.unfocus();
    emit(UserInputDoneState());
  }

  FutureOr<void> PTPP(PTP event, Emitter<AppState> emit) {
    emit(ErrorState());
    emit(UserInputDoneState());
  }
}
