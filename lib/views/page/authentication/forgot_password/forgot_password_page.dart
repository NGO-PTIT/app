import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/views/common/common_text.dart';

import '../../../../config/constants/app_colors.dart';
import '../login/login_page.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _rePasswordController = TextEditingController();
  late final TextEditingController _accountController = TextEditingController();
  late final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  String url = "http://10.0.2.2:8080/api/update";

  Future<void> _forgot_pass() async {
    if(_rePasswordController.text.compareTo(_passwordController.text) != 0){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Lỗi'),
          content: const Text('Xác nhận lại mật khẩu'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    else{
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': _accountController.text,
          'password': _passwordController.text,
        }),
      );
      if (response.body.contains('ok')) {
        Navigator.of(context).pop();
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Lỗi'),
            content: const Text('Tài khoản không đúng'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppConstants.kSpacingItem120,
              const CommonText(
                'Quên mật khẩu',
                textColor: AppColors.black,
                variant: Variant.h6,
                fontStyle: FontStyle.bold,
              ),
              AppConstants.kSpacingItem16,
              TextFormField(
                controller: _accountController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'Nhập tài khoản',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AppConstants.kSpacingItem16,
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Nhập mật khẩu mới',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AppConstants.kSpacingItem16,
              TextFormField(
                obscureText: true,
                controller: _rePasswordController,
                decoration: InputDecoration(
                  labelText: 'Nhập lại mật khẩu mới',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AppConstants.kSpacingItem16,
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _forgot_pass();
                  },
                  child: const Text('Đặt lại mật khẩu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
