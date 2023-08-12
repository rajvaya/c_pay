import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upi_event.dart';
part 'upi_state.dart';

class UpiBloc extends Bloc<UpiEvent, UpiState> {
  UpiBloc() : super(UpiInitial()) {
    on<UpiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
