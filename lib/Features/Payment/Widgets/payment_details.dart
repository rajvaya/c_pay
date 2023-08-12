import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Column(
      children: [
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage:  NetworkImage("https://picsum.photos/251"),
                radius: 32,
              ),
            ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward_ios_outlined , color: Colors.white,size: 16,),
              ),
            CircleAvatar(
              radius: 34,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage:  NetworkImage("https://picsum.photos/250/"),
                radius: 32,
              ),
            ),

          ],
        ),
        SizedBox(height: 8),
        Text("Payment to red bus \n (HireMe@CuireBank)" , style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16
        ), textAlign: TextAlign.center, )
      ],
    );
  }
}
