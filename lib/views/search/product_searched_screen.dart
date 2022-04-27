import 'package:essays/blocs/product/product_bloc.dart';
import 'package:essays/views/products/detail_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSearchedScreen extends StatelessWidget {
  String name;
  ProductSearchedScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    context
        .read<ProductBloc>()
        .add(SearchProductByNameEvent(productName: name));

    return WillPopScope(
      onWillPop: () async {
        
        context.read<ProductBloc>().add(LoadProductEvent());
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
                context.read<ProductBloc>().add(LoadProductEvent());
              },
              child: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          title: Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 110,
                        height: 30,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {},
                          child: DropdownButtonFormField(
                              icon:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                              disabledHint: const Text(
                                'Sắp xếp',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              isExpanded: true,
                              items: ['Sắp xếp']
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e.toString()),
                                        value: e,
                                      ))
                                  .toList(),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.5, color: Colors.white),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onChanged: null),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Khuyến mãi',
                            style:
                                TextStyle(height: 1, color: Colors.grey[700]),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              side: BorderSide(
                                  width: 1, color: Colors.grey.shade500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Món mới',
                          style: TextStyle(height: 1, color: Colors.grey[700]),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            side: BorderSide(
                                width: 1, color: Colors.grey.shade500),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is LoadingProductSate) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoadedProductState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          '${state.products.length} món ăn, đồ uống được tìm thấy',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w600),
                        )),
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailProductScreen(
                                        product: state.products[index])));
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
                                          style: const TextStyle(
                                              color: Colors.grey),
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffF9F2E9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
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
                                                  color:
                                                      const Color(0xffF9F2E9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
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
                    ),
                  ],
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
        ),
      ),
    );
  }
}
