import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/payment_bloc.dart';


class AmountInput extends StatelessWidget {
  final TextEditingController controller;
  const AmountInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PaymentBloc paymentBloc = BlocProvider.of<PaymentBloc>(context);
    return IntrinsicWidth(
      child: TextField(
        keyboardType:  const TextInputType.numberWithOptions(
          decimal: true,
          signed: false,
        ),
        controller: controller,
        autofocus: true,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
            fontSize: 60, color: Colors.white, fontWeight: FontWeight.w400),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
            hintText: '0',
            hintStyle: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w400,
              color: Colors.white38,
            ),
            prefixText: '₹',
            prefixStyle: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            border: InputBorder.none,
          isCollapsed: true,
        ),
        onTap: (){
          paymentBloc.add(AmountInputFocused());
        },

      ),
    );
  }
}
