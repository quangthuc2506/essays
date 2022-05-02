import 'package:dotted_border/dotted_border.dart';
import 'package:essays/models/category.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/category/category_repository.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/view/category/add_new_category.dart';
import 'package:essays/views/1management/view/category/category_edit.dart';
import 'package:flutter/material.dart';

class CategoryManagementScreen extends StatefulWidget {
  const CategoryManagementScreen({Key? key}) : super(key: key);

  @override
  State<CategoryManagementScreen> createState() =>
      _CategoryManagementScreenState();
}

class _CategoryManagementScreenState extends State<CategoryManagementScreen> {
  final CategoryRepository _categoryRepository = CategoryRepository();
  final ProductRepository _productRepository = ProductRepository();
  List<Category> categories = [];
  List<Product> products = [];
  List<Category> categoriesMap = [];
  @override
  void initState() {
    getAllCategories();
    getAllProduct();
    super.initState();
  }

  void getAllProduct() {
    _productRepository.getAllProduct().listen((pros) async {
      products = pros;
      setState(() {});
    });
  }

  void getAllCategories() {
    _categoryRepository.getAllCategories().listen((event) async {
      categories = event;
      setState(() {});
    });
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
    categoriesMap = categories;

    return categories.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              flexibleSpace: const Image(
                image: AssetImage(AppAssets.backgroundAppbar),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
              title: const Text("Loại sản phẩm"),
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
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
                            categories = await _categoryRepository
                                .getAllCategories2(value: value);
                            setState(() {});
                          },
                          style: const TextStyle(color: Colors.grey),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
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
                            child: categoriesMap.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : DropdownButtonFormField(
                                    dropdownColor: const Color(0xff252836),
                                    // set value is first index in categories
                                    value: categoriesMap[0],
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        overflow: TextOverflow.ellipsis),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    focusColor: Colors.transparent,
                                    items: categoriesMap
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
                                        categories = await _categoryRepository
                                            .getAllCategories2();
                                        setState(() {});
                                      } else {
                                        categories = await _categoryRepository
                                            .getAllCategories2(
                                                value: value.categoryName);
                                        setState(() {});
                                      }
                                    },
                                    decoration: InputDecoration(
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
                        itemCount: categories.length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          Category category = categories[index];
                          return index == 0
                              ? InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AddNewCategoryScreen()));
                                  },
                                  child: Card(
                                      child: DottedBorder(
                                          color: Colors.red,
                                          strokeWidth: 1,
                                          radius: const Radius.circular(5),
                                          borderType: BorderType.RRect,
                                          dashPattern: const [5, 5],
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.add,
                                                  color: Color(0xffEA7C69),
                                                  size: 25,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "Thêm loại sản phẩm",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xffea7c69),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ))),
                                )
                              : Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 75,
                                              height: 75,
                                              child: Image.network(
                                                category.icon,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 120,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  category.categoryName,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.fiber_manual_record,
                                                  size: 10,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                    "  ${getAmountProductByCategoryId(category.categoryId)} sản phẩm",
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
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditCategoryScreen(
                                                          category: category,
                                                        )));
                                          },
                                          icon: const Icon(
                                            Icons.edit_outlined,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          label: const Text(
                                            "Chỉnh sửa",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color(0xff3AC5C8),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
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
