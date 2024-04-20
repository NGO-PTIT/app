import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/views/page/authentication/login/login_page.dart';
import 'package:provider/provider.dart';

import '../../../ThemeProvider.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/assets.dart';
import '../../common/common_drawer.dart';
import '../../common/common_text.dart';

class ManageNotificationPage extends StatefulWidget {
  const ManageNotificationPage({super.key});

  @override
  State<ManageNotificationPage> createState() => _ManageNotificationPageState();
}

class _ManageNotificationPageState extends State<ManageNotificationPage> {
  final ValueNotifier<bool> _isSwitchedNotification = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isSwitchedWaning = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _isSwitchedModeNight = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isCheckBoxHot = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isCheckBoxMange = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.emeraldGreen,
        title: const CommonText(
          fontStyle: FontStyle.bold,
          'Setting',
          textColor: AppColors.white,
          variant: Variant.h6,
        ),
      ),
      drawer: const CommonDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              'Nhận thông báo ',
              style: TextStyle(
                fontSize: Provider.of<ThemeProvider>(context).fontSize + 5,
                color: Colors.black,
              ),
              variant: Variant.h6,
            ),
            AppConstants.kSpacingItem8,
            CheckBoxCustomWidget(
              isCheckBoxHot: _isCheckBoxHot,
              text: 'Nhận tin nóng',
            ),
            CheckBoxCustomWidget(
              isCheckBoxHot: _isCheckBoxMange,
              text: 'Nhận tin từ ban quản trị',
            ),
            CommonText(
              'Cỡ chữ nội dung bài viết',
              textColor: AppColors.black,
              style: TextStyle(
                fontSize: Provider.of<ThemeProvider>(context).fontSize + 3,
                color: Colors.black,
              ),
              variant: Variant.h6,
            ),
            Slider(
              min: 10.0,
              max: 24.0,
              value: Provider.of<ThemeProvider>(context, listen: false).fontSize,
              onChanged: (newSize) {
                Provider.of<ThemeProvider>(context, listen: false).setFontSize(newSize);
              },
            ),
            SwitchCustomWidget(
                isSwitched: _isSwitchedNotification,
                text: 'Nhận thông báo'
            ),
            SwitchCustomWidget(
                isSwitched: _isSwitchedWaning, text: 'Âm thanh cảnh báo'),
            SwitchCustomWidget(
                isSwitched: _isSwitchedModeNight, text: 'Chế độ đọc ban đêm'),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: CommonText(
                      'Đăng xuất',
                      style: TextStyle(
                        fontSize: Provider.of<ThemeProvider>(context).fontSize + 3,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold
                      ),
                      variant: Variant.h6,
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxCustomWidget extends StatelessWidget {
  const CheckBoxCustomWidget({
    super.key,
    required ValueNotifier<bool> isCheckBoxHot,
    required String text,
  })  : _isCheckBoxHot = isCheckBoxHot,
        _text = text;

  final ValueNotifier<bool> _isCheckBoxHot;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isCheckBoxHot,
      builder: (context, value, child) {
        return Row(
          children: [
            Checkbox(
              activeColor: AppColors.emeraldGreen,
              value: _isCheckBoxHot.value,
              onChanged: (value) {
                _isCheckBoxHot.value = !_isCheckBoxHot.value;
              },
            ),
            CommonText(
              _text,
              style: TextStyle(
                  fontSize: Provider.of<ThemeProvider>(context).fontSize,
              ),
              textColor: AppColors.black,
              variant: Variant.h6,
            ),
          ],
        );
      },
    );
  }
}

class SwitchCustomWidget extends StatelessWidget {
  const SwitchCustomWidget({
    super.key,
    required ValueNotifier<bool> isSwitched,
    required String text,
  })  : _isSwitched = isSwitched,
        _text = text;

  final ValueNotifier<bool> _isSwitched;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isSwitched,
      builder: (context, value, child) {
        return Row(
          children: [
            CommonText(
              _text,
              style: TextStyle(
                  fontSize: Provider.of<ThemeProvider>(context).fontSize + 5,
                  color: Colors.black,
              ),
              variant: Variant.h6,
            ),
            Spacer(),
            Switch(
              activeColor: AppColors.emeraldGreen,
              value: _isSwitched.value,
              onChanged: (value) {
                _isSwitched.value = value;
              },
            ),
          ],
        );
      },
    );
  }
}
