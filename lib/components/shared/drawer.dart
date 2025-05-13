import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:to_do_app/data/constants.dart' as constant;
import 'package:to_do_app/providers/active_tab_provider.dart';
import 'package:to_do_app/providers/background_provider.dart';
import 'package:to_do_app/providers/language_provider.dart';
import 'package:to_do_app/utilities/app_shared_preferences.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});
  final bg = constant.wallpaper;

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<LanguageProvider>().currentLanguage;

    return Drawer(
        child: Container(
            padding:
                const EdgeInsets.only(top: 64, left: 24, right: 24, bottom: 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFd3e7ee), Color(0xFFABD1DE)],
                tileMode: TileMode.clamp,
                begin: Alignment(0.3, -1),
                end: Alignment(-0.8, 1),
              ),
              backgroundBlendMode: BlendMode.darken,
            ),
            child: Column(children: <Widget>[
              TextButton(
                onPressed: () {
                  context.read<ActiveTabProvider>().setActiveTab(0);
                  Navigator.pop(context);
                },
                child: Text(
                    lang == 'en' ? 'Pending tasks' : 'Công việc chờ xử lý',
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  context.read<ActiveTabProvider>().setActiveTab(1);
                  Navigator.pop(context);
                },
                child: Text(
                  lang == 'en' ? 'Completed tasks' : 'Công việc đã hoàn thành',
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                lang == 'en' ? 'Change app background' : 'Thay đổi hình nền',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bg.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            context
                                .read<BackgroundProvider>()
                                .changeBackground(index);
                          },
                          child: Stack(children: [
                            Container(
                              height: 48,
                              width: 48,
                              margin: const EdgeInsets.only(right: 8, top: 8),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(bg[index]),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center),
                                  borderRadius: BorderRadius.circular(24)),
                            ),
                            Positioned(
                              height: 20,
                              width: 20,
                              left: 14,
                              bottom: 14,
                              child: Center(
                                child: index ==
                                        context
                                            .watch<BackgroundProvider>()
                                            .currentBackgroundIndex
                                    ? Image.asset(
                                        'assets/images/checkmark1.png',
                                        width: 20,
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            )
                          ]));
                    }),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                lang == 'en' ? 'Change app language' : 'Thay đổi ngôn ngữ',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              SlidingSwitch(
                value: lang == 'vi',
                width: 110,
                height: 40,
                onChanged: (bool value) {
                  if (!value) {
                    context.read<LanguageProvider>().setCurrentLanguage('en');
                  } else {
                    context.read<LanguageProvider>().setCurrentLanguage('vi');
                  }

                  AppSharedPreferences.setLanguage(value ? 'vi' : 'en');
                },
                onSwipe: (bool value) {
                  if (!value) {
                    context.read<LanguageProvider>().setCurrentLanguage('en');
                  } else {
                    context.read<LanguageProvider>().setCurrentLanguage('vi');
                  }

                  AppSharedPreferences.setLanguage(value ? 'vi' : 'en');
                },
                onTap: (bool value) {
                  if (!value) {
                    context.read<LanguageProvider>().setCurrentLanguage('en');
                  } else {
                    context.read<LanguageProvider>().setCurrentLanguage('vi');
                  }

                  AppSharedPreferences.setLanguage(value ? 'vi' : 'en');
                },
                onDoubleTap: () {},
                textOff: "EN",
                textOn: "VI",
                animationDuration: const Duration(milliseconds: 300),
              )
            ])));
  }
}
