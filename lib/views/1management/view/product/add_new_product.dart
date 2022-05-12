import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:essays/models/category.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/category/category_repository.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/widgets/product_edit_my_text_form_field.dart';
import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  
  const AddNewProductScreen({Key? key}) : super(key: key);

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final CategoryRepository _categoryRepository = CategoryRepository();
  final ProductRepository _productRepository = ProductRepository();

  final TextEditingController _maSPController = TextEditingController();
  final TextEditingController _tenSPController = TextEditingController();
  final TextEditingController _giavonController = TextEditingController();
  final TextEditingController _giaBanController = TextEditingController();
  final TextEditingController _tonKhoController = TextEditingController();
  final TextEditingController _moTaSPController = TextEditingController();
  final TextEditingController _saleController = TextEditingController();
  List<Category> categories = [];
  String imageUrl = '';
  Category? category;
  getAllCategories() async {
    categories = await _categoryRepository.getAllCategories2();
    categories.removeAt(0);
    category = categories[0];

    setState(() {});
  }

  getNameById(String id) {
    for (Category category in categories) {
      if (category.categoryId == id) {
        return category;
      }
    }
  }

  bool checkValidate() {
    if (imageUrl.isEmpty ||
        _maSPController.text.isEmpty ||
        _tenSPController.text.isEmpty ||
        _tenSPController.text.isEmpty ||
        _giaBanController.text.isEmpty ||
        _giavonController.text.isEmpty ||
        _tonKhoController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: const Image(
            image: AssetImage(AppAssets.backgroundAppbar),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          title: const Text("Thêm sản phẩm"),
          backgroundColor: const Color(0xff1E212C),
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          )),
      bottomSheet: SizedBox(
        height: 75,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            height: 50,
            width: 135,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Huỷ bỏ",
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xffEA7C69),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xffEA7C69)),
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          SizedBox(
            height: 50,
            width: 135,
            child: ElevatedButton(
              onPressed: () async {
                if (checkValidate()) {
                  final check = await FirebaseFirestore.instance
                      .collection('category')
                      .where('productId', isEqualTo: _maSPController.text)
                      .get();
                  if (check.docs.isEmpty) {
                    _productRepository.addNewProduct(
                        int.parse(_tonKhoController.text),
                        category!.categoryId,
                        int.parse(_giavonController.text),
                        _moTaSPController.text,
                        imageUrl,
                        int.parse(_giaBanController.text),
                        _maSPController.text,
                        _tenSPController.text,
                        _moTaSPController.text,
                        _saleController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Thêm sản phẩm thành công'),
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Mã sản phẩm đã tồn tại!'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Vui lòng nhập đủ thông tin'),
                    ),
                  );
                }
              },
              child: const Text("Thêm"),
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xff3ac5c8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          )
        ]),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[100],
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () async {
                    imageUrl = await _productRepository.getImage();
                    setState(() {});
                    // Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AddNewProductScreen(
                    //                           product: product)));
                  },
                  child: imageUrl.isNotEmpty
                      ? Image(
                          image: NetworkImage(imageUrl),
                        )
                      : Card(
                          color: Colors.white,
                          child: DottedBorder(
                              color: Colors.red,
                              strokeWidth: 1,
                              radius: const Radius.circular(5),
                              borderType: BorderType.RRect,
                              dashPattern: const [5, 5],
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                      "Thêm ảnh",
                                      style: TextStyle(
                                          color: Color(0xffea7c69),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ))),
                ),
              ),
              Container(
                height: 40,
                width: 100,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: categories.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : DropdownButtonFormField(
                        dropdownColor: const Color(0xff252836),
                        // set value is first index in categories
                        value: categories[1],
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
                          category = value;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.only(left: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
              ),
              myTextFormField(
                  controller: _maSPController,
                  labelText: "Mã sản phẩm",
                  prefixIcon: Icons.style),
              myTextFormField(
                  controller: _tenSPController,
                  labelText: "Tên sản phẩm",
                  prefixIcon: Icons.style),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myTextFormField(
                      controller: _giaBanController,
                      prefixIcon: Icons.attach_money,
                      labelText: "Giá bán",
                      width: width * 0.4),
                  myTextFormField(
                      controller: _giavonController,
                      prefixIcon: Icons.money_off,
                      labelText: "giá vốn",
                      width: width * 0.4),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  myTextFormField(
                    controller: _tonKhoController,
                    prefixIcon: Icons.opacity,
                    labelText: "Tồn kho",
                    width: width * 0.5,
                  ),
                ],
              ),
              myTextFormField(
                controller: _moTaSPController,
                prefixIcon: Icons.description,
                labelText: "Mô tả",
              ),
              myTextFormField(
                controller: _saleController,
                prefixIcon: Icons.description,
                labelText: "Sale",
              ),
              // SizedBox(
              //   height: 60,
              //   width: width,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: const Text("Save changes"),
              //     style: ElevatedButton.styleFrom(
              //         primary: const Color(0xff3AC5C8),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(8))),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
