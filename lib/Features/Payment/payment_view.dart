import 'package:c_pay/Features/Payment/bloc/payment_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../UPI/upi_view.dart';
import 'Widgets/amount_input.dart';
import 'Widgets/bottomSheet.dart';
import 'Widgets/payment_details.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: BlocConsumer<PaymentBloc, PaymentState>(
        listenWhen: (prev, current) => true,
        listener: (context, state) {
          if (state is NavigateToUpiViewActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpiView(amount: amountController.text,)),
            );
          }
        },
        builder: (context, state) {
          final PaymentBloc paymentBloc = BlocProvider.of<PaymentBloc>(context);
          return Scaffold(
            backgroundColor: Colors.blueAccent,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                    Icons.arrow_back, size: 32, color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_rounded,
                      size: 32, color: Colors.white),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const PaymentDetails(),
                  AmountInput(controller: amountController),
                  const Expanded(child: SizedBox()),
                  PaymentBottomSheet(paymentBloc: paymentBloc),
                ],
              ),
            ),
            floatingActionButton: Visibility(
              visible: paymentBloc.state is! AmountConfirmedState,
              child: FloatingActionButton(
                onPressed: () {
                  if(amountController.text.length > 0){
                  paymentBloc
                      .add(AmountConfirmedButtonPressed(amountController.text));
                  }
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          );
        },
      ),
    );
  }
}

