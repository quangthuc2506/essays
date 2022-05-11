import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/model/table_status.dart';
import 'package:essays/views/1management/view/reserve/details_table_screen.dart';
import 'package:flutter/material.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
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
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('table')
                    .orderBy("tableId", descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        Map<String, dynamic> map = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;

                        TableStatus s = TableStatus.fromSnapshot(
                            snapshot.data!.docs[index]);
                      

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsTableScreen(
                                          index: map['tableId'],
                                        )));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 75,
                                height: 75,
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(AppAssets.table_reserve),
                              ),
                              Text(
                                "Bàn ${map['tableId']}",
                                style:  TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: s.status == 'đang trống' ? Colors.grey : Colors.black 
                                    ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                })
          ],
        ),
      ),
    );
  }
}
