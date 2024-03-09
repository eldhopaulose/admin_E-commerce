class LoginReq {
  String? email;
  String? password;
  String? error;

  LoginReq({this.email, this.password, this.error});

  LoginReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['error'] = this.error;
    return data;
  }
}
