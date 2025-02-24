import 'package:get_it/get_it.dart';
import 'package:wheater_app/core/component/notfications/weather_state_ntfc.dart';
import 'package:wheater_app/core/helper/app_lifecycle.dart';
import 'package:wheater_app/core/helper/cashhelper.dart';
import 'package:wheater_app/core/network/apis/ai_modelnetwork.dart';
import 'package:wheater_app/core/network/firebase/firebase_firestore.dart';
import 'package:wheater_app/core/network/firebase/firebase_sign.dart';
import 'package:wheater_app/core/services/work_manager.dart';
import 'package:wheater_app/futures/auth/signin/data/remotedata_source/remote_signin.dart';
import 'package:wheater_app/futures/auth/signin/data/repos_imp/signinemail_andpassword.dart';
import 'package:wheater_app/futures/auth/signin/domain/usecases/signin_usecase.dart';
import 'package:wheater_app/futures/auth/signin/presintation/controller/cubit/signin_cubit.dart';
import 'package:wheater_app/futures/auth/signup/data/remote_data/add_userdata_remote.dart';
import 'package:wheater_app/futures/auth/signup/data/remote_data/remote_signup.dart';
import 'package:wheater_app/futures/auth/signup/data/repo_imp/add_user_imp.dart';
import 'package:wheater_app/futures/auth/signup/data/repo_imp/signup_repo.dart';
import 'package:wheater_app/futures/auth/signup/domain/usecases/signup_usecase.dart';
import 'package:wheater_app/futures/auth/signup/presination/controller/cubit/sign_up_cubit.dart';
import 'package:wheater_app/futures/home/app_home/data/remote_data/ai_remote_models.dart';
import 'package:wheater_app/futures/home/app_home/data/remote_data/api_wheather_remot.dart';
import 'package:wheater_app/futures/home/app_home/data/repo_imp/aimodel_repo.dart';
import 'package:wheater_app/futures/home/app_home/data/repo_imp/getresponse_repo.dart';
import 'package:wheater_app/futures/home/app_home/domain/usecases/getweather_usecase.dart';
import 'package:wheater_app/futures/home/app_home/presintaion/controller/cubit/get_weather_cubit.dart';

final sl = GetIt.instance;
setupLocator() {
  sl.registerLazySingleton<Cashhelper>(() => Cashhelper());

  sl.registerLazySingleton<AppLifecycleObserver>(() => AppLifecycleObserver());

  sl.registerLazySingleton<WorkManagerApp>(() => WorkManagerApp());

  sl.registerLazySingleton<FireBaseFireStoreNetowrk>(
    () => FireBaseFireStoreNetowrk(),
  );
  //  sl.registerLazySingleton(() => WorkManagerApp());

  sl.registerLazySingleton(
    () => UseCaseGetWeather(
      GetWeatherRepoimp(RemoteWheather()),
      GemniAiRepo(GemniAiModelRemote(GemniApi())),
    ),
  );
  sl.registerLazySingleton(() => LocalNotfications());

  sl.registerLazySingleton<FirebaseSign>(() => FirebaseSign());

  sl.registerFactory<SigninCubit>(
    () => SigninCubit(
      SigninUsecase(SigninemailAndpasswordReboImp(SigninEmailAndpassword())),
    ),
  );
  sl.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      SignUpAddUserUseCase(
        SignUpReboEmailAndPassword(RemoteSignupemailandPassword()),
        AddUserInfo(AddUserdataRemote()),
      ),
    ),
  );
  sl.registerFactory(
    () => GetWeatherCubit(
      UseCaseGetWeather(
        GetWeatherRepoimp(RemoteWheather()),
        GemniAiRepo(GemniAiModelRemote(GemniApi())),
      ),
    ),
  );
}
