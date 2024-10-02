import 'package:taskapp/Packages/packages.dart';

class Snacks {
  static void mySnackBar(BuildContext context, String msg, bool flag) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: (flag) ? Colors.blue : Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Text(
        msg,
        style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    ));
  }
}
