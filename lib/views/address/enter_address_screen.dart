import 'package:essays/views/address/edit_address_screen.dart';
import 'package:essays/views/address/saved_adderss.dart';
import 'package:flutter/material.dart';

class EnterAddressScreen extends StatelessWidget {
  const EnterAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          'Nhập địa chỉ',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: TextFormField(
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffEFF0F3))),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffEFF0F3))),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              hintText: 'Địa điểm hiện tại của bạn ở đâu?',
              hintStyle: TextStyle(
                  color: Color(0xffABAFBC), fontWeight: FontWeight.w600),
              suffixIcon: Icon(
                Icons.gesture_outlined,
                color: Colors.grey,
              ),
            ),
          ),
        ),
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SavedAddressScreen()));
                  },
                  child: const Text(
                    'Chỉnh sửa',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xff4EA4AA)),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: Color(0xffEFF0F3),
            thickness: 1.5,
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
              leading: Icon(Icons.home_outlined),
              minLeadingWidth: 0,
              title: Text('Nhà'),
              subtitle: Text('Lưu địa chỉ'),
              trailing: Icon(Icons.keyboard_arrow_right_rounded),
            ),
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
              leading: Icon(Icons.home_outlined),
              minLeadingWidth: 0,
              title: Text('Công ty'),
              subtitle: Text('Lưu địa chỉ'),
              trailing: Icon(Icons.keyboard_arrow_right_rounded),
            ),
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
          Container(
            height: 50,
            color: const Color(0xffF6F7FB),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Địa điểm gần đây',
                  style: TextStyle(
                      color: Color(0xff71757D), fontWeight: FontWeight.w600),
                ),
                Text(
                  'Xóa',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Color(0xff71757D)),
                )
              ],
            ),
          ),
          const Divider(
            height: 0,
          ),
          const ListTile(
            leading: Icon(Icons.access_time),
            minLeadingWidth: 0,
            title: Text(
              'Tòa nhà Sông Đà',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'Phạm Hùng, Mỹ Đình, Nam Từ Liêm, Hà Nội, Việt Nam',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const Divider(
            height: 0,
          ),
          Expanded(
              child: Container(
            color: const Color(0xffF6F7FB),
          ))
        ],
      ),
    );
  }
}
