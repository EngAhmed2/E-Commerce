part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategorySuccess extends CategoryState {
  final List<Datum> categoriesData;

  CategorySuccess(this.categoriesData);
}
class CategoryFailed extends CategoryState {}
class CategoryNetworkFailed extends CategoryState {}
