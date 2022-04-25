import 'package:essays/values/app_assets.dart';
import 'package:flutter/material.dart';

class CardYourDish extends StatelessWidget {
  const CardYourDish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 16, top: 11, bottom: 11, right: 11),
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.salmonSalad))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Salmon Salad",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Food info",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ],
          ),
          const Text("x1"),
          const Text(
            "\$39",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 5)
        ],
      ),
    );
  }
}
