class RegisterReq {
  String? email;
  String? name;
  String? password;
  String? error;

  RegisterReq({this.email, this.name, this.password, this.error});

  RegisterReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['error'] = this.error;
    return data;
  }
}
