// ignore_for_file: must_be_immutable

part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSucces extends SigninState {}

final class SigninFailure extends SigninState {
  String error;
  SigninFailure(this.error);
}

final class TextFeildState extends SigninState {
  bool visible;
  TextFeildState(this.visible);
}
