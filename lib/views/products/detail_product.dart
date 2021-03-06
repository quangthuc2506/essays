import 'package:essays/blocs/cart/cart_bloc.dart';
import 'package:essays/models/product.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/cart/cart_screen.dart';
import 'package:essays/views/products/details_tab.dart';
import 'package:essays/views/products/moneyFormat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductScreen extends StatefulWidget {
  Product product;
  DetailProductScreen({Key? key, required this.product}) : super(key: key);
  int initialIndex = 0;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3, vsync: this, initialIndex: widget.initialIndex);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const ScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(
                  expandedHeight: 200, product: widget.product),
              pinned: true,
            ),
            buildBody(_tabController, widget.product),
          ],
        ),
        bottomSheet: _tabController.index != 0
            ? null
            : Card(
                margin: EdgeInsets.zero,
                child: SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              if (amount > 1) {
                                setState(() {
                                  amount--;
                                });
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              color: Color(0xff44CECA),
                            ),
                            style: TextButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                          Text(
                            amount.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                amount++;
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              color: Color(0xff44CECA),
                            ),
                            style: TextButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CartBloc>().add(AddToCartEvent(
                              product: widget.product, amount: amount));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Th??m'),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.fiber_manual_record,
                                size: 5,
                              ),
                            ),
                            Text(moneyFormat(widget.product.price.toString())!)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: const Color(0xff44CECA),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.5, 40)),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildBody(TabController tabCtrl, Product product) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 20,
            child: Column(
              children: [
                TabBar(
                  controller: tabCtrl,
                  onTap: (index) {
                    widget.initialIndex = index;
                    setState(() {});
                  },
                  labelColor: Colors.black,
                  indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(color: Colors.black)),
                  tabs: const [
                    Tab(
                      text: 'Chi ti???t',
                    ),
                    Tab(
                      text: 'M??n kh??c',
                    ),
                    Tab(
                      text: '????nh gi??',
                    )
                  ],
                ),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    controller: tabCtrl,
                    children: [
                      DetailsTab(
                        product: product,
                      ),
                      const Text('there'),
                      detailsTab()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  detailsTab() {
    return const Scaffold(
      body: Center(
        child: Text('Th???c'),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  Product product;
  CustomSliverAppBarDelegate(
      {required this.expandedHeight, required this.product});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top - 40,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset, product),
        ),
      ],
    );
  }

  double apper(double shrinkOffset) => shrinkOffset / expandedHeight;
  double disapper(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;
  Widget buildFloating(double shrinkOffset, Product product) {
    return Opacity(
      opacity: disapper(shrinkOffset),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${product.categoryname!} '),
                      const Icon(
                        Icons.fiber_manual_record,
                        size: 10,
                      ),
                      const Text(' T???t cho s???c kh???e')
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.grey,
                        ),
                        label: const Text('30 ph??t')),
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        label: const Text('4.9')),
                    Text(moneyFormat(product.price.toString())!)
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget buildBackground(double shrinkOffset) {
    return Opacity(
        opacity: disapper(shrinkOffset),
        child: Image.asset(
          AppAssets.restaurant,
          fit: BoxFit.cover,
        ));
  }

  Widget buildAppBar(double shrinkOffset) =>
      Opacity(opacity: apper(shrinkOffset), child: Container());
  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
