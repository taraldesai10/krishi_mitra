import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  void displayToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 20,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
