import 'package:get_it/get_it.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/core/network/firebase/firebase_firestore.dart';
import 'package:wheater_app/core/network/firebase/firebase_sign.dart';
import 'package:wheater_app/futures/auth/signin/data/repos_imp/signinemail_andpassword.dart';
import 'package:wheater_app/futures/auth/signin/domain/usecases/signin_usecase.dart';
import 'package:wheater_app/futures/auth/signin/presintation/controller/cubit/signin_cubit.dart';
import 'package:wheater_app/futures/auth/signup/data/remote_data/add_userdata_remote.dart';
import 'package:wheater_app/futures/auth/signup/data/remote_data/remote_signup.dart';
import 'package:wheater_app/futures/auth/signup/data/repo_imp/add_user_imp.dart';
import 'package:wheater_app/futures/auth/signup/data/repo_imp/signup_repo.dart';
import 'package:wheater_app/futures/auth/signup/domain/usecases/signup_usecase.dart';
import 'package:wheater_app/futures/auth/signup/presination/controller/cubit/sign_up_cubit.dart';

final sl = GetIt.instance;
setupLocator() {
  sl.registerLazySingleton<Cashhelper>(() => Cashhelper());

  sl.registerLazySingleton<FireBaseFireStoreNetowrk>(
    () => FireBaseFireStoreNetowrk(),
  );

  sl.registerLazySingleton<FirebaseSign>(() => FirebaseSign());

  sl.registerFactory<SigninCubit>(
    () => SigninCubit(SigninUsecase(SigninemailAndpasswordReboImp())),
  );
  sl.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      SignUpAddUserUseCase(
        SignUpReboEmailAndPassword(RemoteSignupemailandPassword()),
        AddUserInfo(AddUserdataRemote()),
      ),
    ),
  );
}
