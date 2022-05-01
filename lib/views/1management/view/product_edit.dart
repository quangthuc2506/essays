import 'package:essays/models/category.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/category/category_repository.dart';
import 'package:essays/values/app_assets.dart';
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

  List<Category> categories = [];
  final TextEditingController _maSPController = TextEditingController();
  final TextEditingController _tenSPController = TextEditingController();
  final TextEditingController _giavonController = TextEditingController();
  final TextEditingController _giaBanController = TextEditingController();
  final TextEditingController _tonKhoController = TextEditingController();
  final TextEditingController _moTaSPController = TextEditingController();
  getAllCategories() async {
    categories = await _categoryRepository.getAllCategories2();
    setState(() {});
  }

  getNameById(String id) {
    for (Category category in categories) {
      if (category.categoryId == id) {
        return category;
      }
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
          title: const Text("Product Edit"),
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
              onPressed: () {},
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
              onPressed: () {},
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
                child: Image.network(
                    widget.product.image),
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
                          print('value: ${value.categoryName}');
                          if (value.categoryName == 'All') {
                          } else {
                            
                          }
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
                          onPressed: () {},
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
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 85),
                child: myTextFormField(
                    controller: _moTaSPController,
                    prefixIcon: Icons.description,
                    labelText: "Mô tả",
                    height: height),
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
