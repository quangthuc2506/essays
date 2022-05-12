import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  double width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Hoạt động kinh doanh',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.45,
                margin: const EdgeInsets.only(right: 5, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Icon(
                          Icons.shopify_sharp,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                      VerticalDivider(
                          width: 2, thickness: 1, color: Colors.grey.shade400),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 5, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Doanh thu:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '12.375.000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Lợi nhuận:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '7.525.000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width * 0.45,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Icon(
                          Icons.phone_android_rounded,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                      VerticalDivider(
                          width: 2, thickness: 1, color: Colors.grey.shade400),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 5, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Online:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '44',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Doanh thu:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '4.125.000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.45,
                margin: const EdgeInsets.only(right: 5, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Icon(
                          Icons.table_restaurant,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                      VerticalDivider(
                          width: 2, thickness: 1, color: Colors.grey.shade400),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 5, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Tại bàn:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '65',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Doanh thu:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '8.250.000',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width * 0.45,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Icon(
                          Icons.bar_chart,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                      VerticalDivider(
                          width: 2, thickness: 1, color: Colors.grey.shade400),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 5, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Tăng trưởng:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '23%',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Nhật ký:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.note_alt_outlined),
                  title: Text('Bán hàng'),
                  subtitle: Text('Bán hàng: +100.000 đ'),
                ),
                Divider(thickness: 2,height: 2,indent: 20,endIndent: 20,),
                ListTile(
                  leading: Icon(Icons.note_alt_outlined),
                  title: Text('Thêm vào kho'),
                  subtitle: Text('Thêm 5 Pepsi'),
                ),
                Divider(thickness: 2,height: 2,indent: 20,endIndent: 20,),
                ListTile(
                  leading: Icon(Icons.note_alt_outlined),
                  title: Text('Thêm vào kho'),
                  subtitle: Text('Thêm 10 Coca'),
                ),
                Divider(thickness: 2,height: 2,indent: 20,endIndent: 20,),ListTile(
                  leading: Icon(Icons.note_alt_outlined),
                  title: Text('Bán hàng'),
                  subtitle: Text('Bán hàng: +200.000 đ'),
                ),
                Divider(thickness: 2,height: 2,indent: 20,endIndent: 20,)
              ],
            ),
          )

          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: const ScrollPhysics(),
          //   itemCount: 4,
          //   itemBuilder: (context, index) {
          //     return const ListTile(
          //       leading: Icon(Icons.note_alt_outlined),
          //       title: Text('Bán hàng'),
          //       subtitle: Text('Bán hàng: +100.000 đ'),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
