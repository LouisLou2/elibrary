class EmailCodeParam {
  final String email;
  final String code;

  EmailCodeParam({required this.email, required this.code});

  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
      };
}