import 'package:get/get.dart';

import '../core/repository/product_repo.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;

  ProductController({required this.productRepo});

  List<dynamic> _productList = [];

  List<dynamic> get productList => _productList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> geProductList() async {
    _isLoading = true;
    Response response = await productRepo.getProduct();
    ///
    /// Check if the response is null or not
    ///
    // if (response.statusCode == 200) {
    //   _productList = [];
    //   _productList.addAll(Product.fromJson(response.body).products);
    //   _isLoading = false;
    //   update();
    // } else {}
  }
}
