import 'package:essays/values/app_assets.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

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
        leading: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  const Icon(Icons.article),
                  Column(
                    children: const [
                      Text('Mã đơn hàng: 88987668777'),
                      Text('Người đặt'),
                      Text('Ngày đặt hàng: 21232, 2132')
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  Column(
                    children: const [
                      Text('Địa chỉ người nhận'),
                      Text('Nguyễn QuangThức'),
                      Text('0963255409'),
                      Text('Số nhà 20, 53/59/50, Ngoạ Long,...')
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  const Icon(Icons.note_alt_outlined),
                  Column(
                    children: const [
                      Text('Ghi chú'),
                      Text('Số nhà 20, 53/59/50, Ngoạ Long,...')
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                children: [
                  Row(
                    children: const [Icon(Icons.details), Text('Các sản phẩm')],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          const SizedBox(
                            width: 75,
                            height: 75,
                            child: Image(image: AssetImage(AppAssets.cheeseBurger)),
                          ),
                          Column(children: const [
                            Text('Cheese Burger'),
                            Text('x1 60000 đ')
                          ],)
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 65,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Divider(height: 0,thickness: 1,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: ElevatedButton(
                onPressed: (){},
                child: const Text('Xác nhận đơn'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.green,
                  elevation: 0,
                  side: const BorderSide(width: 1)
                ),
              ),
            ),
            const Divider(height: 0,thickness: 1,),
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
