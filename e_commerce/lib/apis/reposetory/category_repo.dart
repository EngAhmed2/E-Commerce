

import 'package:dio/dio.dart';
import 'package:e_commerce/apis/models/category_items.dart';
import 'package:e_commerce/apis/models/category_model.dart';

class CategoryRepo{
  final _dio = Dio();
  static const String categoryPath = "https://student.valuxapps.com/api/categories/";

  Future<CategoryModels> getCategories()async{

    final response = await _dio.get(categoryPath);
    final categoriesData = CategoryModels.fromJson(response.data);
    return categoriesData;
  }
  Future<CategoryItems> getCategoryDetail(int id)async{

    final response = await _dio.get("$categoryPath$id");
    final categoryDetails = CategoryItems.fromJson(response.data);
    return categoryDetails;
  }
}
