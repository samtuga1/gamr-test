import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/utils/utils.dart';
import 'package:get/get.dart';

class UiUtils {
  UiUtils._();

  static Future<void> customDialog(
    BuildContext context,
    String? message, {
    String title = 'Alert',
    String noButtonText = "Cancel",
    String yesButtonText = "Yes",
    bool showOnlyYesButton = false,
    VoidCallback? onTap,
  }) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Center(
                child: Text(
                  title,
                ),
              ),
              content: Text(
                message!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              actions: <Widget>[
                if (!showOnlyYesButton)
                  TextButton(
                    child: Text(
                      noButtonText,
                    ),
                    onPressed: () {
                      // for handling will pop scope
                      Navigator.of(context).pop();
                    },
                  ),
                TextButton(
                  child: Text(
                    yesButtonText,
                  ),
                  onPressed: () {
                    // for handling will pop scope
                    Navigator.of(context).pop();
                    onTap?.call();
                  },
                ),
              ],
            ));
  }

  static void flush({
    String? title,
    String? msg,
    required FlushState errorState,
  }) {
    Flushbar(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        borderRadius: BorderRadius.circular(8),
        barBlur: 50.0,
        icon: errorState == FlushState.error
            ? const Icon(
                Icons.cancel,
                color: Colors.white,
              )
            : errorState == FlushState.warning
                ? const Icon(
                    Icons.warning,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
        duration: const Duration(milliseconds: 4000),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundGradient: LinearGradient(
          colors: errorState == FlushState.error
              ? [Colors.red.shade600, Colors.redAccent.shade400]
              : errorState == FlushState.warning
                  ? [Colors.amber.shade600, Colors.amber.shade400]
                  : [Colors.green.shade600, Colors.greenAccent.shade400],
          stops: const [0.6, 1],
        ),
        boxShadows: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(3, 3),
            blurRadius: 3,
          ),
        ],
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
        titleText: Text(
          title ?? 'Alert',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        messageText: Text(
          msg ?? 'Alert message',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        )).show(Get.context!);
  }

  static void showStandardErrorFlushBar({String? title, String? message}) {
    flush(
      msg: message ?? 'Something unexpected happened. Please try again',
      title: title ?? 'That\'s weird',
      errorState: FlushState.error,
    );
  }
}
