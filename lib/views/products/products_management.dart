// import 'package:dotted_border/dotted_border.dart';
// import 'package:essays/blocs/category/category_bloc.dart';
// import 'package:essays/blocs/product/product_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductsManagementScreen extends StatelessWidget {
//   ProductsManagementScreen({Key? key}) : super(key: key);
//   List<String> categoryList = ['Fast Food', 'Fish', 'Dessert'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Products Management"),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: const Color(0xff252836),
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: SingleChildScrollView(
//           physics: const ScrollPhysics(),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               height: 40,
//               child: TextFormField(
//                 onChanged: (value) {
//                   print("value search: $value");
//                   if (value.isEmpty) {
//                     context.read<ProductBloc>().add(LoadProductEvent());
//                   } else {
//                     context
//                         .read<ProductBloc>()
//                         .add(SearchProductByNameEvent(productName: value));
//                   }
//                 },
//                 style: const TextStyle(color: Colors.white),
//                 cursorColor: Colors.white,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(
//                     Icons.search,
//                     color: Colors.white,
//                   ),
//                   hintText: "Search",
//                   counterStyle: const TextStyle(color: Colors.white),
//                   hintStyle: const TextStyle(color: Colors.white),
//                   contentPadding: const EdgeInsets.only(left: 0),
//                   enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(width: 0.5, color: Colors.white),
//                       borderRadius: BorderRadius.circular(10)),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(width: 1, color: Colors.white),
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 40,
//                   width: MediaQuery.of(context).size.width * 0.3,
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   child: BlocBuilder<CategoryBloc, CategoryState>(
//                     builder: (context, state) {
//                       return DropdownButtonFormField(
//                         dropdownColor: const Color(0xff252836),
//                         // set value is first index in categories
//                         value: state is CategoryLoadingState
//                             ? ""
//                             : state is CategoryLoadedState
//                                 ? state.categories[0]
//                                 : "",
//                         style: const TextStyle(
//                             color: Colors.white,
//                             overflow: TextOverflow.ellipsis),
//                         icon: const Icon(
//                           Icons.arrow_drop_down,
//                           color: Colors.white,
//                         ),
//                         focusColor: Colors.transparent,
//                         items: state is CategoryLoadedState
//                             ? state.categories
//                                 .map(
//                                   (category) => DropdownMenuItem(
//                                     value: category,
//                                     child: Text(category.categoryName),
//                                   ),
//                                 )
//                                 .toList()
//                             : null,
//                         onChanged: (dynamic value) {
//                           print('value: ${value.categoryName}');
//                           if (value.categoryName == 'All') {
//                             context.read<ProductBloc>().add(LoadProductEvent());
//                           } else {
//                             context.read<ProductBloc>().add(
//                                 SearchByCategoryEvent(
//                                     categoryName: value.categoryName));
//                           }
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: const EdgeInsets.only(left: 10),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   width: 0.5, color: Colors.white),
//                               borderRadius: BorderRadius.circular(10)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   width: 0.5, color: Colors.white),
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                   child: ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.tune),
//                     label: const Text("Manage Categories"),
//                     style: ElevatedButton.styleFrom(
//                         side: const BorderSide(width: 0.5, color: Colors.white),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                 )
//               ],
//             ),
//             BlocBuilder<ProductBloc, ProductState>(
//               builder: (context, state) {
//                 if (state is ProductLoadingState) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (state is ProductLoadedState) {
//                   return GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.7375,
//                     ),
//                     shrinkWrap: true,
//                     itemCount: state.products.length,
//                     physics: const ScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       Product product = state.products[index];
//                       return index == 0
//                           ? Card(
//                               color: const Color(0xff1F1D2B),
//                               child: DottedBorder(
//                                   color: Colors.red,
//                                   strokeWidth: 1,
//                                   radius: const Radius.circular(5),
//                                   borderType: BorderType.RRect,
//                                   dashPattern: const [5, 5],
//                                   child: Center(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: const [
//                                         Icon(
//                                           Icons.add,
//                                           color: Color(0xffEA7C69),
//                                           size: 25,
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         Text(
//                                           "Add new dish",
//                                           style: TextStyle(
//                                               color: Color(0xffea7c69),
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 18),
//                                         ),
//                                       ],
//                                     ),
//                                   )))
//                           : Card(
//                               color: const Color(0xff1F1D2B),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         SizedBox(
//                                           width: 120,
//                                           height: 120,
//                                           child: Image.network(product.image),
//                                         ),
//                                         SizedBox(
//                                           width: 120,
//                                           child: Align(
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               product.productName,
//                                               style: const TextStyle(
//                                                 color: Colors.white,
//                                               ),
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.center,
//                                               maxLines: 2,
//                                             ),
//                                           ),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "\$${product.price}  ",
//                                               style: TextStyle(
//                                                   color: Colors.grey[350]),
//                                             ),
//                                             Icon(
//                                               Icons.fiber_manual_record,
//                                               size: 10,
//                                               color: Colors.grey[350],
//                                             ),
//                                             Text("  ${product.amount} Bowls",
//                                                 style: TextStyle(
//                                                     color: Colors.grey[350]))
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     width: double.infinity,
//                                     height: 40,
//                                     margin: EdgeInsets.zero,
//                                     child: ElevatedButton.icon(
//                                       onPressed: () {
//                                         Navigator.pushNamed(context,
//                                             RouteName.productEditScreen, arguments: product);
//                                       },
//                                       icon: const Icon(
//                                         Icons.edit_outlined,
//                                         size: 20,
//                                         color: Color(0xffEA7C69),
//                                       ),
//                                       label: const Text(
//                                         "Edit dish",
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             color: Color(0xffEA7C69)),
//                                       ),
//                                       style: ElevatedButton.styleFrom(
//                                         primary: const Color(0xff50343A),
//                                         shape: const RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(0),
//                                               topRight: Radius.circular(0),
//                                               bottomLeft: Radius.circular(5),
//                                               bottomRight: Radius.circular(5)),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                     },
//                   );
//                 } else {
//                   return const Text("Something went wrong");
//                 }
//               },
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }