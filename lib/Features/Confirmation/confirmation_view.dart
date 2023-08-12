import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfirmationView extends StatefulWidget {
  const ConfirmationView({Key? key, required this.amount}) : super(key: key);
  final String amount;
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
      body: WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeIn,
                child: paymentSuccessful
                    ? Lottie.asset(
                        'assets/success_animation.json',
                        height: 250,
                        repeat: false,
                      )
                    : Lottie.asset(
                        'assets/loading_animation.json',
                        repeat: true,
                        height: 250,
                      ),
              ),
              const SizedBox(height: 24),
              Text(
                paymentSuccessful
                    ? 'Payment Successful'
                    : 'Paying ₹ ${widget.amount} to Curie',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: paymentSuccessful
                      ? TransactionDetails(amount: widget.amount)
                      : SizedBox.shrink()),

            ],
          ),
        ),
      ),
    );
  }
}

class TransactionDetails extends StatelessWidget {
  final String amount;
  const TransactionDetails({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '₹ ${amount} Paid',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Curie Money',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'HireMe@Curie.Money',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text("Done")),
      ],
    );
  }
}
