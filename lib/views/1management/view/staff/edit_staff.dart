import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/model/base_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditStaffScreen extends StatefulWidget {
  EditStaffScreen({Key? key, required this.user}) : super(key: key);
  BaseUser user;
  @override
  State<EditStaffScreen> createState() => _EditStaffScreenState();
}

class _EditStaffScreenState extends State<EditStaffScreen> {
  dynamic val;
  @override
  void initState() {
    val = widget.user.position;
    super.initState();
  }

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
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({'position': val});

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Đã thêm nhân viên'),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10, left: 20),
                child: Icon(Icons.check, color: Colors.white),
              ),
            )
          ],
          title: const Text("Nhân sự"),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                Container(
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
                              child: widget.user.image!.isEmpty
                                  ? const Icon(
                                      Icons.person_outline_rounded,
                                      size: 50,
                                      color: Colors.grey,
                                    )
                                  : Image(
                                      image: NetworkImage(widget.user.image!))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.user.name!,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.user.phoneNumber!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.user.email!,
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        widget.user.position!,
                        style: const TextStyle(color: Colors.orange),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  height: 15,
                  color: Colors.grey[200],
                ),
                const Divider(
                  height: 0,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone),
                    label: const Text('Gọi điện')),
                const Divider(
                  height: 1,
                ),
                Container(
                  height: 15,
                  color: Colors.grey[200],
                ),
                const Divider(
                  height: 0,
                ),
                const ListTile(
                  leading: Icon(Icons.tag_sharp),
                  title: Text('Phần quyền nhân viên'),
                ),
                ListTile(
                  leading: Radio(
                    value: 'Thu ngân',
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                      });
                    },
                  ),
                  title: const Text('Thu ngân'),
                ),
                ListTile(
                  leading: Radio(
                    value: 'Phục vụ',
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                      });
                    },
                  ),
                  title: const Text('Phục vụ'),
                ),
                ListTile(
                  leading: Radio(
                    value: 'Bảo vệ',
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                      });
                    },
                  ),
                  title: const Text('Bảo vệ'),
                ),
                const Divider(
                  height: 0,
                ),
                Container(
                  height: 15,
                  color: Colors.grey[200],
                ),
                const Divider(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AlertDialog(
                                    content: Column(
                                  children: [
                                    const Text(
                                      'Sau khi xoá sẽ không thể phục hồi?',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                              onPressed: () async {
                                                await FirebaseFirestore.instance
                                                    .collection('user')
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                    .update({'position': ''});

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Đã xoá nhân viên'),
                                                  ),
                                                );
                                                Navigator.pop(context);
                                              },
                                              child: const Text('xác nhận')),
                                        ),
                                        SizedBox(
                                            width: 100,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Huỷ'))),
                                      ],
                                    )
                                  ],
                                ))
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'Xoá nhân viên',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                Container(
                  color: Colors.grey[200],
                )
              ],
            )));
  }
}
