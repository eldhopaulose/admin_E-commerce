class ProductReq {
  String? name;
  List<String>? image;
  String? about;
  String? price;
  String? discount;
  String? error;

  ProductReq(
      {this.name,
      this.image,
      this.about,
      this.price,
      this.discount,
      this.error});

  ProductReq.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'].cast<String>();
    about = json['about'];
    price = json['price'];
    discount = json['discount'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['about'] = this.about;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['error'] = this.error;
    return data;
  }
}
