import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:essays/blocs/product/product_bloc.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/cart/cart_screen.dart';
import 'package:essays/views/coupon/coupon_screen.dart';
import 'package:essays/views/favorite/favorite_screen.dart';
import 'package:essays/views/menu_screen/menu_screen.dart';
import 'package:essays/views/personal/member_infor_screen.dart';
import 'package:essays/views/products/detail_product.dart';
import 'package:essays/views/reserve/reserve_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final _user = FirebaseAuth.instance.currentUser!;
    context.read<ProductBloc>().add(LoadHotProductEvent());
    return Scaffold(
      appBar: AppBar(
        primary: true,
        elevation: 1,
        backgroundColor: const Color(0xff44CECA),
        title: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthenticatedState) {
            return Text(
              'Good morning, ${state.userMap['name']}',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500),
            );
          } else {
            return const Text('Good morning!');
          }
        }),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: const Icon(
              Icons.shopping_cart_checkout_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MemberInforScreen()));
                  },
                  child: Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: width * 0.53,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(AppAssets.silverBanner),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 1.0)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: Container(
                                            width: 55,
                                            height: 55,
                                            // child: Image.network(_user.photoURL!),
                                            color: Colors.grey[200],
                                            child: state is AuthenticatedState
                                                ? state.userMap['avatar'] !=
                                                        null
                                                    ? Image.network(
                                                        state.userMap['avatar'])
                                                    : const Icon(
                                                        Icons
                                                            .person_outline_rounded,
                                                        size: 30,
                                                      )
                                                : const Icon(
                                                    Icons
                                                        .person_outline_rounded,
                                                    size: 30,
                                                  ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              state is AuthenticatedState
                                                  ? Text(
                                                      '${state.userMap['name']}',
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )
                                                  : const Text(
                                                      'Thêm nick name'),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                'Khách hàng bạc',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.invert_colors,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        state is AuthenticatedState
                                            ? '${state.userMap['point']}/100'
                                            : '0/100',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero),
                                    ),
                                    const Text(
                                      'Nhận món quà tiếp theo',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipOval(
                                    child: Container(
                                        color: Colors.grey,
                                        child: const Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          size: 20,
                                          color: Colors.white,
                                        ))),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(AppAssets.silver),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              color: Colors.grey[200],
              margin: const EdgeInsets.only(bottom: 5),
              height: 170,
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    child: Container(
                      padding: const EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xffFFFBF0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ReserveScreen()));
                        },
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 80,
                              height: 80,
                              child: Image.asset(AppAssets.reserve),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Đặt bàn trước',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ClipOval(
                                          child: Container(
                                              color: Colors.grey,
                                              child: const Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color: Colors.white,
                                                size: 18,
                                              ))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Đặt bàn, tổ chức sự kiện, sinh nhật, đám cưới,...",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Card(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  TextButton.icon(
                                      onPressed: () {
                                        Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CouponScreen()));
                                      },
                                      icon: const Icon(
                                        Icons.castle_rounded,
                                        color: Colors.red,
                                      ),
                                      label: const Text(
                                        'Ưu đãi',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ],
                              ),
                              const VerticalDivider(
                                indent: 15,
                                endIndent: 15,
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FavoriteScreen()));
                                },
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                label: const Text(
                                  'Yêu thích',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Ưu đãi đặc biệt hôm nay',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    'https://intmt.vn/wp-content/uploads/2018/04/BANNER-MARKTING3-03_2.jpg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Món nổi bật',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is LoadingProductSate) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is LoadedProductState) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: state.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7171),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailProductScreen()));
                        },
                        child: Card(
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 100,
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                          state.products[index].image),
                                    ),
                                    Text(
                                      state.products[index].productName,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              '${state.products[index].price}đ'),
                                          SizedBox(
                                            height: 30,
                                            child: TextButton.icon(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.star,
                                                color: Colors.yellow[700],
                                              ),
                                              label: const Text(
                                                '4.9',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    height: 1),
                                              ),
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  primary: Colors.red,
                                                  backgroundColor:
                                                      Colors.grey[200],
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height: 35,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Thêm vào đơn',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red[700]),
                                      ),
                                    )
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Text("Something went wrong");
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Khám phá toàn bộ menu =>',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.red[700]),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenuScreen()));
                    },
                    child: const Text(
                      'Menu',
                      style: TextStyle(height: 1),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[700],
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 25),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Image.asset(AppAssets.coffe),
                    ),
                    const Text('Bản tin đến đây là hết. Xin cảm ơn quý khách!'),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
