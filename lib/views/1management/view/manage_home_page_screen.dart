import 'package:essays/views/1management/model/menu_model.dart';
import 'package:flutter/material.dart';

class ManageHomeScreen extends StatelessWidget {
  
  ManageHomeScreen({Key? key}) : super(key: key);
  final GlobalKey _key = GlobalKey();
  double width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          
          flexibleSpace: Container(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Tổng quan'),
          leading: const Icon(Icons.home),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(top: AppBar().preferredSize.height),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://c4.wallpaperflare.com/wallpaper/481/286/360/blue-curves-abstract-background-wallpaper-preview.jpg',
                  ),
                  alignment: Alignment.topCenter)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'DOANH THU NGÀY',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            Row(
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
                            )
                          ],
                        ),
                        const Text('0',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700)),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'Đơn online',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                Text('0',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  'Đơn tại bàn',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                Text('0',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  'Đơn mới',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                Text('0',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
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
                      return Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              menuList[index].icon,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: menuList[index].color,
                                borderRadius: BorderRadius.circular(50)),
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
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 10),
                  width: width,
                  child: const Image(
                    image: NetworkImage(
                        'https://blog.gosell.vn/wp-content/uploads/2020/05/banner_news-01.png'),
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
