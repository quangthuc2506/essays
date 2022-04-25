import 'package:essays/views/address/edit_address_screen.dart';
import 'package:flutter/material.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({Key? key}) : super(key: key);

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
          'Địa chỉ đã lưu',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            color: const Color(0xffF6F7FB),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Địa điểm của tôi',
                  style: TextStyle(
                      color: Color(0xff71757D), fontWeight: FontWeight.w600),
                ),
                Text(
                  '2/5',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey[700]),
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: Color(0xffEFF0F3),
            thickness: 1.5,
          ),
          const ListTile(
            visualDensity: VisualDensity(vertical: -4),
            leading: Icon(Icons.home_outlined),
            minLeadingWidth: 0,
            title: Text('Nhà'),
            subtitle: Text('Lưu địa chỉ'),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 0.5,
          ),
          const ListTile(
            visualDensity: VisualDensity(vertical: -4),
            leading: Icon(Icons.home_outlined),
            minLeadingWidth: 0,
            title: Text('Công ty'),
            subtitle: Text('Lưu địa chỉ'),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 0.5,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditAddressScreen()));
            },
            child: const ListTile(
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(
                Icons.add,
                color: Color(0xff4EA4AA),
              ),
              minLeadingWidth: 0,
              title: Text(
                'Thêm địa chỉ',
                style: TextStyle(
                    color: Color(0xff4EA4AA), fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
