import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/apis/models/home_model.dart';
import 'package:e_commerce/apis/reposetory/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProduct()async{
    HomeModels? productData;
    final connectivityResult = await Connectivity().checkConnectivity();
    bool notConnect = (connectivityResult == ConnectivityResult.none);
    if (notConnect) {
      emit(ProductNetworkFailed());
    }

    try {
      emit(ProductLoading());
      productData = await ProductRepo().getProductsData();
      emit(ProductSuccess(productData.data));

    } on Exception catch (e) {
      if(productData == null && notConnect){
        emit(ProductNetworkFailed());
      }
      else{
        emit(ProductFailed());
      }
    }

  }
}
