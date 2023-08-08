import 'package:flutter/material.dart';
import 'package:nymble_app/src/themes/themes_services.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String label;
  const CustomAppBar({super.key, this.bottom, this.label = 'Sample'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        label,
      ),
      actions: [
        InkWell(
            onTap: () {
           ThemeServices().changeThemeMode();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.switch_right_sharp,
                color: Colors.black,
              ),
            ))
      ],
      elevation: 0,
      centerTitle: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
