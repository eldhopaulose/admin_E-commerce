class ProductRes {
  String? error;
  Product? product;

  ProductRes({this.error, this.product});

  ProductRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? name;
  List<String>? image;
  String? about;
  String? price;
  String? discount;
  String? sId;
  int? iV;

  Product(
      {this.name,
      this.image,
      this.about,
      this.price,
      this.discount,
      this.sId,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'].cast<String>();
    about = json['about'];
    price = json['price'];
    discount = json['discount'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['about'] = this.about;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
