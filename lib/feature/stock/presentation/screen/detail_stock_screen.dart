import 'package:daun_apps/core/routing/router.dart';
import 'package:daun_apps/core/utils/colors.dart';
import 'package:daun_apps/core/utils/font.dart';
import 'package:daun_apps/feature/dashboard/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DetailStockScreen extends StatefulWidget {
  const DetailStockScreen({super.key});

  @override
  State<DetailStockScreen> createState() => _DetailStockScreenState();
}

class _DetailStockScreenState extends State<DetailStockScreen> {
  String userName = 'Abim';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail',
          style: AppTextStyle.bigTextSemibold,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Logout',
              style: AppTextStyle.normalText.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Image.asset(
                  'assets/img/profile_picture.png',
                  width: 50.w,
                  height: 50.h,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, $userName',
                    style: AppTextStyle.normalText,
                  ),
                  Text('Admin Warehouse', style: AppTextStyle.tinyText),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CardsWidget(
            title: 'Makanan',
            subtitle: 'Category: Food',
            image: SizedBox(
              height: 50.h,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 110.w,
              vertical: 10.h,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.primaryColor,
                ),
                color: AppColor.darkColor,
              ),
              height: 150.h,
              child: Icon(
                Icons.food_bank,
                size: 150.h,
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: const Text("ID Gudang"),
              ),
              const Text(': '),
              const Text("G-001"),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: const Text("Kategori"),
              ),
              const Text(': '),
              const Text("Food"),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: const Text("Exp Date"),
              ),
              const Text(': '),
              const Text("30/09/2024"),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: const Text("Quantity"),
              ),
              const Text(': '),
              const Text("3"),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 150.w,
                child: const Text("Safety Stock"),
              ),
              const Text(': '),
              const Text("6"),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.darkColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.h),
                ),
              ),
              onPressed: () {
                context.pushNamed(AppRoute.editStockScreen.name);
              },
              child: Text(
                'Adjustment Stock',
                style: AppTextStyle.normalText.copyWith(
                  color: AppColor.backgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
