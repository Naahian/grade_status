import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).brightness == Brightness.light
        ? const Color(0xffeeeeee)
        : const Color(0xff222222);

    return Container(
      height: 40,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("developed by Abdullah Al Nahian", style: TextStyle(fontSize: 14)),
          const SizedBox(width: 15),
          InkWell(
            child: const Icon(Icons.apple, size: 22),
            onTap: () {},
          ),
          InkWell(
            child: const Icon(Icons.facebook, size: 22),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
