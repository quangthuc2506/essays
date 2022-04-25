import 'package:essays/values/app_assets.dart';
import 'package:essays/views/cart/cart_screen.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  DetailProductScreen({Key? key}) : super(key: key);
  int initialIndex = 0;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
        length: 3, vsync: this, initialIndex: widget.initialIndex);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const ScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(expandedHeight: 200),
              pinned: true,
            ),
            buildBody(_tabController),
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
                            onPressed: () {},
                            child: const Icon(
                              Icons.remove,
                              color: Color(0xff44CECA),
                            ),
                            style: TextButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                          const Text(
                            '1',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                            onPressed: () {},
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Thêm'),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.fiber_manual_record,
                                size: 5,
                              ),
                            ),
                            Text('100.000đ')
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

  Widget buildBody(TabController tabCtrl) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
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
                      text: 'Chi tiết',
                    ),
                    Tab(
                      text: 'Món khác',
                    ),
                    Tab(
                      text: 'Đánh giá',
                    )
                  ],
                ),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    controller: tabCtrl,
                    children: [
                      const Text('Hi'),
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
        child: Text('Thức'),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  CustomSliverAppBarDelegate({required this.expandedHeight});

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
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double apper(double shrinkOffset) => shrinkOffset / expandedHeight;
  double disapper(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;
  Widget buildFloating(double shrinkOffset) {
    return Opacity(
      opacity: disapper(shrinkOffset),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'Salted Pasta with Mushroom',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Món chính '),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 10,
                      ),
                      Text(' Tốt cho sức khỏe')
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
                        label: const Text('30 phút')),
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        label: const Text('4.9')),
                    const Text('100.000đ')
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

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: apper(shrinkOffset),
        child: AppBar(
          title: const Text('Quang Thuc'),
          centerTitle: true,
        ),
      );
  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
