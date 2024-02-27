import 'package:dio/dio.dart';
import 'package:e_commerce/apis/models/home_model.dart';

class Product_Repo{

  final _dio = Dio();
  static const String productPath = "https://student.valuxapps.com/api/";

  Future<HomeModels> getProductsData() async {
    const String path = "${productPath}home";
    final repo = await _dio.get(path);
    final productsData = HomeModels.fromJson(repo.data);
    return productsData;
  }

  Future<Product> getProductDetail(int id) async {
    String path = "${productPath}product/$id";
    final repo = await _dio.get(path);
    final productDetail = Product.fromJson(repo.data);
    return productDetail;
  }
}