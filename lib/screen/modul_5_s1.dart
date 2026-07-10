import 'package:flutter/material.dart';

class Typography extends StatelessWidget {
  const Typography({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SelectableText(
          "Siz hali ro'yxatdan o'tmagansiz!",
          onSelectionChanged: (TextSelection selection, SelectionChangedCause? cause) {
            debugPrint("Belgilash ${selection.start}, tugadi ${selection.end}");
          },
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.redAccent,
            fontFamily: "Roboto",
          ),
          showCursor: true,
          cursorColor: Colors.green,
        ),
      ),
    );
  }
}
