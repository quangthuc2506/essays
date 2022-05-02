import 'package:essays/models/category.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/category/category_repository.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/1management/view/product/management_product_screen.dart';
import 'package:essays/widgets/product_edit_my_text_form_field.dart';
import 'package:flutter/material.dart';

class ProductEditScreen extends StatefulWidget {
  Product product;

  ProductEditScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  final CategoryRepository _categoryRepository = CategoryRepository();
  final ProductRepository _productRepository = ProductRepository();

  final TextEditingController _maSPController = TextEditingController();
  final TextEditingController _tenSPController = TextEditingController();
  final TextEditingController _giavonController = TextEditingController();
  final TextEditingController _giaBanController = TextEditingController();
  final TextEditingController _tonKhoController = TextEditingController();
  final TextEditingController _moTaSPController = TextEditingController();
  final TextEditingController _saleController = TextEditingController();
  final TextEditingController _themVaoKhoController = TextEditingController();
  final TextEditingController _giamKhoController = TextEditingController();

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
    if (_maSPController.text.isEmpty ||
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
    _tenSPController.text = widget.product.productName;
    _maSPController.text = widget.product.productId;
    _giaBanController.text = widget.product.price.toString();
    _giavonController.text = widget.product.cost.toString();
    _tonKhoController.text = widget.product.amount.toString();
    _moTaSPController.text = widget.product.details;
    _giamKhoController.text = '0';
    _themVaoKhoController.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('product name: ${categories.length}');
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: const Image(
            image: AssetImage(AppAssets.backgroundAppbar),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          title: const Text("Chỉnh sửa"),
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
              onPressed: () {
                if (checkValidate()) {
                  _productRepository.updateProduct(
                      int.parse(_tonKhoController.text),
                      category!.categoryId,
                      int.parse(_giavonController.text),
                      _moTaSPController.text,
                      widget.product.image,
                      int.parse(_giaBanController.text),
                      _maSPController.text,
                      _tenSPController.text,
                      _moTaSPController.text,
                      _saleController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Đã lưu'),
                    ),
                  );
                  Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProductsManagementScreen()),(route) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar( 
                    const SnackBar(
                      content: Text('Vui lòng nhập đủ thông tin'),
                    ),
                  );
                }
              },
              child: const Text("Lưu"),
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
                      widget.product.image =
                          await _productRepository.getImage();
                      setState(() {});
                    },
                    child: Image.network(widget.product.image)),
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
                        value: getNameById(widget.product.categoryId),
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
                      readOnly: true),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, left: 10),
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AlertDialog(
                                          content: Column(
                                        children: [
                                          const Text(
                                            'Cập nhật tồn kho',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          myTextFormField(
                                              controller: _themVaoKhoController,
                                              prefixIcon: Icons.redo_outlined,
                                              labelText: "Số lượng cần thêm",
                                              width: width * 0.6),
                                          myTextFormField(
                                              controller: _giamKhoController,
                                              prefixIcon: Icons.undo_outlined,
                                              labelText: "Số lượng cần giảm",
                                              width: width * 0.6),
                                          SizedBox(
                                            height: 40,
                                            width: 135,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _tonKhoController
                                                    .text = (int.parse(
                                                            _tonKhoController
                                                                .text) +
                                                        int.parse(
                                                            _themVaoKhoController
                                                                .text) -
                                                        int.parse(
                                                            _giamKhoController
                                                                .text))
                                                    .toString();
                                                Navigator.pop(context);
                                                _themVaoKhoController.text =
                                                    '0';
                                                _giamKhoController.text = '0';
                                                setState(() {});

                                                print(
                                                    "ton kho: ${_tonKhoController.text}");
                                              },
                                              child: const Text("Cập nhật"),
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      const Color(0xff3ac5c8),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8))),
                                            ),
                                          )
                                        ],
                                      ))
                                    ],
                                  );
                                });
                          },
                          child: const Text(
                            "Cập nhật tồn kho",
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff3ac5c8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                    ],
                  )
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
