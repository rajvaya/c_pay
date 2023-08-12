import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/payment_bloc.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({
    super.key,
    required this.paymentBloc,
  });

  final PaymentBloc paymentBloc;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: paymentBloc.state is AmountConfirmedState,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(
              vertical: 24, horizontal: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.money_rounded,
                    color: Colors.black,
                    size: 32,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Cuire Bank',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.black,
                    size: 32,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              MaterialButton(
                onPressed: () {
                  paymentBloc.add(InitiateUpi());
                },
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 16),
                minWidth: double.infinity,
                child: const Text(
                  'Proceed to pay',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color(0xFFb8b8b8),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: 'IN PARTNERSHIP WITH  ',
                      ),
                      WidgetSpan(
                        child: Icon(Icons.currency_rupee,
                            color: Colors.black, size: 12),
                      ),
                      TextSpan(
                        text: ' Curie UPI',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
