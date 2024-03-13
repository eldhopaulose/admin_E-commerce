class DeleteProductImageReq {
  String? error;
  List<String>? image;

  DeleteProductImageReq({this.error, this.image});

  DeleteProductImageReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['image'] = this.image;
    return data;
  }
}
