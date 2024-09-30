import 'dart:developer';

import 'package:daun_apps/core/routing/router.dart';
import 'package:daun_apps/core/utils/colors.dart';
import 'package:daun_apps/core/utils/font.dart';
import 'package:daun_apps/feature/dashboard/presentation/widgets/card_widget.dart';
import 'package:daun_apps/feature/login/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdjustmentScreen extends StatefulWidget {
  const AdjustmentScreen({super.key});

  @override
  State<AdjustmentScreen> createState() => _AdjustmentScreenState();
}

class _AdjustmentScreenState extends State<AdjustmentScreen> {
  final String userName = 'Abim';

  final TextEditingController _searchController = TextEditingController();

  String date = "Expired";
  String? initialDate = DateTime.now().toString();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          initialDate == null ? DateTime.now() : DateTime.parse(initialDate!),
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(
        () {
          initialDate = picked.toString();
          date = "${picked.day}/${picked.month}/${picked.year}";
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adjustment',
          style: AppTextStyle.bigTextSemibold,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Logout',
              style: AppTextStyle.normalText,
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
          const CardsWidget(
            title: 'Gudang 1',
            subtitle: 'Makanan, Minuman, Stationary, Medicine',
            image: Icon(Icons.warehouse),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150.w,
                child: TextFieldWidgets(
                  controller: _searchController,
                  hintText: 'Product',
                  onChanged: (value) {},
                ),
              ),
              SizedBox(width: 20.w),
              Container(
                width: 150.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.h),
                  border: Border.all(color: AppColor.borderColor),
                ),
                child: TextButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: AppTextStyle.normalText,
                      ),
                      const Icon(Icons.arrow_drop_down_outlined),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 1,
                ),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(AppRoute.detailStockScreen.name);
                      },
                      child: const CardsWidget(
                        title: 'Makanan',
                        subtitle: '17/08/45',
                        image: Icon(Icons.food_bank),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
