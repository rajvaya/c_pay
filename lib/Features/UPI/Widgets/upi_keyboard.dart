import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../enums.dart';
import '../bloc/upi_bloc.dart';

class UpiKeyboard extends StatefulWidget {
  const UpiKeyboard({Key? key}) : super(key: key);

  @override
  State<UpiKeyboard> createState() => _UpiKeyboardState();
}

class _UpiKeyboardState extends State<UpiKeyboard> {
  @override
  Widget build(BuildContext context) {

    return GridView.count(crossAxisCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      childAspectRatio: 1.8,
      physics: const NeverScrollableScrollPhysics(),
      // children: List.generate(12, (index) => NumberButton(upiKey: UpiKeyboardKey.back)),
      children: UpiKeyboardKey.values.map((key) => KeyButton(upiKey: key)).toList() ,
    );
  }
}


class KeyButton extends StatelessWidget {
  final UpiKeyboardKey upiKey;
  const KeyButton({super.key, required this.upiKey});
  @override
  Widget build(BuildContext context) {
    final UpiBloc upiBloc = BlocProvider.of<UpiBloc>(context);
    return Material(
      color:  const Color(0xFFF0F0F1),
      child: InkWell(
        onTap: () {
          print(upiKey.numberAsString);
          upiBloc.add(KeyboardButtonClicked(upiKey));
        },
        child: Center(
          child: Builder(
            builder: (context) {
              if  (upiKey == UpiKeyboardKey.back) {
                return const Icon(
                  Icons.backspace,
                  size: 36,
                  color: Color(0xFF1A317F),
                );
              }
              if  (upiKey == UpiKeyboardKey.done) {
                return const Icon(
                  Icons.check_circle_rounded,
                  size: 44,
                  color: Color(0xFF1A317F),
                );
              }    return Text(upiKey.numberAsString,
                style: const TextStyle(
                  color: Color(0xFF1A317F),
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}