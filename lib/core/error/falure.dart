class Failure {
  String? error;
  Failure.fromjson(er) {
    switch (er) {
      case 'weak-password':
        error = "The password provided is too weak";
        break;

      case 'email-already-in-use':
        error = "The account already exists for that email";

      case ' user-not-found':
        error = "No user found for that email";
        break;

      case 'wrong-password':
        error = "Wrong password provided for that user";
        break;
      case 'server error':
        error =
            "⚠️ A server error occurred. The service is currently unavailable. Please try again later";
        break;

      case 'invalid-credential':
        error =
            "The email you entered is incorrect. Please check and try again ";
        break;

      default:
        error = "Oops  $er";
        break;
    }
  }
}
