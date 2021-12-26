part of 'brands_cubit.dart';

@immutable
abstract class BrandsState {}

class BrandsInitial extends BrandsState {}

class BrandsLoaded extends BrandsState {
  final Brands? brands;
  BrandsLoaded(this.brands);
}
