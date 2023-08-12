
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Confirmation/confirmation_view.dart';
import 'Widgets/upi_header.dart';
import 'Widgets/upi_keyboard.dart';
import 'Widgets/upi_pin_input.dart';
import 'bloc/upi_bloc.dart';

class UpiView extends StatefulWidget {
  const UpiView({Key? key}) : super(key: key);

  @override
  State<UpiView> createState() => _UpiViewState();
}

class _UpiViewState extends State<UpiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UpiBloc(),
        child: BlocConsumer<UpiBloc,  UpiState>(
          listener: (context, state) {
            if(state.runtimeType == DoneKeyPressedState){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConfirmationView()),
            );
            }
          },
          builder: (context, state) {
            return const SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UpiHeader(),
                  SizedBox(height: 60),
                  UpiPinInput(),
                  Spacer(),
                  UpiKeyboard(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
