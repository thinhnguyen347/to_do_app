import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/language_provider.dart';

void showInfoDialog(BuildContext context, String message, bool isAlert) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final lang = context.watch<LanguageProvider>().currentLanguage;

          return CupertinoAlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/attention.png", width: 54),
                const SizedBox(height: 20),
                Text(message,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  lang == "en" ? 'Close' : 'Đóng',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        });
