import 'package:c_pay/UI/UPI/Widgets/up_pin_input.dart';
import 'package:c_pay/UI/UPI/Widgets/upi_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpiView extends StatelessWidget {
  const UpiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UpiHeader(),
            SizedBox(height: 60),
            UpiPinInput()
          ],
        ),
      ),
    );
  }
}
