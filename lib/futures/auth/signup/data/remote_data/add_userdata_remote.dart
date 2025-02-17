import 'package:wheater_app/core/di/service_locator.dart';
import 'package:wheater_app/core/network/firebase/firebase_firestore.dart';
import 'package:wheater_app/core/utilis/firebase_firestore_constant.dart';
import 'package:wheater_app/futures/auth/signup/data/model/UserSignUp_Model.dart';

abstract class BaseAddUserDateRemote {
  adduserinfo(UsersignupModel usermodel);
}

class AddUserdataRemote extends BaseAddUserDateRemote {
  @override
  adduserinfo(UsersignupModel usermodel) async {
    await sl<FireBaseFireStoreNetowrk>().setdata(
      collection: FireStoreStrings.user,
      data: usermodel.tojson(),
      docs: usermodel.uid,
    );
  }
}
