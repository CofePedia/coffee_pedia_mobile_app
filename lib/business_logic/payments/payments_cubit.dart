import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/payment.dart';
import 'package:coffepedia/data/repository/payments_repository.dart';
import 'package:meta/meta.dart';

part 'payments_state.dart';

class PaymentsCubit extends Cubit<PaymentsState> {
  final PaymentsRepository paymentsRepository;
  PaymentsCubit(this.paymentsRepository) : super(PaymentsInitial());

  void getPayments() {
    paymentsRepository.getPayments().then(
      (value) {
        emit(PaymentsLoaded(value));
      },
    );
  }
}
