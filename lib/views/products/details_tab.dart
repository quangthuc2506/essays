import 'package:essays/models/product.dart';
import 'package:flutter/material.dart';

class DetailsTab extends StatelessWidget {
  Product product;
  DetailsTab({Key? key, required this.product}) : super(key: key);
  String? moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    } else {
      return '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: 150,
              height: 150,
              child: Image(image: NetworkImage(product.image)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      moneyFormat(product.price.toString())!,
                      style: const TextStyle(color: Colors.black, height: 1),
                    ),
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        primary: Colors.red,
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ],
                )
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Product Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.')
          ],
        ),
      ),
    );
  }
}
