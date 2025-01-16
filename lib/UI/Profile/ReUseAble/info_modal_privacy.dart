import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoModalPrivacy extends StatelessWidget {
  const InfoModalPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Rounded corners
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(16.0),
        color: Theme.of(context).colorScheme.surface,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max, // Fit content height
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 10),
              _buildParagraph(
                  "At Kindly Cuddle, we respect your privacy and are committed to protecting your personal information. Our privacy policy outlines how we collect, use, and safeguard your data:"),
              _buildSubHeading("Information We Collect"),
              _buildBulletPoint(
                  "Personal Information: We collect personal information such as your name, email address, shipping address, and payment details when you make a purchase or create an account."),
              _buildBulletPoint(
                  "Usage Data: We collect information on how you interact with our website, including your browsing history, search queries, and the pages you visit."),
              const SizedBox(height: 10),
              _buildSubHeading("How We Use Your Information"),
              _buildBulletPoint(
                  "Order Processing: To process and fulfill your orders, communicate with you about your purchase, and provide customer support."),
              _buildBulletPoint(
                  "Marketing: To send you promotional offers, newsletters, and updates about our products and services. You can opt out of these communications at any time."),
              _buildBulletPoint(
                  "Improvement: To improve our website, products, and services based on your feedback and usage data."),
              const SizedBox(height: 10),
              _buildSubHeading("Data Security"),
              _buildBulletPoint(
                  "We implement a variety of security measures to maintain the safety of your personal information. This includes using secure servers and encryption technologies to protect your data from unauthorized access."),
              _buildSubHeading("Third-Party Disclosure"),
              _buildBulletPoint(
                  "We do not sell, trade, or otherwise transfer your personal information to outside parties unless required by law or with your consent."),
              const SizedBox(height: 10),
              _buildSubHeading("Your Rights"),
              _buildBulletPoint(
                  "You have the right to access, update, or delete your personal information at any time. Please contact our customer support team to exercise these rights."),
              const SizedBox(height: 20),
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

  Widget _buildSubHeading(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: TextStyle(fontSize: 14.sp),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color.fromARGB(255, 99, 99, 99)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.sp),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
