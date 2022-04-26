import 'package:essays/blocs/cart/cart_bloc.dart';
import 'package:essays/views/menu_screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(LoadCartsEvent());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xff676767),
            )),
        title: const Text(
          "Thanh toán",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: const [
          Center(
              child: Text(
            'Xoá tất cả',
            style: TextStyle(
                color: Color(0xffBE965B), fontWeight: FontWeight.w600),
          )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                children: [
                  Container(
                    height: 10,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Giao hàng',
                            style: TextStyle(
                                color: Color(0xffBE965B),
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Đến lấy'),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(105, 33),
                                  primary: const Color(0xffBE965B)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Ship',
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(105, 33),
                                  primary: const Color(0xffEFEFEF)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2.5,
                  ),
                  const SizedBox(
                    height: 50,
                    child: ListTile(
                      leading: SizedBox(
                        height: double.infinity,
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Color(0xffBE965B),
                        ),
                      ),
                      visualDensity: VisualDensity(vertical: -4),
                      title: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          "Vinhome Green Bay",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(bottom: 3, top: 1),
                        child: Text(
                          'Vinhome Green Bay, Phường Mễ Trì',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      minLeadingWidth: 0,
                      trailing: Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                  ),
                  const Divider(
                    thickness: 2.5,
                  ),
                  SizedBox(
                    height: 40,
                    child: Transform.translate(
                      offset: const Offset(0, -15),
                      child: const ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.person_outline_outlined,
                            color: Color(0xffBE965B),
                          ),
                        ),
                        title: Text(
                          "Nguyễn Quang Thức",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text('0963255409'),
                        minLeadingWidth: 0,
                        trailing: Text(
                          'Sửa',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffBE965B)),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2.5,
                  ),
                  SizedBox(
                    height: 35,
                    child: Transform.translate(
                      offset: const Offset(0, -8),
                      child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(top: 2.5),
                          child: Icon(
                            Icons.access_time_sharp,
                            color: Color(0xffBE965B),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Lấy hàng lúc",
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              '(trong vòng 15 phút)',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        minLeadingWidth: 0,
                        trailing:
                            const Icon(Icons.keyboard_arrow_down_outlined),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2.5,
                  ),
                  SizedBox(
                    height: 40,
                    child: Transform.translate(
                      offset: const Offset(0, -8),
                      child: const ListTile(
                        leading: Icon(
                          Icons.assignment,
                          color: Color(0xffBE965B),
                        ),
                        minLeadingWidth: 0,
                        title: Text(
                          'Ghi chú cho đơn hàng',
                          style: TextStyle(fontSize: 14),
                        ),
                        trailing: Text(
                          'Sửa',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffBE965B)),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Món',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          splashColor: Colors.red,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuScreen()));
                          },
                          child: Row(
                            children: [
                              const Text('Thêm',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xffBE965B))),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                padding: EdgeInsets.zero,
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Color(0xffBE965B),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xffBE965B))),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  state is LoadedCartState
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: state.carts.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const Divider(
                                  thickness: 1.5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 75,
                                        height: 75,
                                        child: Image(
                                            image: NetworkImage(
                                                state.carts[index].image!)),
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                      ),
                                      SizedBox(
                                        height: 75,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                75 -
                                                30,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.carts[index].productName!,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    state.carts[index].note!.isEmpty
                                                        ? 'Không có ghi chú'
                                                        : state
                                                            .carts[index].note!,
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  Text(
                                                    state.carts[index].price!,
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : const Text(
                          'Không có sản phẩm nào trong giỏ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                  const Divider(
                    thickness: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Giá bán đã bao gồm 8% VAT, áp dụng từ ngày 01/02/2022 đến 31/12/2022',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Tạm tính',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text('39.000đ', style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text('Tổng cộng(1 món)'), Text('39.000đ')],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 7.5,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(
              height: 0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 15),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.credit_card_outlined,
                          color: Color(0xffBE965B),
                        ),
                        label: const Text(
                          'Thẻ quốc tế',
                          style: TextStyle(color: Color(0xffBE965B)),
                        )),
                    const VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                      thickness: 2,
                    ),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.credit_card_outlined,
                          color: Color(0xffBE965B),
                        ),
                        label: const Text('Thêm ưu đãi',
                            style: TextStyle(color: Color(0xffBE965B)))),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Đặt 1 món: 68.000đ'),
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xffB3282D),
                  fixedSize: Size(MediaQuery.of(context).size.width - 20, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            )
          ],
        ),
      ),
    );
  }
}
