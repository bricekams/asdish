import 'package:asdish/providers/auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    AppAuthProvider apW = context.watch<AppAuthProvider>();

    return AppBar(
      // title: const Text("Home"),
      leading: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/logo_1.png"))),
      ),
      // centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: context.watch<AppAuthProvider>().isSignedIn == true
              ? IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    foregroundImage: const CachedNetworkImageProvider(
                        "https://avatars.githubusercontent.com/u/120424696?v=4"),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    context.push("/auth/signin");
                  },
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
