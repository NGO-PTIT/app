import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_constants.dart';
import 'package:football_news_app/models/user_model.dart';
import 'package:football_news_app/views/page/authentication/forgot_password/forgot_password_page.dart';
import 'package:football_news_app/views/page/authentication/signup/sign_up.dart';
import 'package:football_news_app/views/page/main_page.dart';
import 'package:http/http.dart' as http;

import '../../../../config/constants/app_colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _accountController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  late FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }
  String url = "http://10.0.2.2:8080/api/login";

  Future<void> _login() async {
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Lỗi đăng nhập'),
          content: const Text('Tài khoản hoặc mật khẩu không đúng.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppConstants.kSpacingItem120,
              const Icon(
                Icons.sports_volleyball_outlined,
                color: AppColors.emeraldGreen,
                size: 100,
              ),
              AppConstants.kSpacingItem16,
              TextFormField(
                controller: _accountController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'Tài khoản',
                  hintText: 'Nhập tài khoản',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AppConstants.kSpacingItem16,
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  hintText: 'Nhập mật khẩu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage()));
                    },
                    child: const Text('Quên mật khẩu?'),
                  ),
                ],
              ),
              AppConstants.kSpacingItem8,
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                    _login();
                  },
                  child: const Text('Đăng nhập'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bạn chưa có tài khoản?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: const Text("Đăng kí"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
