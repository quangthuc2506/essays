import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/model/order.dart';
import 'package:flutter/material.dart';

class OrderDetailsInOrderTab extends StatelessWidget {
  Order order;
  OrderDetailsInOrderTab({Key? key, required this.order}) : super(key: key);
  final ProductRepository _repository = ProductRepository();
  void getProduct(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage(AppAssets.backgroundAppbar),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        title: const Text("Đơn hàng"),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('orderDetails')
                .where('orderId', isEqualTo: order.orderId)
                .snapshots(),
            builder: (context, snapshot){
              Map<String, dynamic>? mapOrder;
              if (snapshot.data != null) {
                for (dynamic o in snapshot.data!.docs) {
                  mapOrder = o.data() as Map<String, dynamic>;
                  print('====================');
                  print(snapshot.data!.size);
                }
              }
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.article),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mã đơn hàng: ${order.orderId}'),
                            Text('Người đặt: ${order.customerId}'),
                            Text('Ngày đặt hàng: ${order.date}')
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('user')
                            .where('email', isEqualTo: order.customerId)
                            .snapshots(),
                        builder: (context, snapshot) {
                          Map<String, dynamic>? mapUser;
                          if (snapshot.data != null) {
                            for (dynamic o in snapshot.data!.docs) {
                              mapUser = o.data() as Map<String, dynamic>;
                            }
                          }
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.location_on_outlined),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Thông tin người nhận'),
                                  Text(mapUser != null ? mapUser['email'] : ''),
                                  Text(mapUser != null
                                      ? mapUser['phoneNumber']
                                      : ''),
                                  Text(
                                      mapUser != null ? mapUser['address'] : '')
                                ],
                              )
                            ],
                          );
                        }),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        const Icon(Icons.note_alt_outlined),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [const Text('Ghi chú'), Text(order.note!)],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.receipt_long_outlined),
                            Text('Các sản phẩm')
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.hasData ? snapshot.data!.size : 0,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                const SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: Image(image: AssetImage(AppAssets.cheeseBurger),),
                                ),
                                Column(
                                  children: const [
                                    Text('Cheese Burger'),
                                    Text('x1 60000 đ')
                                  ],
                                )
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
      bottomSheet: Container(
        height: 65,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Divider(
              height: 0,
              thickness: 1,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Xác nhận đơn'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.green,
                    elevation: 0,
                    side: const BorderSide(width: 1)),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
              ),
            )
          ],
        ),
      ),
    );
  }
}
