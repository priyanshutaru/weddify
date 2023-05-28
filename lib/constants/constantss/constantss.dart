import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


//********************------------- this function show the toast masssage in the screen  -------------********************//

void toastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}


//********************------------- this the loader dailagu which is show in each and every where in app when we upload or delete the data of login as the user.  -------------********************//

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: Color(0xffe16555),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Container(
                margin: const EdgeInsets.only(left: 7),
                child: const Text("Loading...")),
          ],
        ),
      );
    }),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//********************------------- These are the error massages  -------------********************//

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used. Go to login page.";
    case "account-exists-with-different-credential":
      return "Email already used. Go to login page.";
    case "email-already-in-use":
      return "Email already used. Go to login page.";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong Password ";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email.";
    case "user-not-found":
      return "No user found with this email.";
    case "ERROR_USER_DISABLED":
      return "User disabled.";
    case "user-disabled":
      return "User disabled.";
    case "ERROR_TOO_MANY_REQUESTS":
      return "Too many requests to log into this account.";
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Too many requests to log into this account.";
    case "ERROR_INVALID_EMAIL":
      return "Email address is invalid.";
    case "invalid-email":
      return "Email address is invalid.";
    default:
      return "Login failed. Please try again.";
  }
}


//********************------------- This is the login validation   -------------********************//

bool loginVaildation(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    toastMessage("Both Fields are empty");
    return false;
  } else if (email.isEmpty) {
    toastMessage("Email is Empty");
    return false;
  } else if (password.isEmpty) {
    toastMessage("Password is Empty");
    return false;
  } else {
    return true;
  }
}


//********************------------- This is the signupvlaidation in flutter  -------------********************//

bool signUpVaildation(
    String email, String password, String name, String phone) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    toastMessage("All Fields are empty");
    return false;
  } else if (name.isEmpty) {
    toastMessage("Name is Empty");
    return false;
  } else if (email.isEmpty) {
    toastMessage("Email is Empty");
    return false;
  } else if (phone.isEmpty) {
    toastMessage("Phone is Empty");
    return false;
  } else if (password.isEmpty) {
    toastMessage("Password is Empty");
    return false;
  } else {
    return true;
  }
}
