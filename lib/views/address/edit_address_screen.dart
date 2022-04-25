import 'package:essays/views/address/saving_address_screen.dart';
import 'package:flutter/material.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Sửa địa chỉ',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    isDense: true,
                    label: Text(
                      'Tên*',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Vd: Trường học, Phòng tập',
                    floatingLabelStyle: TextStyle(color: Color(0xff4EA4AA)),
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff4EA4AA), width: 0.5))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SavingAddressScreen()));
                },
                child: TextFormField(
                  decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      label: Text('Địa chỉ',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Địa chỉ',
                      enabled: false,
                      hintStyle: TextStyle(color: Colors.grey),
                      floatingLabelStyle: TextStyle(color: Color(0xff4EA4AA)),
                      suffixIcon: Icon(Icons.keyboard_arrow_right_rounded),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4EA4AA)))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    isDense: true,
                    label: Text('Vd: Vào trong hẻm đối diện trường học',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Ghi chú cho tài xế',
                    floatingLabelStyle: TextStyle(color: Color(0xff4EA4AA)),
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4EA4AA)))),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 40,
        margin: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            'Lưu địa chỉ',
            style: TextStyle(height: 1),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff4EA4AA),
            fixedSize: Size(MediaQuery.of(context).size.width - 40, 40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
