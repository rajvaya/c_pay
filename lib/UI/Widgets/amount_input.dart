import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountInput extends StatelessWidget {
  const AmountInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: TextField(
        keyboardType: TextInputType.number,
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
            prefixText: '\₹',
            prefixStyle: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            border: InputBorder.none,
          isCollapsed: true,
        ),

      ),
    );
  }
}
