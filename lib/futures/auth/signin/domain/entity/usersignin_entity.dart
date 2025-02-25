import 'package:equatable/equatable.dart';

class UsersigninEntity extends Equatable {
  String? email;
  String? password;

  UsersigninEntity(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
