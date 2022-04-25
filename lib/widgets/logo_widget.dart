import 'package:essays/values/app_assets.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 49,
          height: 60,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.logo))
          ),
        ),
        const Text("Thuc's", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Color(0xff95ae45)),),
        const Text("Restaunrant", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Color(0xff95ae45)),)
      ],
    );
  }
}