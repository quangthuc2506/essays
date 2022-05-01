import 'package:essays/models/product.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/widgets/product_edit_my_text_form_field.dart';
import 'package:flutter/material.dart';

class AddNewProductScreen extends StatelessWidget {
  Product product;
  AddNewProductScreen({Key? key, required this.product}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    print('product name: ${product.productName}');
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
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.all(20),
                child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/test-bloc-todo.appspot.com/o/Spicy%20seasoned%20seafood%20noodles.png?alt=media&token=3e56b3da-3ea3-47f1-bd47-b6cbfc5e833c"),
              ),
              myTextFormField(
                  labelText: "Mã sản phẩm", prefixIcon: Icons.style),
              myTextFormField(
                  labelText: "Tên sản phẩm", prefixIcon: Icons.style),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myTextFormField(
                      prefixIcon: Icons.attach_money,
                      labelText: "Giá bán",
                      width: width * 0.4),
                  myTextFormField(
                      prefixIcon: Icons.money_off,
                      labelText: "giá nhập",
                      width: width * 0.4),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  myTextFormField(
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
