// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundedButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.4),
      shape: const CircleBorder(),
      child: DecoratedBox(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: context.colors.greyDark,
          ),
        ),
      ),
    );
  }
}
