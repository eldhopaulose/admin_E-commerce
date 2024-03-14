class ProductReq {
  String? error;
  String? name;
  List<String>? image;
  String? about;
  String? price;
  String? discount;
  String? categories;

  ProductReq(
      {this.error,
      this.name,
      this.image,
      this.about,
      this.price,
      this.discount,
      this.categories});

  ProductReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    image = json['image'].cast<String>();
    about = json['about'];
    price = json['price'];
    discount = json['discount'];
    categories = json['categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['name'] = this.name;
    data['image'] = this.image;
    data['about'] = this.about;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['categories'] = this.categories;
    return data;
  }
}
