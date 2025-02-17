import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/auth/signup/domain/enititys/signup_entitys.dart';
import 'package:wheater_app/futures/auth/signup/domain/usecases/BaseUseCaseSignUp.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  Baseusecasesignup _signUpUseCase;
  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());

  factory SignUpCubit.plocprovider(context) {
    return BlocProvider.of<SignUpCubit>(context);
  }

  signup(SignUpEntity entity) async {
    emit(SignUpLoading());
    Either<Failure, Unit> result = await _signUpUseCase.usecasesignup(entity);
    result.fold(
      (left) {
        emit(SignUpFailur(left.error!));
      },
      (_) {
        emit(SignUpSuccess());
      },
    );
  }

  passwordstate(visible) {
    emit(SignUppasswordstate(visible == true ? false : true));
  }
}
