import 'package:essays/values/app_assets.dart';
import 'package:flutter/material.dart';

class Starbar extends StatefulWidget {
  const Starbar({Key? key}) : super(key: key);
  @override
  State<Starbar> createState() => _StarbarState();
}

class _StarbarState extends State<Starbar> {
  var _myStarOne = Icons.star_border;
  var _myStarTwo = Icons.star_border;
  var _myStarThree = Icons.star_border;
  var _myStarFour = Icons.star_border;
  var _myStarFive = Icons.star_border;
  dynamic imageRating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 145,
            height: 145,
            margin: const EdgeInsets.only(top: 30, bottom: 40),
            child: imageRating,
          ),
          SizedBox(
            height: 20.0,
            width: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(_myStarOne),
                  onPressed: () => setState(() {
                    imageRating = const Image(
                      image: AssetImage(AppAssets.star1),
                    );
                    _myStarOne = Icons.star;
                    _myStarTwo = Icons.star_border;
                    _myStarThree = Icons.star_border;
                    _myStarFour = Icons.star_border;
                    _myStarFive = Icons.star_border;
                  }),
                  color: Colors.green,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(_myStarTwo),
                  onPressed: () => setState(() {
                    imageRating =
                        const Image(image: AssetImage(AppAssets.star2));

                    _myStarOne = Icons.star;
                    _myStarTwo = Icons.star;
                    _myStarThree = Icons.star_border;
                    _myStarFour = Icons.star_border;
                    _myStarFive = Icons.star_border;
                  }),
                  color: Colors.green,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(_myStarThree),
                  onPressed: () => setState(() {
                    imageRating =
                        const Image(image: AssetImage(AppAssets.star3));

                    _myStarOne = Icons.star;
                    _myStarTwo = Icons.star;
                    _myStarThree = Icons.star;
                    _myStarFour = Icons.star_border;
                    _myStarFive = Icons.star_border;
                  }),
                  color: Colors.green,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(_myStarFour),
                  onPressed: () => setState(() {
                    imageRating =
                        const Image(image: AssetImage(AppAssets.star4));

                    _myStarOne = Icons.star;
                    _myStarTwo = Icons.star;
                    _myStarThree = Icons.star;
                    _myStarFour = Icons.star;
                    _myStarFive = Icons.star_border;
                  }),
                  color: Colors.green,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(_myStarFive),
                  onPressed: () => setState(() {
                    imageRating =
                        const Image(image: AssetImage(AppAssets.star5));
                    _myStarOne = Icons.star;
                    _myStarTwo = Icons.star;
                    _myStarThree = Icons.star;
                    _myStarFour = Icons.star;
                    _myStarFive = Icons.star;
                  }),
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
