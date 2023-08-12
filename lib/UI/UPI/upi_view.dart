import 'package:c_pay/UI/UPI/Widgets/upi_pin_input.dart';
import 'package:c_pay/UI/UPI/Widgets/upi_header.dart';
import 'package:c_pay/UI/UPI/bloc/upi_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widgets/upi_keyboard.dart';

class UpiView extends StatelessWidget {
  const UpiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpiBloc(),
      child: BlocConsumer<UpiBloc, UpiState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
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
            ),
          );
        },
      ),
    );
  }
}
