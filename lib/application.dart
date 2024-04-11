import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_news_app/views/page/authentication/login/login_page.dart';
import 'package:football_news_app/views/page/detail_new/detail_new_page.dart';
import 'views/page/main_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          routes: {
            '/news_detail': (
              context,
            ) {
              final args = ModalRoute.of(context)!.settings.arguments as Map;
              return DetailNewPage(
                image: args['image'],
                title: args['title'],
                content: args['content'],
              );
            },
          },
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
        );
      },
    );
  }
}
