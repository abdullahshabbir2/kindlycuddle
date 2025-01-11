import 'dart:ui';

import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Rounded corners
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max, // Fit content height
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true, // Ensures it fits in the modal
                physics:
                    const NeverScrollableScrollPhysics(), // Prevents internal scrolling
                children: [
                  ListTile(
                    title: Text("Email:",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    subtitle: Text("support@kindlycuddle.com",
                        style: TextStyle(fontSize: 14.sp)),
                  ),
                  ListTile(
                    title: Text("Phone:",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    subtitle:
                        Text("800 717-8157", style: TextStyle(fontSize: 14.sp)),
                  ),
                  ListTile(
                    title: Text("Address:",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    subtitle: Text("Clearwater, FL 33755, USA",
                        style: TextStyle(fontSize: 14.sp)),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              StyledButton(
                text: 'Close',
                onTap: () => Navigator.pop(context), // Close the modal
                backgroundColor: Colors.redAccent,
                width: 200.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
