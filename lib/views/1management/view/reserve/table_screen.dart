import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/view/reserve/details_table_screen.dart';
import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage(AppAssets.backgroundAppbar),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        title: const Text("Danh sách bàn"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: 16,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsTableScreen(index: index+1,)));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppAssets.table_reserve
                        ),
                      ),
                      Text("Bàn ${index + 1}", style: const TextStyle(fontWeight: FontWeight.w600),),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
