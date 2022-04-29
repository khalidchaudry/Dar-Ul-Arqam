import 'package:flutter/material.dart';

// Use appBar as a Global Widget
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final double toolbarHeight;
  final Color? backgroundColor;
  final VoidCallback? backButtonCallback;

  const AppBarWidget({
    Key? key,
    required this.title,
    this.actions = const [],
    this.toolbarHeight = kToolbarHeight,
    this.backgroundColor,
    this.backButtonCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leadingWidth: 60,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor,
      leading: (backButtonCallback != null)
          ? IconButton(
              onPressed: backButtonCallback, icon: const Icon(Icons.arrow_back))
          : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
