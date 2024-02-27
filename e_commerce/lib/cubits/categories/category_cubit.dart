import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/apis/models/category_model.dart';
import 'package:e_commerce/apis/reposetory/category_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

   CategoryModels? _categories;
   List<Datum>? categoriesData;

  void getCategories()async{

    final connectivityResult = await Connectivity().checkConnectivity();
    bool notConnect = (connectivityResult == ConnectivityResult.none);
    if (notConnect) {
      emit(CategoryNetworkFailed());
    }

    try {
      emit(CategoryLoading());
      _categories = await CategoryRepo().getCategories();
      categoriesData = _categories!.data.data;
      emit(CategorySuccess(categoriesData!));
    } on Exception catch (e) {
      if(categoriesData == null && notConnect){
        emit(CategoryNetworkFailed());
      }
      else {
        emit(CategoryFailed());
      }
    }

  }


}
