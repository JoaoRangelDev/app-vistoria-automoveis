import 'package:flutter/material.dart';

class AppBarGeral extends StatefulWidget implements PreferredSizeWidget {
  const AppBarGeral({Key? key, required this.title, required this.actions})
      : super(key: key);
  final String title;
  final List<Widget> actions;

  @override
  State<AppBarGeral> createState() => _AppBarGeralState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _AppBarGeralState extends State<AppBarGeral> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
      ),
      actions: widget.actions,
    );
  }
}
