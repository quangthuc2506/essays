import 'package:essays/values/app_assets.dart';
import 'package:flutter/material.dart';

class DetailsTableScreen extends StatelessWidget {
  const DetailsTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage(AppAssets.backgroundAppbar),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back,color: Colors.white,)),
        title: const Text("Bàn 1"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Trạng thái: đang phục vụ"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Danh sách các món đang phục phụ'),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Thêm món'),
                      style: ElevatedButton.styleFrom(
                    primary: const Color(0xff3AC5C8),
                    onPrimary: Colors.white,
                    elevation: 0,),
                      )
                ],
              ),
            ),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
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
                          child: const Image(
                              image: AssetImage(AppAssets.cheeseBurger)),
                        ),
                        const Text('Cheese Burger'),
                      ]),
                      Row(children: const [
                        Text('7'),
                        
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          child: Text('400.000 đ'),
                        )
                      ]),
                    ],
                  ),
                );
              },
            ),
            Container(alignment: Alignment.center, child: const Text('Tổng cộng: 2400000đ')),
          ],
        ),
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
                child: const Text('Thạnh toán'),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff3AC5C8),
                    onPrimary: Colors.white,
                    elevation: 0,),
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
