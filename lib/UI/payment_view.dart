import 'package:c_pay/UI/Widgets/amount_input.dart';
import 'package:c_pay/UI/upi_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import 'UPI/upi_view.dart';
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
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    return BlocConsumer<AppBloc, AppState>(
      listenWhen: (prev , current) => current is AppActionState,
      listener: (context,state){
        if(state is NavigateToUpiViewActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  UpiView()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.blueAccent,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 32, color: Colors.white),
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
            Visibility(
              visible: appBloc.state is AmountConfirmedState,
                child:
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
                            'Bank Name',
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
                          appBloc.add(InitiateUpi());
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
                                text: 'IN PARTNERSHIP WITH ',
                              ),
                              WidgetSpan(
                                child: Icon(Icons.square,
                                    color: Colors.black, size: 12),
                              ),
                              TextSpan(
                                text: 'Curie UPI',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          floatingActionButton: Visibility(
            visible: appBloc.state is! AmountConfirmedState,
            child: FloatingActionButton(
              onPressed: () {
              appBloc.add(AmountConfirmedButtonPressed(amountController.text));
              },
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        );
      },

    );
  }
}
