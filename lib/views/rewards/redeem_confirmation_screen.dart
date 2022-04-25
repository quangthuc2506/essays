import 'package:essays/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class RedeemConfirmation extends StatelessWidget {
  const RedeemConfirmation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: const [
          Logo()
        ],
      ),
    );
  }
}