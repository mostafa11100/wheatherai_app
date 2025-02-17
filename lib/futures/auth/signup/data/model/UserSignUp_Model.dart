// ignore_for_file: file_names

class UsersignupModel {
  String? name;
  String? uid;
  String? email;
  String? password;
  //map? Bi;
  Map<String, dynamic>? birthdate = {};
  double? weight;
  int? tall;
  String? phone;
  int? age;
  String? address;
  Map<String, dynamic>? json = {};
  UsersignupModel({
    this.name,
    this.uid,
    this.birthdate,
    this.address,
    this.age,
    this.phone,
    this.tall,
    this.weight,
    this.email,
    this.password,
  });
  Map<String, dynamic> tojson() {
    name != null ? json!['name'] = name : null;

    address != null ? json!['address'] = address : null;
    age != null ? json!['age'] = age : null;
    tall != null ? json!['tall'] = tall : null;
    weight != null ? json!['weight'] = weight : null;
    phone != null ? json!['phone'] = phone : null;
    uid != null ? json!['uid'] = uid : null;
    email != null ? json!['email'] = email : null;
    password != null ? json!['password'] = uid : null;
    json!['birthdate'] = birthdate;

    return json!;
  }
}
