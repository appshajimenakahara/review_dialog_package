import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> showReviewDialog({
  required BuildContext context,
  required String appReviewUrl,
  String title = 'アプリを楽しんでいますか？',
  String message = 'もしよろしければ、アプリストアでレビューをお願いします。',
  String okButtonText = 'レビューする',
  String cancelButtonText = '今はしない',
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(cancelButtonText),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(okButtonText),
            onPressed: () {
              Navigator.of(context).pop();
              _launchReviewPage(appReviewUrl);
            },
          ),
        ],
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
