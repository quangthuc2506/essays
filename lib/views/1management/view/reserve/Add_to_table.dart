import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/models/category.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/category/category_repository.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/view/reserve/details_table_screen.dart';
import 'package:essays/widgets/product_edit_my_text_form_field.dart';
import 'package:flutter/material.dart';

class AddToTableScreen extends StatefulWidget {
  int indexTable;
  AddToTableScreen({Key? key, required this.indexTable}) : super(key: key);

  @override
  State<AddToTableScreen> createState() => _AddToTableScreenState();
}

class _AddToTableScreenState extends State<AddToTableScreen> {
  final CategoryRepository _categoryRepository = CategoryRepository();
  final ProductRepository _productRepository = ProductRepository();
  final TextEditingController _addController = TextEditingController();
  List<Category> categories = [];
  List<Product> products = [];
  @override
  void initState() {
    getAllProduct();
    getAllCategories();
    _addController.text = '1';
    super.initState();
  }

  void getAllProduct() async {
    products = await _productRepository.getAllProduct2();
    products.removeAt(0);
    setState(() {});
  }

  void getAllCategories() async {
    categories = await _categoryRepository.getAllCategories2();
    setState(() {});
  }

  getAmountProductByCategoryId(String categId) {
    int amount = 0;
    for (Product pro in products) {
      if (pro.categoryId == categId) {
        amount++;
      }
    }
    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              flexibleSpace: const Image(
                image: AssetImage(AppAssets.backgroundAppbar),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              title: const Text("Danh sách sản phẩm"),
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[200],
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 40,
                        child: TextFormField(
                          onChanged: (value) async {
                            products = await _productRepository.getAllProduct2(
                                value: value);
                            setState(() {});
                          },
                          style: const TextStyle(color: Colors.grey),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: "Search",
                            counterStyle: const TextStyle(color: Colors.grey),
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.only(left: 0),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: categories.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : DropdownButtonFormField(
                                    dropdownColor: const Color(0xff252836),
                                    // set value is first index in categories
                                    value: categories[0],
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        overflow: TextOverflow.ellipsis),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    focusColor: Colors.transparent,
                                    items: categories
                                        .map(
                                          (category) => DropdownMenuItem(
                                            value: category,
                                            child: Text(category.categoryName),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (dynamic value) async {
                                      print('value: ${value.categoryName}');
                                      if (value.categoryName == 'All') {
                                        products = await _productRepository
                                            .getAllProduct2();
                                        setState(() {});
                                      } else {
                                        products = await _productRepository
                                            .getProductsByCategoryId(
                                                value: value.categoryId);
                                        setState(() {});
                                      }
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.only(left: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 0.5, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 0.5, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7375,
                        ),
                        shrinkWrap: true,
                        itemCount: products.length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          Product product = products[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: Image.network(product.image),
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            product.productName,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "\$${product.price}  ",
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                          const Icon(
                                            Icons.fiber_manual_record,
                                            size: 10,
                                            color: Colors.grey,
                                          ),
                                          Text("  ${product.amount} Kho",
                                              style: const TextStyle(
                                                  color: Colors.grey))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  margin: EdgeInsets.zero,
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AlertDialog(
                                                    content: Column(
                                                  children: [
                                                    const Text(
                                                      'Thêm vào bàn',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    myTextFormField(
                                                        controller:
                                                            _addController,
                                                        prefixIcon:
                                                            Icons.redo_outlined,
                                                        labelText:
                                                            "Số lượng cần thêm",
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 135,
                                                      child: ElevatedButton(
                                                        onPressed: () async {
                                                          Map<String, dynamic>
                                                              map = {
                                                            'tableId': widget
                                                                .indexTable,
                                                            'productId': product
                                                                .productId,
                                                            'amount': int.parse(
                                                                _addController
                                                                    .text)
                                                          };
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'tableNow')
                                                              .add(
                                                                map,
                                                              );
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                  'Đã thêm'),
                                                            ),
                                                          );
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      DetailsTableScreen(
                                                                          index:
                                                                              widget.indexTable)));
                                                        },
                                                        child:
                                                            const Text("Thêm"),
                                                        style: ElevatedButton.styleFrom(
                                                            primary:
                                                                const Color(
                                                                    0xff3ac5c8),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8))),
                                                      ),
                                                    )
                                                  ],
                                                ))
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.edit_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      "Thêm món",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff3AC5C8),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ]),
              ),
            ),
          );
  }
}
