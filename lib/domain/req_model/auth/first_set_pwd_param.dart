class FirstSetPwdParam {
  String email;
  String password;

  FirstSetPwdParam({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}