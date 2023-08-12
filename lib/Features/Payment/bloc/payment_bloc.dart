import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<AmountConfirmedButtonPressed>(doAmountConfirmation);
    on<AmountInputFocused>(makeUserAmountEditable);
    on<InitiateUpi>(navigateToUpiView);
  }



  FutureOr<void> doAmountConfirmation(AmountConfirmedButtonPressed event, Emitter<PaymentState> emit) {
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

  FutureOr<void> makeUserAmountEditable(AmountInputFocused event, Emitter<PaymentState> emit) {
    emit(UserInputState());
  }

  FutureOr<void> navigateToUpiView(InitiateUpi event, Emitter<PaymentState> emit) {
    emit(NavigateToUpiViewActionState());
  }
}
