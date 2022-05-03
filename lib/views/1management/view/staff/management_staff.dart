import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/model/base_user.dart';
import 'package:essays/views/1management/view/staff/add_new_staff.dart';
import 'package:essays/views/1management/view/staff/edit_staff.dart';
import 'package:flutter/material.dart';

class StaffManagementScreen extends StatefulWidget {
  const StaffManagementScreen({Key? key}) : super(key: key);

  @override
  State<StaffManagementScreen> createState() => _StaffManagementScreenState();
}

class _StaffManagementScreenState extends State<StaffManagementScreen> {
  List<BaseUser> users = [];

  Stream<List<BaseUser>> getUsers() {
    return FirebaseFirestore.instance
        .collection('user')
        .where('position', whereIn: ['Phục vụ', 'Thu ngân', 'Chủ'])
        .snapshots()
        .map((snapshot) {
          print("snapshot category: ${snapshot.docs.length}");
          return snapshot.docs.map((doc) => BaseUser.fromSnapshot(doc)).toList();
        });
  }

  @override
  void initState() {
    getUsers().listen((event) {
      users = event;
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('do dai: ${users.length}');
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
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNewStaffScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10, left: 20),
              child: Icon(Icons.add, color: Colors.white),
            ),
          )
        ],
        title: const Text("Nhân sự"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditStaffScreen(user: users[index])));
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    width: 75,
                                    height: 75,
                                    margin: const EdgeInsets.only(right: 10),
                                    child: users[index].image!.isEmpty
                                        ? const Icon(
                                            Icons.person_outline_rounded,
                                            size: 50,
                                            color: Colors.grey,
                                          )
                                        : Image(
                                            image: NetworkImage(
                                                users[index].image!))),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      users[index].name!,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      users[index].phoneNumber!,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      users[index].email!,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              users[index].position!,
                              style: const TextStyle(color: Colors.orange),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                      thickness: 5,
                    )
                  ],
                );
              })),
    );
  }
}
