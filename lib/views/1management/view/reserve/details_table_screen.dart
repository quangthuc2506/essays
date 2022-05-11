import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/model/table_reserve.dart';
import 'package:essays/views/1management/view/reserve/Add_to_table.dart';
import 'package:essays/views/products/moneyFormat.dart';
import 'package:essays/widgets/create_id.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailsTableScreen extends StatefulWidget {
  int index;
  DetailsTableScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailsTableScreen> createState() => _DetailsTableScreenState();
}

class _DetailsTableScreenState extends State<DetailsTableScreen> {
  final ProductRepository _productRepository = ProductRepository();
  List<DinnerTable> listTable = [];
  List<Product> products = [];
  int total = 0;

  void getTables() async {
    listTable = await _productRepository.getAllTable(
        tableId: (widget.index));
    setState(() {});
  }

  void getAllProduct() {
    _productRepository.getAllProduct().listen((pros) async {
      products = pros;
      setState(() {});
    });
  }

  getTotal() {
    total = 0;
    for (DinnerTable d in listTable) {
      Product product = Product(
          categoryId: '',
          productId: '',
          productName: '',
          details: '',
          image: '',
          price: 0,
          review: '');
      for (Product p in products) {
        if (p.productId == d.productId) {
          product = p;
        }
      }
      total += d.amount! * product.price;
    }
    setState(() {});
  }

  @override
  void initState() {
    getTables();
    getAllProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getTotal();
    print(('index: ${listTable.length}'));
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage(AppAssets.backgroundAppbar),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text("Bàn ${widget.index}"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                listTable.isEmpty
                    ? "Bàn đang trống"
                    : "Trạng thái: đang phục vụ",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Danh sách các món đang phục phụ:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddToTableScreen(
                                    indexTable: widget.index,
                                  )));
                    },
                    child: const Text('Thêm món'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff3AC5C8),
                      onPrimary: Colors.white,
                      elevation: 0,
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              itemCount: listTable.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                Product product123 = Product(
                    categoryId: '',
                    productId: '',
                    productName: '',
                    details: '',
                    image: '',
                    price: 0,
                    review: '');

                for (Product p in products) {
                  if (p.productId == listTable[index].productId) {
                    product123 = p;
                  }
                }
                return Card(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          height: 75,
                          width: 75,
                          child: product123.image.isEmpty
                              ? const Icon(Icons.image)
                              : Image(image: NetworkImage(product123.image)),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            product123.productName,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Text(listTable[index].amount.toString()),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Text(product123.price.toString()),
                        )
                      ]),
                    ],
                  ),
                );
              },
            ),
            Container(
                padding: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: Text('Tổng cộng: ${moneyFormat(total.toString())} đ',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 95,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Divider(
              height: 0,
              thickness: 1,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ElevatedButton(
                onPressed: () async {
                  final _firebaseFirestore = FirebaseFirestore.instance;
                  //// them data vao bang bill
                  String id = createId();
                  Map<String, dynamic> map = {
                    'orderId': id,
                    'customerId': FirebaseAuth.instance.currentUser!.email,
                    'date': FieldValue.serverTimestamp(),
                    'address': 'tại quán',
                    'status': 'Đã giao',
                    'note': 'tại quán',
                  };
                  await _firebaseFirestore.collection('order').doc(id).set(map);

                  ////them data vao bang billDetails
                  for (DinnerTable e in listTable) {
                    Product p = await _productRepository.getProductByProductId(
                        productId: e.productId!);
                    Map<String, dynamic> map1 = {
                      'orderId': id,
                      'amount': e.amount,
                      'price': p.price,
                      'productId': p.productId,
                      'status': 'Đã giao'
                    };
                    await _firebaseFirestore
                        .collection('orderDetails')
                        .add(map1);

                    ////xoá những sản phẩm đã đặt khỏi bàn
                    await _firebaseFirestore
                        .collection('tableNow')
                        .where('productId', isEqualTo: p.productId)
                        .get()
                        .then((querySnapshot) {
                      var batch = _firebaseFirestore.batch();
                      for (var element in querySnapshot.docs) {
                        batch.delete(element.reference);
                      }
                      return batch.commit();
                    }).then((value) => null);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Đã thanh toán'),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Thanh toán'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff3AC5C8),
                  onPrimary: Colors.white,
                  elevation: 0,
                ),
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
