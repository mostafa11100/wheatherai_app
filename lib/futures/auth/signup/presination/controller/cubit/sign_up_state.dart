// ignore_for_file: must_be_immutable

part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailur extends SignUpState {
  String error;
  SignUpFailur(this.error);
}

final class SignUppasswordstate extends SignUpState {
  bool visible;
  SignUppasswordstate(this.visible);
}
