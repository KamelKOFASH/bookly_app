import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomDetailsViewAppBar extends StatelessWidget {
  const CustomDetailsViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(FontAwesomeIcons.bookmark),
        ),
      ],
    );
  }
}
