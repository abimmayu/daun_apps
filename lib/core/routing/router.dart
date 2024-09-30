import 'package:daun_apps/feature/adjustment/presentation/screen/adjustment_screen.dart';
import 'package:daun_apps/feature/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:daun_apps/feature/login/presentation/screen/login_screen.dart';
import 'package:daun_apps/feature/stock/presentation/screen/adjustment_stock_screen.dart';
import 'package:daun_apps/feature/stock/presentation/screen/detail_stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  loginScreen,
  dashboardScreen,
  detailStockScreen,
  editStockScreen,
  adjustmentStockScreen,
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.loginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      name: AppRoute.dashboardScreen.name,
      builder: (context, state) => const DashboardScreen(),
      routes: [
        GoRoute(
          path: 'stock',
          name: AppRoute.detailStockScreen.name,
          builder: (context, state) => const DetailStockScreen(),
          routes: [
            GoRoute(
              path: 'edit',
              name: AppRoute.editStockScreen.name,
              builder: (context, state) => const AdjustmentStockScreen(),
            ),
          ],
        )
      ],
    ),
    GoRoute(
      path: '/adjustment',
      name: AppRoute.adjustmentStockScreen.name,
      builder: (context, state) => const AdjustmentScreen(),
    ),
  ],
);
