part of 'filters_cubit.dart';

@immutable
abstract class FiltersState {}

class FiltersInitial extends FiltersState {}

class RegionsLoaded extends FiltersState {
  final Regions? regions;
  RegionsLoaded(this.regions);
}

class RoastsLoaded extends FiltersState {
  final Roasts? roasts;
  RoastsLoaded(this.roasts);
}

class FlavorsLoaded extends FiltersState {
  final Flavors? flavors;
  FlavorsLoaded(this.flavors);
}
