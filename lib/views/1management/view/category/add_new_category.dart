import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:essays/repository/category/category_repository.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/widgets/product_edit_my_text_form_field.dart';
import 'package:flutter/material.dart';

class AddNewCategoryScreen extends StatefulWidget {
  const AddNewCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCategoryScreen> createState() => _AddNewCategoryScreenState();
}

class _AddNewCategoryScreenState extends State<AddNewCategoryScreen> {
  final CategoryRepository _categoryRepository = CategoryRepository();
  final ProductRepository _productRepository = ProductRepository();

  final TextEditingController _maLSPController = TextEditingController();
  final TextEditingController _tenLSPController = TextEditingController();

  String imageUrl = '';

  bool checkValidate() {
    if (imageUrl.isEmpty ||
        _maLSPController.text.isEmpty ||
        _tenLSPController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
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
                      .where('categoryId', isEqualTo: _maLSPController.text)
                      .get();
                  print('check 2: ${check.docs.isEmpty}');
                  if (check.docs.isEmpty) {
                    _categoryRepository.addNewCategory(imageUrl,
                        _maLSPController.text, _tenLSPController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Thêm thành công!'),
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Mã loại sản phẩm đã tồn tại!'),
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
                    String k = await _productRepository.getImage();
                    if (k.isNotEmpty) {
                      imageUrl = k;
                    }
                    setState(() {});
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
              myTextFormField(
                  controller: _maLSPController,
                  labelText: "Mã sản phẩm",
                  prefixIcon: Icons.style),
              myTextFormField(
                  controller: _tenLSPController,
                  labelText: "Tên sản phẩm",
                  prefixIcon: Icons.style),
            ],
          ),
        ),
      ),
    );
  }
}
