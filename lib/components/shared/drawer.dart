import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/constants.dart' as constant;
import 'package:to_do_app/providers/active_tab_provider.dart';
import 'package:to_do_app/providers/background_provider.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);
  final bg = constant.wallpaper;

  @override
  Widget build(BuildContext context) {
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
                child: const Text('Pending tasks',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  context.read<ActiveTabProvider>().setActiveTab(1);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Completed tasks',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Change app background',
                style: TextStyle(fontSize: 16),
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
                          child: Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 8, top: 8),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(bg[index]),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center),
                                borderRadius: BorderRadius.circular(24)),
                          ));
                    }),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Set active language',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        height: 24,
                        width: 24,
                        margin: const EdgeInsets.only(right: 8, top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.transparent,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                        child: const Text(
                          'en',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      )),
                  const SizedBox(width: 16),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        height: 24,
                        width: 24,
                        margin: const EdgeInsets.only(right: 8, top: 8),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.black45,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                        child: const Text(
                          'vi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              )
            ])));
  }
}
