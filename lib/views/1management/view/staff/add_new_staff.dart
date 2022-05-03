import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/widgets/product_edit_my_text_form_field.dart';
import 'package:flutter/material.dart';

class AddNewStaffScreen extends StatefulWidget {
  const AddNewStaffScreen({Key? key}) : super(key: key);

  @override
  State<AddNewStaffScreen> createState() => _AddNewStaffScreenState();
}

class _AddNewStaffScreenState extends State<AddNewStaffScreen> {
  dynamic val;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  void initState() {
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
          title: const Text("Thêm Nhân sự"),
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
                  child: Column(
                    children: [
                      myTextFormField(
                          controller: _nameController,
                          prefixIcon: Icons.person,
                          labelText: 'Họ tên'),
                      myTextFormField(
                          controller: _emailController,
                          prefixIcon: Icons.email,
                          labelText: 'Email')
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
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                        'Hướng dẫn: Nhập tên và cấp email, sau đó nhân viên sẽ dùng email để đăng ký tài khoản.')),
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
                InkWell(
                  onTap: () async {
                    if (_emailController.text.isEmpty ||
                        _nameController.text.isEmpty ||
                        val == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Vui lòng nhập đầy đủ thông tin'),
                        ),
                      );
                    } else {
                      final check = await FirebaseFirestore.instance
                          .collection('user')
                          .where('email', isEqualTo: _emailController.text)
                          .get();
                      if (check.docs.isEmpty) {
                        await FirebaseFirestore.instance
                            .collection('user')
                            .doc()
                            .set({
                          "address": '',
                          "avatar": "",
                          'email': _emailController.text,
                          'name': _nameController.text,
                          'phoneNumber': '',
                          'point': '0',
                          'position': val
                        });
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Đã thêm nhân viên'),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Thêm nhân viên',
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
