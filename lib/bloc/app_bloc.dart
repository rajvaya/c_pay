import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<InitiatePaymentEvent>(navigateToPaymentView);
    on<AmountConfirmedButtonPressed>(doAmountConfirmation);
    on<AmountInputFocused>(makeUserAmountEditable);
    on<InitiateUpi>(navigateToUpiView);
  }

  FutureOr<void> navigateToPaymentView(
      InitiatePaymentEvent event, Emitter<AppState> emit) {
    emit(NavigateToPaymentViewActionState());
  }

  FutureOr<void> doAmountConfirmation(AmountConfirmedButtonPressed event, Emitter<AppState> emit) {
    if(event.amount == "" || event.amount =="0")
    {
     emit(AmountErrorState("Payment must be at least ₹1"));
    }
    else if( int.parse(event.amount)>10000000){
      emit(AmountErrorState("Payment Can't be more more then ₹ 1,00,00,000"));
    }
    else {
      FocusManager.instance.primaryFocus?.unfocus();
      emit(AmountConfirmedState());
    }
  }

  FutureOr<void> makeUserAmountEditable(AmountInputFocused event, Emitter<AppState> emit) {
    emit(UserInputState());
  }

  FutureOr<void> navigateToUpiView(InitiateUpi event, Emitter<AppState> emit) {
    emit(NavigateToUpiViewActionState());
  }
}
