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

  Failure.handleHttpError(int? statusCode) {
    switch (statusCode) {
      case 400:
        error = "Bad request, please check the sent data.";
        break;
      case 401:
        error = "Unauthorized access, please check your credentials.";
        break;
      case 402:
        error = "Payment required to access this service.";
        break;
      case 403:
        error = "Forbidden access, you don’t have permission.";
        break;
      case 404:
        error = "Requested resource not found, please check the URL.";
        break;
      case 405:
        error = "Method not allowed for this request.";
        break;
      case 406:
        error = "Not acceptable, unsupported requested content.";
        break;
      case 407:
        error = "Proxy authentication required.";
        break;
      case 408:
        error = "Request timeout, please try again.";
        break;
      case 409:
        error = "Conflict in request, please check the data.";
        break;
      case 410:
        error = "The requested resource is no longer available.";
        break;
      case 411:
        error = "Content length must be specified.";
        break;
      case 412:
        error = "Precondition failed.";
        break;
      case 413:
        error = "Payload too large.";
        break;
      case 414:
        error = "URI too long.";
        break;
      case 415:
        error = "Unsupported media type.";
        break;
      case 416:
        error = "Range not satisfiable.";
        break;
      case 417:
        error = "Expectation failed.";
        break;
      case 500:
        error = "Internal server error, please try again later.";
        break;
      case 501:
        error = "Not implemented, the request is not supported.";
        break;
      case 502:
        error = "Bad gateway, received an invalid response from the server.";
        break;
      case 503:
        error = "Service unavailable, please try again later.";
        break;
      case 504:
        error = "Gateway timeout, no response from the server.";
        break;
      case 505:
        error = "HTTP version not supported.";
        break;
    }
  }

  Failure.netwrkerror() {
    error = "Netwrk connection feild";
  }
}
