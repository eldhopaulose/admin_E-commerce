class GetProductRes {
  String? error;
  List<Products>? products;

  GetProductRes({this.error, this.products});

  GetProductRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  String? name;
  List<String>? image;
  String? about;
  String? price;
  String? discount;
  int? iV;

  Products(
      {this.sId,
      this.name,
      this.image,
      this.about,
      this.price,
      this.discount,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'].cast<String>();
    about = json['about'];
    price = json['price'];
    discount = json['discount'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['about'] = this.about;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['__v'] = this.iV;
    return data;
  }
}
