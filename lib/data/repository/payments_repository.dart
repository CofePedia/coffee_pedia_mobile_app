import 'package:coffepedia/data/models/payment.dart';
import 'package:coffepedia/data/web_services/payments_web_services.dart';

class PaymentsRepository {
  final PaymentsWebServices paymentsWebServices;

  PaymentsRepository(this.paymentsWebServices);

  Future<Payments> getPayments() async {
    final payments = paymentsWebServices.getPayment();
    return payments;
  }
}
