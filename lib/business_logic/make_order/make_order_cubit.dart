import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/make_order.dart';
import 'package:coffepedia/data/repository/make_order_repository.dart';
import 'package:meta/meta.dart';

part 'make_order_state.dart';

class MakeOrderCubit extends Cubit<MakeOrderState> {
  final MakeOrderRepository makeOrderRepository;
  MakeOrderCubit(this.makeOrderRepository) : super(MakeOrderInitial());

  void getMakeOrder(String addressId, String paymentId) {
    makeOrderRepository.getMakeOrder(addressId, paymentId).then(
      (value) {
        emit(MakeOrderIsLoaded(value));
      },
    );
  }
}
