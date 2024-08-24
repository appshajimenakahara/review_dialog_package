import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ReviewDialog {
  final String appReviewUrl;
  final String title;
  final String message;
  final String okButtonText;
  final String cancelButtonText;

  ReviewDialog({
    required this.appReviewUrl,
    required this.title,
    required this.message,
    required this.okButtonText,
    required this.cancelButtonText,
  });

  Future<void> showReviewDialog(BuildContext context) async {
    _displayReviewDialog(context);
  }

  void _displayReviewDialog(BuildContext context) {
    showDialog(
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
}
