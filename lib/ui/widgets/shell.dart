import 'package:asdish/config/go_routes.dart';
import 'package:asdish/providers/go_routes.dart';
import 'package:asdish/ui/widgets/cart_counter.dart';
import 'package:asdish/ui/widgets/notifications_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class Shell extends StatelessWidget {
  final Widget body;
  const Shell({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shellScreens[context.watch<GoRoutesProvider>().current].widget,
      
      bottomNavigationBar: NavigationBar(
        selectedIndex: context.watch<GoRoutesProvider>().current,
        onDestinationSelected: (index) {
          context.read<GoRoutesProvider>().setCurrent = index;
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: CartIconCount(),
            label: "Cart",
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: "Orders",
          ),
          NavigationDestination(
            icon: NotificationIconCount(),
            label: "Notifications",
          ),
        ],
      ),
    );
  }
}
