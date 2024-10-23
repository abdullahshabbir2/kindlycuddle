import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  final String id;
  const MessagePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(id.toString()))
        ],
      ),
    );
  }
}
