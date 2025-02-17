class SignUpEntity {
  String? name;
  String? uid;
  double? weight;
  Map<String, dynamic>? birthdate = {};
  int? tall;
  String? email;
  String? password;
  SignUpEntity({
    this.email,
    this.password,
    this.name,
    this.birthdate,
    this.tall,
    this.weight,
    this.uid,
  });
}
