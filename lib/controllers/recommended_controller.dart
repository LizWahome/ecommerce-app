import 'package:ecommerce_app/models/popular_products.dart';
import 'package:get/get.dart';

import '../data/api/repository/recommended_repo.dart';

class RecommendedController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedController({required this.recommendedProductRepo});

  List<ProductsModel> _recommendedProductList = [];
  List<ProductsModel> get recommendedProductList => _recommendedProductList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
    }
  }
}
