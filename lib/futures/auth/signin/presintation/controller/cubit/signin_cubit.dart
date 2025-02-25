import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/auth/signin/domain/entity/usersignin_entity.dart';
import 'package:wheater_app/futures/auth/signin/domain/usecases/signin_usecase.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninUsecase _signusecase;
  SigninCubit(this._signusecase) : super(SigninInitial());
  static SigninCubit blocprovider(context) {
    return BlocProvider.of<SigninCubit>(context);
  }

  signin({required String email, required String password}) async {
    try {
      emit(SigninLoading());
      Either<Unit, Failure> result = await _signusecase.signin(
        UsersigninEntity(email, password),
      );
      result.fold(
        (_) {
          emit(SigninSucces());
        },
        (falure) {
          emit(SigninFailure(falure.error!));
        },
      );
    } catch (e) {
      emit(SigninFailure(Failure.fromjson(e.toString()).error!));
    }
  }

  feildstate(visible) {
    if (visible == true) {
      emit(TextFeildState(false));
    } else {
      emit(TextFeildState(true));
    }
  }
}
