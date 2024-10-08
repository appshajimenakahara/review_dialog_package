import 'package:flutter/material.dart';
import 'package:review_dialog_package/app_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> showReviewDialog({
  required BuildContext context,
  required String appReviewUrl,
  required String title,
  required String message,
  required String okButtonText,
  required String cancelButtonText,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        content: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
              const SizedBox(height: 30),
              AppButton(height: 50, width: 200, color: Colors.white, fontColor: Colors.black87, borderColor: Colors.black54, title: okButtonText, onPressed: () {
                Navigator.of(context).pop();
                _launchReviewPage(appReviewUrl);
              }),
              const SizedBox(height: 2),
              AppButton(height: 50, width: 200, color: Colors.white, fontColor: Colors.black87, borderColor: Colors.black54, title: cancelButtonText, onPressed: () {
                Navigator.of(context).pop();
              }),
              const SizedBox(height: 2),
            ],
          ),
        ),
        actions: [],
      );
    },
  );
}

Future<void> _launchReviewPage(String appReviewUrl) async {
  if (await canLaunchUrlString(appReviewUrl)) {
    await launchUrlString(appReviewUrl);
  } else {
    print('Could not launch $appReviewUrl');
  }
}
