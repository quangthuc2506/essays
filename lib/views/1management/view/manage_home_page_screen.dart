import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/model/menu_model.dart';
import 'package:essays/views/1management/model/order.dart';
import 'package:essays/views/1management/model/order_details.dart';
import 'package:essays/views/1management/view/manage_main_page_screen.dart';
import 'package:essays/views/1management/view/order/order_screen.dart';
import 'package:essays/views/1management/view/product/add_new_product.dart';
import 'package:essays/views/1management/view/staff/management_staff.dart';
import 'package:essays/views/1management/viewmodel/order_repository/order_repository.dart';
import 'package:essays/views/products/moneyFormat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManageHomeScreen extends StatefulWidget {
  const ManageHomeScreen({Key? key}) : super(key: key);

  @override
  State<ManageHomeScreen> createState() => _ManageHomeScreenState();
}

class _ManageHomeScreenState extends State<ManageHomeScreen> {
  final GlobalKey _key = GlobalKey();
  double width = 0;
  List<Order> _listOrder = [];
  int _chuaXanNhan = 0;
  int _donOnline = 0;
  int _donTaiban = 0;
  final _orderRepo = OrderRepository();
  @override
  void initState() {
    getAllOrders();
    super.initState();
  }

  void getAllOrders() async {
    _listOrder = await _orderRepo.getOrders2();
    print('--- ${_listOrder.length}');
    for (Order o in _listOrder) {
      if (o.address == 'tại quán') {
        _donTaiban++;
      } else {
        _donOnline++;
      }
      if (o.status == 'Chờ xác nhận') {
        _chuaXanNhan++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int turnover = 0;

    print('online: ${_listOrder.length}');
    print('tai ban: $_donTaiban');

    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff299BFE),
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Tổng quan'),
          leading: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(top: AppBar().preferredSize.height),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.backgroundAppbar,
                  ),
                  alignment: Alignment.topCenter)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('orderDetails')
                        .where('status', isEqualTo: 'Đã giao')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        for (dynamic o in snapshot.data!.docs) {
                          Map<String, dynamic> map =
                              o.data() as Map<String, dynamic>;
                          OrderDetails s = OrderDetails.fromSnapshot(o);
                          turnover += s.price!;
                        }
                      }

                      return Card(
                        elevation: 10,
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'DOANH THU',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ManageMainPageScreen(
                                                    currentIndex: 3,
                                                  )));
                                    },
                                    child: Row(
                                      children: const [
                                        Text(
                                          'Xem chi tiết',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: Colors.blue,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text('${moneyFormat(turnover.toString())} đ',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700)),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Đơn online',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      Text(_donOnline.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Đơn tại bàn',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      Text(_donTaiban.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Đơn mới',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                      Text(_chuaXanNhan.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 25, top: 20, right: 20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: menuList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.8,
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          switch (menuList[index].id) {
                            case 1:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrderScreen(
                                            initial: 0,
                                          )));
                              break;
                            case 2:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageMainPageScreen(
                                            currentIndex: 1,
                                          )));
                              break;
                            case 3:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageMainPageScreen(
                                            currentIndex: 2,
                                          )));
                              break;
                            case 4:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddNewProductScreen()));
                              break;
                            case 5:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const StaffManagementScreen()));
                              break;
                            case 6:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageMainPageScreen(
                                            currentIndex: 3,
                                          )));
                              break;
                            case 7:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageMainPageScreen(
                                            currentIndex: 3,
                                          )));
                              break;
                            case 8:
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManageMainPageScreen(
                                            currentIndex: 3,
                                          )));
                              break;
                            default:
                              break;
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: menuList[index].color,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                  child: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: menuList[index].icon)),
                            ),
                            SizedBox(
                              width: 50,
                              child: Text(
                                menuList[index].content,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 10),
                  width: width,
                  child: const Image(
                    image: AssetImage(AppAssets.banner123),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Đơn hàng chờ xử lý',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(
                      left: 15, top: 10, right: 15, bottom: 15),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const StaffManagementScreen()));
                        },
                        leading: const Icon(
                          Icons.fact_check_rounded,
                          color: Color(0xff299BFE),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('Bàn đang đặt'), Text('0')],
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderScreen(
                                        initial: 0,
                                      )));
                        },
                        leading: const Icon(
                          Icons.fact_check_rounded,
                          color: Color(0xff299BFE),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('Chờ duyệt'), Text('0')],
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.fact_check_rounded,
                          color: Color(0xff299BFE),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('Chờ thanh toán'), Text('0')],
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.fact_check_rounded,
                          color: Color(0xff299BFE),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('Chờ lấy hàng'), Text('0')],
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.fact_check_rounded,
                          color: Color(0xff299BFE),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('Đang giao hàng'), Text('0')],
                        ),
                        trailing:
                            const Icon(Icons.keyboard_arrow_right_rounded),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
