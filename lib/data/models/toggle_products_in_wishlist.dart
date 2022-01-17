class ToggleProductsInWishlistData {
/*
{
  "msg": "messages.product_has_been_added_to_your_wishlist"
}
*/

  String? msg;

  ToggleProductsInWishlistData({
    this.msg,
  });
  ToggleProductsInWishlistData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class ToggleProductsInWishlist {
/*
{
  "data": {
    "msg": "messages.product_has_been_added_to_your_wishlist"
  }
}
*/

  ToggleProductsInWishlistData? data;

  ToggleProductsInWishlist({
    this.data,
  });
  ToggleProductsInWishlist.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? ToggleProductsInWishlistData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
