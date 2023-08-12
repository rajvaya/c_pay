
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
        listenWhen: (prev , current) => current is AppActionState,
        listener: (context, state) {
         if(state is NavigateToPaymentViewActionState) {
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
                FilledButton(
                    onPressed: () {
                      appBloc.add(InitiatePaymentEvent());
                    },
                    child: Text("Open Cpay")),
              ],
            ),
          );
        },
      ),
    );
  }
}
