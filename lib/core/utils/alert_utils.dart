import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AlertUtils {
  static void showErrorMessage(
    BuildContext context,
    String message,
  ) {
    showTopSnackBar(
      context,
      TopMessage(message: message, type: "error"),
      displayDuration: const Duration(seconds: 2),
    );
  }

  static void showSuccessMessage(
    BuildContext context,
    String message,
  ) {
    showTopSnackBar(
      context,
      TopMessage(message: message, type: "success"),
      displayDuration: const Duration(seconds: 3),
    );
  }

  static void showSomeErrorOccured(context) {
    showTopSnackBar(
      context,
      const TopMessage(message: "error_occured", type: "error"),
      displayDuration: const Duration(seconds: 2),
    );
  }

  static void showNoInternetConnectionError(context) {
    showTopSnackBar(
      context,
      const TopMessage(message: "no_internet_connection_error", type: "error"),
      displayDuration: const Duration(seconds: 2),
    );
  }
}

class TopMessage extends StatefulWidget {
  final String message;
  final String type;
  const TopMessage({
    Key? key,
    required this.message,
    required this.type,
  }) : super(key: key);

  @override
  State<TopMessage> createState() => _TopMessageState();
}

class _TopMessageState extends State<TopMessage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
              ),
              child: Center(
                  child: (widget.type == "error")
                      ? const Icon(Icons.error)
                      : const Icon(Icons.done)),
            ),
            18.horizontalSpace,
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: widget.message,
                        style: const TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
