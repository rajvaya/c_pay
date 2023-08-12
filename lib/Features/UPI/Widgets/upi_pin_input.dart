import 'package:c_pay/Features/Home/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/upi_bloc.dart';

class UpiPinInput extends StatelessWidget {
  const UpiPinInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UpiBloc upiBloc = BlocProvider.of<UpiBloc>(context);
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ENTER UPI PIN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54,
                    ),
                  ),
                  Spacer(),
                  TextButton.icon(
                      onPressed: () {
                        upiBloc.add(VisibilityToggleClicked());
                      },
                      icon: Icon(
                          upiBloc.state.isPinVisiable
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xFF1A317F)),
                      label: Text(
                        upiBloc.state.isPinVisiable ? "HIDE" : "SHOW",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A317F),
                        ),
                      )),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(appBloc.getPinSize(),
                    (index) => Pin(index: index, upiBloc: upiBloc)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Pin extends StatelessWidget {
  final int index;
  final UpiBloc upiBloc;
  const Pin({Key? key, required this.index, required this.upiBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: Builder(builder: (context) {
          if (index < upiBloc.state.upiPin.length) {
            if (upiBloc.state.isPinVisiable) {
              return Text(
                upiBloc.state.upiPin[index],
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              );
            } else {
              return const Icon(Icons.circle,
                  size: 20, color: Color(0xFF1A317F));
            }
          } else {
            return Icon(
              Icons.horizontal_rule_rounded,
              size: 50,
              weight: 0.1,
              color: index == upiBloc.state.upiPin.length
                  ? Colors.black87
                  : Colors.grey,
            );
          }
        }),
      ),
    );
  }
}
