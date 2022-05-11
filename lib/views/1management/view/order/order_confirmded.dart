import 'package:essays/models/product.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/views/1management/model/order_details.dart';
import 'package:essays/views/1management/viewmodel/order_repository/order_repository.dart';
import 'package:essays/views/products/moneyFormat.dart';
import 'package:flutter/material.dart';

class OrderConfirmed extends StatefulWidget {
  const OrderConfirmed({Key? key}) : super(key: key);

  @override
  State<OrderConfirmed> createState() => _OrderConfirmedState();
}

class _OrderConfirmedState extends State<OrderConfirmed> {
  final _orderRepo = OrderRepository();
  final _productRepo = ProductRepository();
  List<OrderDetails> _listOrderDetails = [];
  List<Product> _listProduct = [];
  @override
  void initState() {
    getAllProduct();
    returnListOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _key = GlobalKey();
    print('length1: ${_listOrderDetails.length}');
    return SingleChildScrollView(
      key: _key,
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
            itemCount: _listOrderDetails.length,
            itemBuilder: (context, index) {
              OrderDetails order = _listOrderDetails[index];

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
                        child: Image(
                            image: NetworkImage(
                                getProductImage(order.productId!))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getProductName(order.productId!),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Text(order.amount.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey)),
                                const VerticalDivider(
                                  thickness: 2,
                                  indent: 2,
                                  endIndent: 2,
                                ),
                                Text(
                                    '${moneyFormat((order.amount! * order.price!)
                                        .toString())!} đ',
                                    style: const TextStyle(
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
          Container(
            
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.topCenter,
            color: Colors.grey[300],
            child: const Text('Bạn đã xem hết danh sách'),
          )
        ],
      ),
    );
  }

  void returnListOrder() {
    _orderRepo.getAllOrdersDetails().listen((pros) async {
      _listOrderDetails = pros;
      setState(() {});
    });
  }

  void getAllProduct() async {
    _listProduct = await _productRepo.getAllProduct2();
    setState(() {});
  }

  String getProductImage(String productId) {
    for (var e in _listProduct) {
      if (e.productId == productId) {
        return e.image;
      }
    }
    return '';
  }

  String getProductName(String productId) {
    for (var e in _listProduct) {
      if (e.productId == productId) {
        return e.productName;
      }
    }
    return '';
  }

  int getProductPrice(String productId) {
    for (var e in _listProduct) {
      if (e.productId == productId) {
        return e.price;
      }
    }
    return 0;
  }
}
