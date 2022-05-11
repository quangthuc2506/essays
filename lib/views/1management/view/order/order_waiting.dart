import 'package:essays/models/product.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/views/1management/model/order.dart';
import 'package:essays/views/1management/viewmodel/order_repository/order_repository.dart';
import 'package:flutter/material.dart';

class OrderWaitingScreen extends StatefulWidget {
  const OrderWaitingScreen({Key? key}) : super(key: key);

  @override
  State<OrderWaitingScreen> createState() => _OrderWaitingScreenState();
}

class _OrderWaitingScreenState extends State<OrderWaitingScreen> {
  final _orderRepo = OrderRepository();
  final _productRepo = ProductRepository();
  List<Order> _listOrder = [];
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
    print('length1: ${_listOrder.length}');
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
            itemCount: _listOrder.length,
            itemBuilder: (context, index) {
              Order order = _listOrder[index];

              return Column(
                children: [
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Đơn hàng: ${order.orderId}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                'Địa chỉ: ${order.address}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Text('Ghi chú: ${order.note}')
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Huỷ',
                        ),
                        style: ElevatedButton.styleFrom(
                            onPrimary: Colors.red,
                            primary: Colors.white,
                            elevation: 0,
                            fixedSize: const Size(40, 30),
                            side:
                                const BorderSide(width: 1, color: Colors.red)),
                      ),
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
                      ),
                    ],
                  )
                ],
              );
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            alignment: Alignment.topCenter,
            color: Colors.grey[300],
            child: const Text('Bạn đã xem hết danh sách'),
          )
        ],
      ),
    );
  }

  void returnListOrder() {
    _orderRepo.getAllOrder().listen((pros) async {
      _listOrder = pros;
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
