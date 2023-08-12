import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Confirmation/confirmation_view.dart';
import '../Home/bloc/app_bloc.dart';
import 'Widgets/upi_header.dart';
import 'Widgets/upi_keyboard.dart';
import 'Widgets/upi_pin_input.dart';
import 'bloc/upi_bloc.dart';

class UpiView extends StatelessWidget {
  final String amount;
  const UpiView({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    return BlocProvider(
      create: (context) => UpiBloc(),
      child: BlocConsumer<UpiBloc, UpiState>(
          listenWhen: (prev, current) => true,
          buildWhen: (prev, current) => true,
        listener: (context, state) {
            if (state.runtimeType == DoneKeyPressedState && state.upiPin.length == appBloc.getPinSize()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ConfirmationView(amount:amount)),
            );
          }
        },
        builder: (context, state) {
          final UpiBloc upiBloc = BlocProvider.of<UpiBloc>(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UpiHeader(amount:amount),
                  SizedBox(height: 60),
                  UpiPinInput(),
                  Spacer(),
                  UpiKeyboard(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
