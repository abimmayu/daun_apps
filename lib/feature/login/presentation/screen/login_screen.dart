import 'package:daun_apps/core/routing/router.dart';
import 'package:daun_apps/core/utils/colors.dart';
import 'package:daun_apps/core/utils/font.dart';
import 'package:daun_apps/feature/login/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/img/apple-logo.svg',
              width: 100.w,
              height: 100.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
              child: TextFieldWidgets(
                controller: usernameController,
                hintText: 'Username',
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
              child: TextFieldWidgets(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.darkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                ),
                onPressed: () {
                  context.pushReplacementNamed(AppRoute.dashboardScreen.name);
                },
                child: Text(
                  'Login',
                  style: AppTextStyle.normalText.copyWith(
                    color: AppColor.backgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
