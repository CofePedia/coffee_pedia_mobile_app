part of 'payments_cubit.dart';

@immutable
abstract class PaymentsState {}

class PaymentsInitial extends PaymentsState {}

class PaymentsLoaded extends PaymentsState {
  final Payments? payments;
  PaymentsLoaded(this.payments);
}
