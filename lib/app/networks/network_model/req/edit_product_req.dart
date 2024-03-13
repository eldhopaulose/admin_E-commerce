class UpdateProductReq {
  String? error;
  String? name;
  List<String>? image;
  String? about;
  String? price;
  String? discount;

  UpdateProductReq(
      {this.error,
      this.name,
      this.image,
      this.about,
      this.price,
      this.discount});

  UpdateProductReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    image = json['image'].cast<String>();
    about = json['about'];
    price = json['price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['name'] = this.name;
    data['image'] = this.image;
    data['about'] = this.about;
    data['price'] = this.price;
    data['discount'] = this.discount;
    return data;
  }
}
