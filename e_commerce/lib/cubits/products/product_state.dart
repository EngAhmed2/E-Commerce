part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductSuccess extends ProductState {
  final Data _productData;
  ProductSuccess(this._productData);
}
class ProductNetworkFailed extends ProductState {}
class ProductFailed extends ProductState {}
