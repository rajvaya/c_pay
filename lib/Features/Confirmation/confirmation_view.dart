import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfirmationView extends StatefulWidget {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> {
  bool paymentSuccessful = false;

  @override
  void initState() {
    super.initState();

    // Start the timer to change the payment status after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        paymentSuccessful = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paymentSuccessful ? Colors.blueAccent : Colors.white30,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: paymentSuccessful
                  ?  Lottie.asset(
                'assets/success_animation.json',
                height: 250,
                repeat: false
              )
                  :  Lottie.asset(
                'assets/loading_animation.json',
                repeat: true,
                height: 250,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              paymentSuccessful
                  ? 'Payment Successful'
                  : 'Paying 50 to Curie',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
           TransactionDetails(),
          ],
        ),
      ),
    );
  }
}

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          '350 Paid',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),

        ),     Text(
          'Curie Money',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),

        ),   Text(
          'HireMe@Curie.Money',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),

        ),

      ],
    );
  }
}
