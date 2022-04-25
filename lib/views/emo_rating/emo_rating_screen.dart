import 'package:essays/widgets/logo_widget.dart';
import 'package:essays/views/emo_rating/star_bar_widget.dart';
import 'package:flutter/material.dart';

class EmoRating extends StatelessWidget {
  const EmoRating({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const Padding(
            padding: EdgeInsets.only(top: 35),
            child: Logo(),
          ),
          const Text(
            'How was your shole experience?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          const Starbar(),
          const SizedBox(height: 50,),
          ElevatedButton(onPressed: (){}, child: const Text('Submit'),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff0a0a0a),
            onPrimary: const Color(0xff95ae45),
            fixedSize: const Size(121, 44)
          ),
          ),
          const SizedBox(
            height: 40,
          )
        ]),
      ),
    );
  }
}
