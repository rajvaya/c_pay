import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Payment/payment_view.dart';
import 'bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    return Scaffold(
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          if (state is NavigateToPaymentViewActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentView()),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Select UPI PIN Length",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                RadioListTile<String>(
                  title: Text('4-digit PIN'),
                  value: '4',
                  groupValue: appBloc.getPinSize().toString(),
                  onChanged: (value) {
                    appBloc.setPinSize(int.parse(value!));
                  },
                ),
                RadioListTile<String>(
                  title: Text('6-digit PIN'),
                  value: '6',
                  groupValue: appBloc.getPinSize().toString(),
                  onChanged: (value) {
                    appBloc.setPinSize(int.parse(value!));
                  },
                ),
                SizedBox(height: 20),
                FilledButton(
                    onPressed: () {
                      appBloc.add(InitiatePaymentEvent());
                    },
                    child: const Text("Open Curie pay")),
              ],
            ),
          );
        },
      ),
    );
  }
}
