import 'package:flutter/material.dart';

class UpiPinInput extends StatelessWidget {
  const UpiPinInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              const Text(
              'ENTER UPI PIN',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
              Spacer(),
              TextButton.icon(onPressed: (){}, icon:
                  const Icon(Icons.visibility,color: Color(0xFF1A317F))
                  , label: const Text("SHOW",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A317F),
                    ),
                  )),
              Spacer(),
            ],)
        ],
      ),
    );
  }
}
