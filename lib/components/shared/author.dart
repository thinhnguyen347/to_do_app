import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/app_version.dart';
import 'package:to_do_app/providers/language_provider.dart';

void showAuthorDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      final lang = context.watch<LanguageProvider>().currentLanguage;

      return CupertinoAlertDialog(
        title: Text(lang == "en" ? "About app" : "Thông tin ứng dụng"),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text("Developer: Thinh Nguyen"),
            const Text("Email: nd.thinh91@gmail.com"),
            // Text("Phone/ Zalo: 0984018891"),
            const Text("***"),
            Text(
              "${lang == "en" ? 'Version' : 'Phiên bản'}: $version",
              textAlign: TextAlign.left,
            ),
            Text(
              "${lang == "en" ? 'Icon sources' : 'Nguồn icon'}: lottiefiles.com, freepik.com",
              textAlign: TextAlign.left,
            ),
            Text(
              "${lang == "en" ? 'Photo sources' : 'Nguồn ảnh'}: unsplash.com, wallpapers.com, pexel.com",
              textAlign: TextAlign.left,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(lang == "en" ? 'Close' : 'Đóng'),
          ),
        ],
      );
    });
