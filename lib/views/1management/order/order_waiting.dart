import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/model/order.dart';
import 'package:flutter/material.dart';

class OrrderWaiting extends StatefulWidget {
  const OrrderWaiting({Key? key}) : super(key: key);

  @override
  State<OrrderWaiting> createState() => _OrrderWaitingState();
}


class _OrrderWaitingState extends State<OrrderWaiting> {
  Stream<List<Order>> getAllOrders() async* {
  yield* FirebaseFirestore.instance
      .collection('orderDetails').where('status',isEqualTo: 'Chờ xác nhận')
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList();
  });
}
void getImageProduct() async{
  
}
  List<Order> listOrder = [];

  void returnListOrder() {
    getAllOrders().listen((pros) async {
      listOrder = pros;
      setState(() {});
    });
  }

  @override
  void initState() {
    returnListOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('length1: ${listOrder.length}');
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Divider(
            height: 15,
            thickness: 15,
            color: Colors.grey[300],
          ),
           Container(
             alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: const Text(
              'Chờ xác nhận',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff059505)),
            ),
          ),
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: listOrder.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    height: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        width: 75,
                        height: 75,
                        child: const Image(
                            image: AssetImage(AppAssets.cheeseBurger)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Cheese Burger",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: const [
                                Text('Số lượng: 1',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey)),
                                VerticalDivider(
                                  thickness: 2,
                                  indent: 2,
                                  endIndent: 2,
                                ),
                                Text('99.000 đ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, left: 10, right: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Xem chi tiết',
                            ),
                            style: ElevatedButton.styleFrom(
                                onPrimary: const Color(0xff3AC5C8),
                                primary: Colors.white,
                                elevation: 0,
                                side: const BorderSide(
                                    width: 1, color: Color(0xff3AC5C8))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, left: 10, right: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Xác nhận',
                            ),
                            style: ElevatedButton.styleFrom(
                                onPrimary: const Color(0xff3AC5C8),
                                primary: Colors.white,
                                elevation: 0,
                                side: const BorderSide(
                                    width: 1, color: Color(0xff3AC5C8))),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              minHeight: 100,
            ),
            child: Container(
              width: 1000,
              height: 1000,
              padding: const EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              color: Colors.grey[300],
              child: const Text('Bạn đã xem hết danh sách'),
            ),
          )
        ],
      ),
    );
  }
}
