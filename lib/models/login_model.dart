class LoginModel {
  String name;
  String password;

  LoginModel({
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = name;
    data['password'] = password;
    data['request_token'] = '2b4bf252693d3e064df060b4fb1fc81992c6df31';
    return data;
  }
}
