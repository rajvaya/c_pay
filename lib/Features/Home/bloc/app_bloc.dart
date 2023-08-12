import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<InitiatePaymentEvent>(navigateToPaymentView);
  }

  FutureOr<void> navigateToPaymentView(
      InitiatePaymentEvent event, Emitter<AppState> emit) {
    emit(NavigateToPaymentViewActionState());
  }

}
