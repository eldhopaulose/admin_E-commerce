class GetUserDetailsres {
  String? error;
  String? sId;
  String? email;
  String? name;
  String? password;
  int? iV;

  GetUserDetailsres(
      {this.error, this.sId, this.email, this.name, this.password, this.iV});

  GetUserDetailsres.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    sId = json['_id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['__v'] = this.iV;
    return data;
  }
}
