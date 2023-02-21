import 'package:ecommerce_app/data/api/repository/popular_product_repo.dart';
import 'package:ecommerce_app/models/popular_products.dart';
import 'package:get/get.dart';

class PopolarProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopolarProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopuparProductList();
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      update();
    } else {}
  }
}
