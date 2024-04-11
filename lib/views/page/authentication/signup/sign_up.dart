import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_constants.dart';

import '../../../../config/constants/app_colors.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _accountController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _rePasswordController = TextEditingController();
  late final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AppConstants.kSpacingItem16,
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AppConstants.kSpacingItem8,
              TextFormField(
                controller: _rePasswordController,
                decoration: InputDecoration(
                  labelText: 'Nhập lại mật khẩu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AppConstants.kSpacingItem24,
              AppConstants.kSpacingItem8,
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(_focusNode);
                    Navigator.pop(context);
                  },
                  child: const Text('Đăng kí'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
