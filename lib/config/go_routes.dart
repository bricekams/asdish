import 'package:asdish/data/models/product.dart';
import 'package:asdish/ui/screens/cart.dart';
import 'package:asdish/ui/screens/home.dart';
import 'package:asdish/ui/screens/notifications.dart';
import 'package:asdish/ui/screens/orders.dart';
import 'package:asdish/ui/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:asdish/ui/widgets/shell.dart';

class ShellScreen {
  final String path;
  final int index;
  final Widget widget;

  ShellScreen({required this.path, required this.index, required this.widget});
}

final List<ShellScreen> shellScreens = [
  ShellScreen(path: "/", index: 0, widget: const HomeScreen()),
  ShellScreen(path: "/cart", index: 1, widget: const CartScreen()),
  ShellScreen(path: "/orders", index: 3, widget: const OrdersScreen()),
  ShellScreen(
      path: "/notifications", index: 2, widget: const NotificationsScreen()),
];

List<GoRoute> generateRoutes(List<ShellScreen> shellScreens) {
  return shellScreens.map((shellScreen) {
    return GoRoute(
      path: shellScreen.path,
      builder: (context, state) => shellScreen.widget,
    );
  }).toList();
}

final GoRouter appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => Shell(body: child),
      routes: generateRoutes(shellScreens),
    ),
    GoRoute(
     path: "/product",
      builder: (context,state) {
       // Product? product = state.extra as Product?;
       return const ProductScreen();
      }
    )
  ],
);
