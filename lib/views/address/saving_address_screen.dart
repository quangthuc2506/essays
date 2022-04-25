import 'package:flutter/material.dart';

class SavingAddressScreen extends StatelessWidget {
  const SavingAddressScreen({Key? key}) : super(key: key);

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
          'Lưu địa chỉ',
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
