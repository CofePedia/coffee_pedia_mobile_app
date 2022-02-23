import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/add_to_basket.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/models/coupon.dart';
import 'package:coffepedia/data/models/remove_from_basket.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  final BasketRepository basketRepository;
  BasketCubit(this.basketRepository) : super(BasketInitial());

  void getBasket() {
    basketRepository.getBasket().then(
      (value) {
        emit(BasketLoaded(value));
      },
    );
  }

  void getBasketFromLocal() {
    basketRepository.getBasket().then(
      (value) {
        emit(BasketLoaded(value));
      },
    );
  }

  void getAddToBasket(List<Map<String, int>> productsMap) {
    basketRepository.getAddToBasket(productsMap).then(
      (value) {
        emit(AddToBasketIsPressed(value));
      },
    );
  }

  void getRemoveFromBasket(String productId) {
    basketRepository.getRemoveFromBasket(productId).then(
      (value) {
        emit(RemoveFromBasketIsPressed(value));
      },
    );
  }

  /////////////////////////////////
  Future<List<BasketLocal>?> getAllLocalProductsFromBasket() async {
    print("local 0");
    basketRepository.getAllLocalProductsFromBasket().then((basketList) async {
      print("local 1");
      print("0- emit local data " + basketList.length.toString());
      // try to get the products using this list's product_id
      /*final productRepository = ProductRepository(ProductWebServices(),);
          List<Product> products = [];
          for(int i = 0 ; i < basketList.length ; i++) {
            var product = await productRepository.getProduct(int.parse(basketList.elementAt(i).productId.toString()));
            products.add(product);
          }
          print("emit local data products length = " + products.length.toString());*/
      emit(
        LocalBasketLoaded(basketList),
      );
      // emit(AddToCartPressed(basketList),);
      print("local 1 again");
      return basketList;
    }).catchError((error) {
      print("local 2");
      print("retrieve local basket error $error");
      emit(LocalBasketError(error.toString()));
      return [];
    });
  }

  Future addProductInLocalBasket(BasketLocal basketLocal) async {
    List<BasketLocal> baskets =
        await basketRepository.getAllLocalProductsFromBasket();
    ///////prints
    print("baskets in cubit = " + baskets.length.toString());
    for (int i = 0; i < baskets.length; i++) {
      print("prod id = " + baskets.elementAt(i).productId.toString());
      print("quantity = " + baskets.elementAt(i).quantity.toString());
    }
    ///////prints
    bool itemFound = false;
    baskets.forEach((element) async {
      if (element.productId == basketLocal.productId) {
        print("update in cubit ");
        // update this row..
        itemFound = true;
        await basketRepository
            .updateQuantityInLocalBasket(
                basketLocal.productId!, basketLocal.quantity!)
            .then(
              (value) => emit(
                UpdateLocalBasket(),
              ),
            )
            .catchError((error) {
          print("local basket error $error");
          emit(UpdateLocalBasketError(error.toString()));
        });
      }
    });
    if (!itemFound) {
      print("new row in cubit ");
      // new row..
      await basketRepository
          .addProductInLocalBasket(basketLocal)
          .then(
            (value) => emit(
              UpdateLocalBasket(),
            ),
          )
          .catchError((error) {
        print("local basket error $error");
        emit(AddedLocalBasketError(error.toString()));
      });
    }
    //TODO 2) get all items from the local database..
    List<Map<String, int>> basket = [];
    print("A 1");
    List<BasketLocal> basketInLocal =
        await basketRepository.getAllLocalProductsFromBasket();
    print("A 2++");
    if (basketInLocal == null) print(" A 2++ null");
    if (basketInLocal != null && basketInLocal.isNotEmpty) {
      print("A 2 inside if");
      print("A 2 " + basketInLocal.length.toString());
      basketInLocal.forEach((element) {
        Map<String, int> basketMap = {
          "product_id": int.parse(element.productId.toString()),
          "quantity": int.parse(element.quantity.toString())
        };
        basket.add(basketMap);
      });
    } else {
      print("A 2--");
    }
    print("A 3");
    //TODO 3) send all the products to the database..
    basketRepository.getAddToBasket(basket).then((value) {
      emit(AddToBasketIsPressed(value));
    });
  }

  void deleteFromLocalBasket(int productId) async {
    await basketRepository.deleteFromLocalBasket(productId).then((value) async {
      emit(
        RemoveFromLocalBasketIsPressed(),
      );

      //TODO 2) get all items from the local database..
      List<Map<String, int>> basket = [];
      print("A 1");
      List<BasketLocal> basketInLocal =
          await basketRepository.getAllLocalProductsFromBasket();
      print("A 2++");
      if (basketInLocal == null) print(" A 2++ null");
      if (basketInLocal != null && basketInLocal.isNotEmpty) {
        print("A 2 inside if");
        print("A 2 " + basketInLocal.length.toString());
        basketInLocal.forEach((element) {
          Map<String, int> basketMap = {
            "product_id": int.parse(element.productId.toString()),
            "quantity": int.parse(element.quantity.toString())
          };
          basket.add(basketMap);
        });
      } else {
        print("A 2--");
      }
      print("A 3");
      //TODO 3) send all the products to the database..
      if (basket.length > 0) {
        basketRepository.getAddToBasket(basket).then((value) {
          emit(AddToBasketIsPressed(value));
        });
      } else {
        basketRepository
            .getRemoveFromBasket(productId.toString())
            .then((value) {
          emit(RemoveFromLocalBasketIsPressed());
        });
      }
    }).catchError((error) {
      print("update local basket error $error");
      emit(DeleteLocalBasketError(error.toString()));
    });
  }

  void updateQuantityInLocalBasket(int productId, int quantity) async {
    basketRepository
        .updateQuantityInLocalBasket(productId, quantity)
        .then((value) async {
      emit(
        UpdateLocalBasket(),
      );
      //TODO 2) get all items from the local database..
      List<Map<String, int>> basket = [];
      print("A 1");
      List<BasketLocal> basketInLocal =
          await basketRepository.getAllLocalProductsFromBasket();
      print("A 2++");
      if (basketInLocal == null) print(" A 2++ null");
      if (basketInLocal != null && basketInLocal.isNotEmpty) {
        print("A 2 inside if");
        print("A 2 " + basketInLocal.length.toString());
        basketInLocal.forEach((element) {
          Map<String, int> basketMap = {
            "product_id": int.parse(element.productId.toString()),
            "quantity": int.parse(element.quantity.toString())
          };
          basket.add(basketMap);
        });
      } else {
        print("A 2--");
      }
      print("A 3");
      //TODO 3) send all the products to the database..
      basketRepository.getAddToBasket(basket).then((value) {
        emit(AddToBasketIsPressed(value));
      });
    }).catchError((error) {
      print("delete local basket error $error");
      emit(UpdateLocalBasketError(error.toString()));
    });
  }

  void incrementQuantityInLocalBasket(int productId) async {
    basketRepository
        .incrementQuantityInLocalBasket(productId)
        .then(
          (value) => emit(
            UpdateLocalBasket(),
          ),
        )
        .catchError((error) {
      print("delete local basket error $error");
      emit(UpdateLocalBasketError(error.toString()));
    });
  }

  void decrementQuantityInLocalBasket(int productId) async {
    basketRepository
        .decrementQuantityInLocalBasket(productId)
        .then(
          (value) => emit(
            UpdateLocalBasket(),
          ),
        )
        .catchError((error) {
      print("delete local basket error $error");
      emit(UpdateLocalBasketError(error.toString()));
    });
  }

  void getCoupon(String coupon) {
    basketRepository
        .postCoupon(coupon)
        .then((value) => emit(
              CouponIsPressed(value),
            ))
        .catchError(
          (error) => emit(
            CouponUnvalid(error),
          ),
        );
  }
}
