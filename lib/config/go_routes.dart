import 'package:asdish/ui/screens/auth/email_otp.dart';
import 'package:asdish/ui/screens/auth/password/code_password_reset.dart';
import 'package:asdish/ui/screens/auth/password/identifier_password_reset.dart';
import 'package:asdish/ui/screens/auth/phone_otp.dart';
import 'package:asdish/ui/screens/auth/signin.dart';
import 'package:asdish/ui/screens/auth/signup.dart';
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
    GoRoute(
      path: "/product",
      builder: (context, state) {
        // Product? product = state.extra as Product?;
        return const ProductScreen();
      },
    ),
    GoRoute(
      path: "/auth",
      builder: (_, __) => const Scaffold(),
      routes: [
        GoRoute(
          path: "signin",
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: "signup",
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: "challenges",
          builder: (_, __) => const Scaffold(),
          routes: [
            GoRoute(
              path: "phone",
              builder: (context, state) {
                String verificationId =
                    (state.extra! as Map<String, dynamic>)["verificationId"];
                int? resendToken =
                    (state.extra! as Map<String, dynamic>)["resendToken"];
                return OTPScreen(
                  verificationId: verificationId,
                  resendToken: resendToken,
                );
              },
            ),
            GoRoute(
              path: "email",
              builder: (context, state) => const EmailCodeScreen(),
            ),
          ],
        ),
        GoRoute(
            path: "password",
            builder: (_, __) => const Scaffold(),
            routes: [
              GoRoute(
                path: "reset-request",
                builder: (context, state) => const IdentifierPasswordReset(),
              ),
              GoRoute(
                path: "code-reset",
                builder: (context, state) {
                  bool phoneOTP = state.extra as bool;
                  return CodePasswordReset(phoneOTP: phoneOTP);
                },
              ),
            ])
      ],
    ),
    ShellRoute(
      builder: (context, state, child) => Shell(body: child),
      routes: generateRoutes(shellScreens),
    ),
  ],
);
