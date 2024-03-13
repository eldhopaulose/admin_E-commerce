class UpdateProductImageReq {
  String? error;
  String? image;

  UpdateProductImageReq({this.error, this.image});

  UpdateProductImageReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['image'] = this.image;
    return data;
  }
}
