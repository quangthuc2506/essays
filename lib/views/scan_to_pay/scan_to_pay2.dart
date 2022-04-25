import 'package:essays/views/scan_to_pay/card_your_dish_widget.dart';
import 'package:essays/widgets/button_black_green.dart';
import 'package:essays/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class ScanToPay2 extends StatelessWidget {
  const ScanToPay2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:022 ),
          child: Column(
            children:  [
              const Padding(
                padding: EdgeInsets.only(top: 50, bottom: 10),
                child: Logo(),
              ),
              const Text(
                'Your Dishes',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20,),
              const CardYourDish(),
              const CardYourDish(),
              const CardYourDish(),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  const [
                    Text("Total",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                    SizedBox(width: 30,),
                    Text("\$117",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              ButtonBlackGreen(text: "Pay Now")..width=130
            ],
          ),
        ),
      ),
    );
  }
}
