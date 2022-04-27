import 'package:dotted_border/dotted_border.dart';
import 'package:essays/blocs/category/category_bloc.dart';
import 'package:essays/blocs/product/product_bloc.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/cart/cart_screen.dart';
import 'package:essays/views/coupon/coupon_screen.dart';
import 'package:essays/views/main_page_screen.dart';
import 'package:essays/views/products/detail_product.dart';
import 'package:essays/views/search/product_searched_screen.dart';
import 'package:essays/views/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    context.read<ProductBloc>().add(LoadProductEvent());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.menu_book_sharp,
            color: Color(0xff44CECA),
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Transform.translate(
            offset: const Offset(-10, 0),
            child: const Text(
              'Menu',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                child: const Icon(
                  Icons.shopping_cart_checkout_rounded,
                  color: Color(0xff44CECA),
                )),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 30,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    },
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        enabled: false,
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.search,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Search for food',
                              style: TextStyle(color: Colors.grey[500]),
                            )
                          ],
                        )),
                        contentPadding: EdgeInsets.zero,
                        disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                style: BorderStyle.none, width: 0),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 0.5,
                height: 0,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://intmt.vn/wp-content/uploads/2018/04/BANNER-MARKTING3-03_2.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPageScreen(currentIndex: 2,)));
                },
                icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(AppAssets.reservation)),
                label: const Text(
                  "Reserve",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: const Size(135, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(width: 1, color: Colors.grey))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                strokeWidth: 1,
                color: Colors.grey,
                strokeCap: StrokeCap.round,
                dashPattern: const [4, 4],
                customPath: (size) {
                  return Path()
                    ..moveTo(10, 10)
                    ..lineTo(10, size.height - 10)
                    ..lineTo(size.width - 10, size.height - 10)
                    ..lineTo(size.width - 10, 10)
                    ..lineTo(10, 10)
                    ..moveTo(10, size.height * 0.5)
                    ..lineTo(size.width - 10, size.height * 0.5)
                    ..moveTo(size.width * 0.25, 10)
                    ..lineTo(size.width * 0.25, size.height - 10)
                    ..moveTo(size.width * 0.5, 10)
                    ..lineTo(size.width * 0.5, size.height - 10)
                    ..moveTo(size.width * 0.75, 10)
                    ..lineTo(size.width * 0.75, size.height - 10);
                },
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is LoadedCategoryState) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: state.categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, childAspectRatio: 0.81818),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductSearchedScreen(
                                            name: state
                                                .categories[index].categoryName,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 48,
                                      height: 48,
                                      child: Image.network(
                                          state.categories[index].icon),
                                    ),
                                    Text(
                                      state.categories[index].categoryName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, childAspectRatio: 0.81818),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(3),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: Image.asset(AppAssets.riceIcon),
                                  ),
                                  const Text(
                                    'Cơm',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CouponScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey[300],
                child: SizedBox(
                  height: 40,
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(AppAssets.coupon),
                    ),
                    title: const Text(
                      'Mã giảm giá hot',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    actions: const [
                      Padding(
                        padding: EdgeInsets.only(right: 14),
                        child: Icon(Icons.keyboard_arrow_right_rounded),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                margin: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Tất cả',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                )),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is LoadingProductSate) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is LoadedProductState) {
                  return ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailProductScreen(product: state.products[index],)));
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: width * 0.25,
                                  height: width * 0.25,
                                  margin: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              state.products[index].image))),
                                ),
                                SizedBox(
                                  width: width * 0.6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.products[index].productName,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        state.products[index].categoryname!,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[700],
                                          ),
                                          const Text('4.9 (400+ reviews)')
                                        ],
                                      ),
                                      Text(
                                        state.products[index].price,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const Divider(thickness: 1.25),
                                      Row(
                                        children: [
                                          Container(
                                            child: const Text(
                                              "Giảm 20%",
                                              style: TextStyle(
                                                  color: Color(0xff957461),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF9F2E9),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            child: const Text("Mua 2 tặng 1",
                                                style: TextStyle(
                                                    color: Color(0xff957461),
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF9F2E9),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 1.25,
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
