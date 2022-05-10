import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:essays/models/category.dart';
import 'package:essays/models/product.dart';
import 'package:essays/repository/product/base_product_repository.dart';
import 'package:essays/views/1management/model/table_reserve.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() async* {
    await getCategoriesList();
    yield* _firebaseFirestore.collection('product').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        String id = Product.fromSnapshot(doc).categoryId;
        String name = getCategoryName(id);
        return Product.fromSnapshot(doc)..categoryname = name;
      }).toList();
    });
  }

  // Stream<List<DinnerTable>> getAllTable(String tableId) async* {
  //   yield* _firebaseFirestore
  //       .collection('table')
  //       .where('tableId', isEqualTo: tableId)
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return DinnerTable.fromSnapshot(doc);
  //     }).toList();
  //   });
  // }

  List<Category>? categoriesList;
  Future<List<Category>> getCategoriesList() async {
    List<Category> categoriesList1 = await _firebaseFirestore
        .collection('category')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    }).first;
    categoriesList = categoriesList1;
    return categoriesList1;
  }

  Future<List<Product>> getProductList() async {
    List<Product> productList = await _firebaseFirestore
        .collection('category')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    }).first;
    return productList;
  }

  Future<String> getImageProduct(String productId) async {
    List<Product> productList = await getProductList();
    for (var e in productList) {
      if (e.productId == productId) {
        return e.image;
      }
    }
    return '';
  }

  Future<Product> getProductByProductId({required String productId}) async {
    List<Product> productList = await getProductList();
    for (var e in productList) {
      if (e.productId == productId) {
        return e;
      }
    }
    return Product(
        categoryId: '',
        productId: '',
        productName: '',
        details: '',
        image: '',
        price: 0,
        review: '');
  }

  getReview(Product product) async {
    _firebaseFirestore
        .collection('product')
        .doc(product.productId)
        .collection('review')
        .snapshots()
        .map((snapshot) => null);
  }

  String getCategoryName(String categoryId) {
    for (Category ct in categoriesList!) {
      if (ct.categoryId == categoryId) {
        return ct.categoryName;
      }
    }
    return 'Food';
  }

  String getCategoryId(String categoryName) {
    for (Category ct in categoriesList!) {
      if (ct.categoryName == categoryName) {
        return ct.categoryId;
      }
    }
    return '001';
  }

  @override
  Stream<List<Product>> getHotProduct() async* {
    await getCategoriesList();
    yield* _firebaseFirestore
        .collection('product')
        .where('categoryId', whereIn: ['001', '002'])
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            String id = Product.fromSnapshot(doc).categoryId;
            String name = getCategoryName(id);
            return Product.fromSnapshot(doc)..categoryname = name;
          }).toList();
        });
  }

  @override
  Future<List<Product>> searchProduct({required String productName}) async {
    await getCategoriesList();
    List<Product> list = await _firebaseFirestore
        .collection('product')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        String id = Product.fromSnapshot(doc).categoryId;
        String name = getCategoryName(id);
        return Product.fromSnapshot(doc)..categoryname = name;
      }).toList();
    }).first;
    List<Product> filteredList = [];
    for (Product item in list) {
      String id = getCategoryId(productName);
      if (item.categoryId == id) {
        filteredList.add(item);
      }
    }
    return filteredList;
  }

  @override
  Stream<List<Product>> searchProductsByCategoryname(
      {required String categoryName}) async* {
    String? id;
    id = getCategoryId(categoryName);
    yield* _firebaseFirestore
        .collection('products')
        .where('categoryId', isEqualTo: id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<List<Product>> getAllProduct2({String? value}) async {
    List<Product> list = await _firebaseFirestore
        .collection('product')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromSnapshot(doc);
      }).toList();
    }).first;
    List<Product> filteredList = [];
    if (value != null) {
      filteredList.insert(
        0,
        Product(
            categoryId: "",
            productId: "",
            productName: "",
            details: "",
            image: "",
            price: 0,
            review: "",
            sale: "",
            cost: 0,
            amount: 0),
      );
      for (Product item in list) {
        if (item.productName.toLowerCase().contains(value.toLowerCase())) {
          filteredList.add(item);
        }
      }
    } else {
      filteredList.insert(
        0,
        Product(
            categoryId: "",
            productId: "",
            productName: "",
            details: "",
            image: "",
            price: 0,
            review: "",
            sale: "",
            cost: 0,
            amount: 0),
      );
      for (Product item in list) {
        filteredList.add(item);
      }
    }
    return filteredList;
  }

  Future<List<DinnerTable>> getAllTable({required String tableId}) async {
    List<DinnerTable> list = await _firebaseFirestore
        .collection('table')
        .where('tableId', isEqualTo: tableId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return DinnerTable.fromSnapshot(doc);
      }).toList();
    }).first;

    List<DinnerTable> filteredList1 = [];

    for (DinnerTable item in list) {
      filteredList1.add(item);
    }

    return filteredList1;
  }

  Future<List<Product>> getProductsByCategoryId({String? value}) async {
    List<Product> list = await _firebaseFirestore
        .collection('product')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromSnapshot(doc);
      }).toList();
    }).first;
    List<Product> filteredList = [];

    filteredList.insert(
      0,
      Product(
          categoryId: "",
          productId: "",
          productName: "",
          details: "",
          image: "",
          price: 0,
          review: "",
          sale: "",
          amount: 0),
    );
    for (Product item in list) {
      if (item.categoryId == value) {
        filteredList.add(item);
      }
    }

    return filteredList;
  }

  File? imageFile;
  Future<String> getImage() async {
    ImagePicker _picker = ImagePicker();
    String imgUrl = '';
    await _picker.pickImage(source: ImageSource.gallery).then((xFile) async {
      if (xFile != null) {
        imageFile = File(xFile.path);
        imgUrl = await uploadImage();
        return imgUrl;
      }
    });
    return imgUrl;
  }

  Future<String> uploadImage() async {
    String fileName = const Uuid().v1();
    var ref =
        FirebaseStorage.instance.ref().child('images').child('$fileName.jpg');
    var uploadTask = await ref.putFile(imageFile!);

    String imageUrl = await uploadTask.ref.getDownloadURL();
    return imageUrl;
  }

  addNewProduct(
      int amount,
      String categoryId,
      int cost,
      String details,
      String image,
      int price,
      String productId,
      String productName,
      String? review,
      String? sale) async {
    review ??= '5';
    sale ??= 'Phổ biến';
    Map<String, dynamic> productMap = {
      'amount': amount,
      'categoryId': categoryId,
      'cost': cost,
      'details': details,
      'image': image,
      'price': price,
      'productId': productId,
      'productName': productName,
      'review': review,
      'sale': sale
    };
    await FirebaseFirestore.instance
        .collection('product')
        .doc(productId)
        .set(productMap);
  }

  updateProduct(
      int amount,
      String categoryId,
      int cost,
      String details,
      String image,
      int price,
      String productId,
      String productName,
      String? review,
      String? sale) async {
    Map<String, dynamic> productMap = {
      'amount': amount,
      'categoryId': categoryId,
      'cost': cost,
      'details': details,
      'image': image,
      'price': price,
      'productId': productId,
      'productName': productName,
      'review': review,
      'sale': sale
    };
    await FirebaseFirestore.instance
        .collection('product')
        .doc(productId)
        .update(productMap);
  }
}
