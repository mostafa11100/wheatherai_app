import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wheater_app/core/error/falure.dart';
import 'package:wheater_app/futures/auth/signin/data/model/user_responsemodel.dart';
import 'package:wheater_app/futures/auth/signin/data/remotedata_source/remote_signin.dart';
import 'package:wheater_app/futures/auth/signin/data/repos_imp/signinemail_andpassword.dart';
import 'package:wheater_app/futures/auth/signin/domain/entity/usersignin_entity.dart';

import 'repo_test.mocks.dart';

class Mockboremotesigninemail extends Mock implements RemoteSignin {}

// @GenerateMocks([RemoteSignin])
// import 'package:mockito/annotations.dart';
void main() {
  late Mockboremotesigninemail mockoremotesigninemail;
  late SigninemailAndpasswordReboImp reposignignin;
  late UsersigninEntity usersigninEntity;
  late UserResponsemodel userResponsemodel;
  setUp(() {
    usersigninEntity = UsersigninEntity("", "");
    userResponsemodel = UserResponsemodel(
      uid: '111',
      isNewUser: true,
      displayName: "mostafa",
      photoUrl: "111",
      email: "mostafa@gmail.com",
    );
    mockoremotesigninemail = Mockboremotesigninemail();
    reposignignin = SigninemailAndpasswordReboImp(mockoremotesigninemail);
  });
  test("Repo_sign in testing", () async {
    when(
      mockoremotesigninemail.remotesign(any),
    ).thenAnswer((_) async => userResponsemodel);

    Either<Unit, Failure> result = await reposignignin.signin(usersigninEntity);

    expect(result.isLeft(), true);
  });
}
