import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:essays/blocs/cart/cart_bloc.dart';
import 'package:essays/models/cart.dart';
import 'package:essays/views/coupon/coupon_screen.dart';
import 'package:essays/views/main_page_screen.dart';
import 'package:essays/views/personal/change_infor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool check1 = false;
  bool check2 = true;
  int ship = 0;
  String note = '';
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(LoadCartsEvent());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        actions: [
          Center(
              child: InkWell(
            onTap: () {
              context.read<CartBloc>().add(DeleteAllFromTheCartEvent());
            },
            child: const Text(
              'Xoá tất cả',
              style: TextStyle(
                  color: Color(0xffBE965B), fontWeight: FontWeight.w600),
            ),
          )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 170),
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
                            check1 == true
                                ? ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        check1 = true;
                                        check2 = false;
                                        ship = 0;
                                      });
                                    },
                                    child: const Text(
                                      'Đến lấy',
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(105, 33),
                                        primary: const Color(0xffBE965B)),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        check1 = true;
                                        check2 = false;
                                        ship = 0;
                                      });
                                    },
                                    child: Text(
                                      'Đến lấy',
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(105, 33),
                                        primary: const Color(0xffEFEFEF)),
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            check2 == true
                                ? ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        check1 = false;
                                        check2 = true;

                                        ship = 20000;
                                      });
                                    },
                                    child: const Text(
                                      'Ship',
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(105, 33),
                                        primary: const Color(0xffBE965B)),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        check1 = false;
                                        check2 = true;
                                        ship = 20000;
                                      });
                                    },
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChangeInfor(
                                              title: 'Địa chỉ',
                                              content:
                                                  state is AuthenticatedState
                                                      ? state.userMap['address']
                                                      : '',
                                            )));
                              },
                              leading: const SizedBox(
                                height: double.infinity,
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xffBE965B),
                                ),
                              ),
                              visualDensity: const VisualDensity(vertical: -4),
                              title: const Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: SizedBox(
                                  width: 10,
                                  child: Text(
                                    "Địa chỉ nhận hàng",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 3, top: 1),
                                child: Text(
                                  state is AuthenticatedState
                                      ? state.userMap['address']
                                      : '',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                              minLeadingWidth: 0,
                              trailing: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                            ),
                          ),
                          const Divider(
                            thickness: 2.5,
                          ),
                          SizedBox(
                            height: 40,
                            child: Transform.translate(
                              offset: const Offset(0, -15),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChangeInfor(
                                                title: 'Địa chỉ',
                                                content: state
                                                        is AuthenticatedState
                                                    ? state
                                                        .userMap['phoneNumber']
                                                    : '',
                                              )));
                                },
                                leading: const Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.person_outline_outlined,
                                    color: Color(0xffBE965B),
                                  ),
                                ),
                                title: Text(
                                  state is AuthenticatedState
                                      ? state.userMap['name']
                                      : '',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(state is AuthenticatedState
                                    ? state.userMap['phoneNumber']
                                    : ''),
                                minLeadingWidth: 0,
                                trailing: const Text(
                                  'Sửa',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffBE965B)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
                      child: ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      title: const Text('Ghi chú'),
                                      titlePadding: const EdgeInsets.only(
                                          left: 10, top: 10, bottom: 0),
                                      contentPadding: const EdgeInsets.all(5),
                                      content: TextFormField(
                                        maxLines: 5,
                                        controller: _noteController,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Thêm ghi chú (ví dụ: ít đường...)',
                                          contentPadding: const EdgeInsets.only(
                                              left: 10, top: 15),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          note = _noteController.text;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Thêm ghi chú'),
                                      style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          backgroundColor:
                                              const Color(0xffB3282D),
                                          fixedSize: Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              50)),
                                    )
                                  ],
                                );
                              });
                        },
                        leading: const Icon(
                          Icons.assignment,
                          color: Color(0xffBE965B),
                        ),
                        minLeadingWidth: 0,
                        title: Text(
                          note != '' ? note : 'Ghi chú cho đơn hàng',
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: const Text(
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
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPageScreen(
                                          currentIndex: 1,
                                        )));
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
                                      Stack(
                                        children: [
                                          Container(
                                            width: 75,
                                            height: 75,
                                            child: Image(
                                                image: NetworkImage(
                                                    state.carts[index].image!)),
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                          ),
                                          Positioned(
                                              right: 10,
                                              top: 1,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffBE965B)),
                                                    color:
                                                        const Color(0xffF8F1E7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                  state.carts[index].amount!
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Color(0xffBE965B)),
                                                ),
                                              )),
                                        ],
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  state.carts[index]
                                                      .productName!,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    context.read<CartBloc>().add(
                                                        DeleteFromTheCartEvent(
                                                            cart: state
                                                                .carts[index]));
                                                  },
                                                  child: const Text(
                                                    'Xóa',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xffBE965B)),
                                                  ),
                                                )
                                              ],
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
                                                    state.carts[index].note!
                                                            .isEmpty
                                                        ? 'Không có ghi chú'
                                                        : state
                                                            .carts[index].note!,
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  Text(
                                                    state.moneyFormat(state
                                                        .carts[index].price!
                                                        .toString())!,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tạm tính',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                          state is LoadedCartState
                              ? state.carts.isNotEmpty
                                  ? state
                                      .moneyFormat(
                                          state.getPriceTotal().toString())
                                      .toString()
                                  : '0đ'
                              : '0đ',
                          style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Phí ship',
                          style: TextStyle(color: Colors.grey)),
                      Text(
                          state is LoadedCartState
                              ? state.carts.isNotEmpty
                                  ? "${state.moneyFormat(ship.toString()).toString()}đ"
                                  : '0đ'
                              : '0đ',
                          style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  state is LoadedCartState
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Tổng cộng(${state.getAmountTotal().toString()} món)'),
                            Text(
                                '${state.carts.isNotEmpty ? state.moneyFormat(state.getPriceTotal().toString()) : '0'}đ')
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Tổng cộng(0 món)'),
                            Text('0đ')
                          ],
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CouponScreen()));
                        },
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
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                int total = 0;
                state is LoadedCartState
                    ? state.carts.isNotEmpty
                        ? total = state.getPriceTotal()
                        : '1'
                    : '0';
                return ElevatedButton(
                  onPressed: state is LoadedCartState
                      ? state.getPriceTotal() == 0
                          ? null
                          : () async {
                              final _firebaseFirestore =
                                  FirebaseFirestore.instance;
                              final _fireAuth = FirebaseAuth.instance;
                              //// them data vao bang bill
                              String id = createId();
                              Map<String, dynamic> map = {
                                'orderId': id,
                                'customerId': _fireAuth.currentUser!.email,
                                'date': FieldValue.serverTimestamp()
                              };
                              await _firebaseFirestore
                                  .collection('order').doc(id)
                                  .set(map);

                              ////them data vao bang billDetails
                              for (Cart e in state.carts) {
                                Map<String, dynamic> map1 = {
                                  'orderId': id,
                                  'amount': e.amount,
                                  'price': e.price,
                                  'productId': e.productId,
                                  'status': 'Chờ xác nhận'
                                };
                                await _firebaseFirestore
                                    .collection('orderDetails')
                                    .add(map1);
                              }
                              var _fireStore = FirebaseFirestore.instance;
                              String email =
                                  FirebaseAuth.instance.currentUser!.email!;
                              var emptyCarts = FirebaseFirestore.instance
                                  .collection('cart')
                                  .where('email', isEqualTo: email)
                                  .get()
                                  .then((querySnapshot) {
                                var batch = _fireStore.batch();
                                for (var element in querySnapshot.docs) {
                                  batch.delete(element.reference);
                                }
                                return batch.commit();
                              }).then((value) => null);
                            }
                      : null,
                  child: state is LoadedCartState
                      ? Text(
                          'Đặt ${state.getAmountTotal().toString()} món: ${state.moneyFormat((total + ship).toString())}đ')
                      : const Text('Chưa có hàng trong giỏ'),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xffB3282D),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width - 20, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  String createId() {
    String id = DateTime.now().day.toString() +
        DateTime.now().hour.toString() +
        DateTime.now().minute.toString() +
        DateTime.now().second.toString() +
        DateTime.now().millisecond.toString() +
        DateTime.now().microsecond.toString();
    return id;
  }
}
