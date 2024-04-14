import 'package:flutter/material.dart';
import 'package:football_news_app/views/page/schedule/schedule_page.dart';

import '../../config/constants/app_colors.dart';
import '../page/main_page.dart';
import '../page/manage_notification/manage_notification_page.dart';
import '../page/news/news_page.dart';
import 'common_text.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.emeraldGreen,
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.sports_volleyball_outlined,
                    size: 100,
                    color: AppColors.white,
                  ),
                  CommonText(
                    'Football App',
                    textColor: AppColors.white,
                    variant: Variant.h6,
                    fontStyle: FontStyle.bold,
                  ),
                ],
              )),
          ListTile(
            title: const CommonText(
              'Nội dung',
              fontStyle: FontStyle.bold,
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const CommonText(
              'Giải đấu',
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const CommonText(
              'Lịch thi đấu và kết quả',
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedulePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const CommonText(
              'Đội',
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const CommonText(
              'Tiện ích',
              fontStyle: FontStyle.bold,
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const CommonText(
              'Tài khoản',
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const CommonText(
              'Cài đặt',
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageNotificationPage()));
            },
          ),
          ListTile(
            title: const CommonText(
              'Thông báo tuỳ chọn',
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const CommonText(
              'Điều khoản',
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const CommonText(
              'Góp ý',
              variant: Variant.h6,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
