import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/values/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReserveScreen extends StatefulWidget {
  const ReserveScreen({Key? key}) : super(key: key);

  @override
  State<ReserveScreen> createState() => _ReserveScreenState();
}

class _ReserveScreenState extends State<ReserveScreen> {
  int amount = 1;
  String image = AppAssets.people1;
  TextEditingController noteController = TextEditingController();
  DateTime dateTime = DateTime.now();

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    print('date: $dateTime');
    switch (amount) {
      case 2:
        image = AppAssets.people2;
        break;
      case 3:
        image = AppAssets.people3;
        break;
      case 4:
        image = AppAssets.people4;
        break;
      case 5:
        image = AppAssets.people5;
        break;
      case 6:
        image = AppAssets.people6;
        break;
      case 7:
        image = AppAssets.people7;
        break;
      case 8:
        image = AppAssets.people8;
        break;
      default:
        image = AppAssets.people1;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff44CECA),
        elevation: 0,
        title: const Text(
          'Đặt bàn',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              child: Image(
                  image: AssetImage(AppAssets.reserveBanner), fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Đặt ngày: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Tháng ${dateTime.month}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff898989)),
                      )
                    ],
                  ),
                  CupertinoButton(
                    // Display a CupertinoDatePicker in date picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: dateTime,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        // This is called when the user changes the date.
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => dateTime = newDate);
                        },
                      ),
                    ),
                    // In this example, the date value is formatted manually. You can use intl package
                    // to format the value based on user's locale settings.
                    child: Text(
                      'Ngày ${dateTime.day} tháng ${dateTime.month} năm ${dateTime.year}',
                      style: const TextStyle(
                          fontSize: 22.0, color: Color(0xff44CECA)),
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Đặt giờ:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  CupertinoButton(
                    // Display a CupertinoDatePicker in date picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: dateTime,
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                        // This is called when the user changes the date.
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => dateTime = newDate);
                        },
                      ),
                    ),
                    // In this example, the date value is formatted manually. You can use intl package
                    // to format the value based on user's locale settings.
                    child: Text(
                      '${dateTime.hour} giờ ${dateTime.minute} phút',
                      style: const TextStyle(
                          fontSize: 22.0, color: Color(0xff44CECA)),
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Số người:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (amount > 1) {
                                setState(() {
                                  amount--;
                                });
                              }
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF0ECE6),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Icon(
                                  Icons.remove,
                                  color: Color(0xff44CECA),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              '$amount',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (amount < 8) {
                                setState(() {
                                  amount++;
                                });
                              }
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: const Color(0xffF0ECE6),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Icon(
                                  Icons.add,
                                  color: Color(0xff44CECA),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(image: AssetImage(image)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 5,
                    controller: noteController,
                    decoration: const InputDecoration(
                        label: Text('Ghi chú'),
                        floatingLabelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff44CECA))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff44CECA)))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      Map<String, dynamic> map = {
                        'email': FirebaseAuth.instance.currentUser!.email,
                        'time': dateTime,
                        'amount': amount,
                        'note': noteController.text,
                        'paid' : false
                      };
                      await FirebaseFirestore.instance
                          .collection('reserve')
                          .add(map);
                    },
                    icon: const Icon(Icons.verified),
                    label: const Text('Xác nhận'),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff44CECA)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
