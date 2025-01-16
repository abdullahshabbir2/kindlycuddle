import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:googleapis/servicemanagement/v1.dart';

class InfoModalHelp extends StatelessWidget {
  const InfoModalHelp({super.key});

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
                "Help and Support",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 10),
              _buildHeading("Payment Methods", context),
              _buildSubHeading("Credit and Debit Cards", context),
              _buildBulletPoint("Visa", context),
              _buildBulletPoint("MasterCard", context),
              _buildBulletPoint("JCB", context),
              _buildBulletPoint("American Express", context),
              _buildBulletPoint("Apple Pay", context),
              _buildBulletPoint("Diners Club", context),
              _buildBulletPoint("Discover", context),
              _buildParagraph(
                  "Don’t see your card listed? No problem! Feel free to proceed with your purchase. Kindly Cuddle does not store or collect your credit or debit card information. For any questions about your transactions, please consult your card issuer.",
                  context),
              SizedBox(height: 20.h),
              _buildSubHeading("Sales & Use Tax", context),
              _buildSubHeading("What is Sales & Use Tax?", context),
              _buildParagraph(
                  "Sales Tax is applied to purchases based on state laws within the US. The tax amount is calculated at checkout after entering your shipping details.",
                  context),
              _buildSubHeading("How is Sales & Use Tax Calculated?", context),
              _buildParagraph(
                  "Sales Tax is applied to the total merchandise value after discounts. It may also include taxes on shipping and delivery fees, depending on state regulations. The exact amount of Sales Tax will be shown at the checkout stage before you complete your purchase.",
                  context),
              _buildSubHeading("Is Sales & Use Tax Refundable?", context),
              _buildParagraph(
                  "Yes, if you return a product, the applicable Sales Tax will be refunded to your original payment method.",
                  context),
              SizedBox(height: 20.h),
              _buildHeading("Shipping & Delivery", context),
              _buildParagraph(
                  "At Kindly Cuddle, we prioritize delivering your products quickly and safely. Here’s what you need to know about our shipping and delivery process:",
                  context),
              _buildSubHeading("Shipping Options", context),
              _buildBulletPoint(
                  "Free Shipping: Enjoy free shipping on orders over \$100 USD.",
                  context),
              _buildBulletPoint(
                  "Standard Shipping: Estimated delivery time is 3-8 business days.",
                  context),
              _buildBulletPoint(
                  "Express Shipping: Available at an additional cost with delivery in 1-3 business days.",
                  context),
              _buildParagraph(
                  "Shipping time does not include the 1-2 day processing period required from the date your order is placed.",
                  context),
              _buildSubHeading("Order Processing", context),
              _buildParagraph(
                  "Orders are processed within 1-2 business days. You will receive an email confirmation with tracking details once your order is shipped.",
                  context),
              _buildSubHeading("International Shipping", context),
              _buildBulletPoint(
                  "We offer international shipping to select countries.",
                  context),
              _buildBulletPoint(
                  "Delivery times and shipping rates vary by destination. Please check our shipping calculator at checkout for specific information.",
                  context),
              _buildSubHeading("Shipping Reminders", context),
              _buildParagraph(
                  "Unexpected delays might occur due to incorrect addresses, customs checks, or other factors.Any customs duties are the responsibility of the customer.",
                  context),
              SizedBox(height: 20.h),
              _buildHeading("Return & Exchange", context),
              _buildSubHeading("Return Policy", context),
              _buildParagraph(
                  "Return products within 30 days of receipt for a refund or exchange. Items must be unused, in their original, unopened packaging, and in the same condition as when received, including any complimentary gifts received.Products that show signs of wear, damage, cleaning, or alteration cannot be accepted.Some items are not eligible for return, including non-returnable items and free gifts. Please check your order carefully before initiating a return.You are responsible for the shipping costs of returning the item. Note that shipping costs are non-refundable, and the original shipping cost of your order will be deducted from your refund.",
                  context),
              SizedBox(height: 20.h),
              _buildParagraph(
                  "Contact our customer support team including your order number, order date, and a brief explanation to initiate a return. Once approved, we will provide you with a return shipping label and instructions. Kindly allow up to 24 hours for a response to your inquiry.",
                  context),
              SizedBox(height: 20.h),
              _buildSubHeading("Exchange Policy", context),
              _buildBulletPoint(
                  "You can exchange your unused product for a new one within 30 days of receiving it if it has a verified quality issue.",
                  context),
              _buildBulletPoint(
                  "Please contact our customer support and we will guide you through the process and ensure a smooth exchange. ",
                  context),
              SizedBox(height: 20.h),
              _buildSubHeading("Refunds", context),
              _buildBulletPoint(
                  "Refunds will be processed to the original payment method within 5-7 business days after we receive your returned item.",
                  context),
              _buildBulletPoint(
                  "If you haven't received your refund after 5-7 business days, send us an email at support@kindlycuddle.com.",
                  context),
              SizedBox(height: 20.h),
              _buildSubHeading("Order Cancellation", context),
              _buildBulletPoint(
                  "Cancellation Window: Cancel orders within 24 hours of placing them. After this period, orders are processed and cannot be canceled.",
                  context),
              _buildBulletPoint(
                  "Pre-Orders: Can be canceled anytime before shipping.",
                  context),
              _buildBulletPoint(
                  "How to Cancel: Email support@kindlycuddle.com or call 800 717-8157 with your order number.",
                  context),
              _buildBulletPoint(
                  "Refunds: Full refunds will be processed to your original payment method. Allow 5-7 business days for processing.",
                  context),
              _buildBulletPoint(
                  "Orders cannot be canceled once shipped. Please refer to our Return & Exchange Policy.",
                  context),
              _buildParagraph(
                  "For any questions, contact us at support@kindlycuddle.com or 1-800-123-4567.",
                  context),
              SizedBox(height: 20.h),
              _buildHeading("Warranty", context),
              _buildParagraph(
                  "Kindly Cuddle is committed to providing high-quality products that you can trust. All our products come with a warranty to ensure your peace of mind.",
                  context),
              _buildSubHeading("Warranty Coverage", context),
              _buildBulletPoint(
                  "Lifetime warranty on all products after signing up.",
                  context),
              _buildBulletPoint(
                  "This warranty is provided only to the original purchaser of the Kindly Cuddle products when purchased from Kindly Cuddle or an authorized reseller in the United States.Kindly Cuddle reserves the right to reject warranty claims for products purchased from unauthorized sellers, including unauthorized online platforms.",
                  context),
              _buildBulletPoint(
                  "This warranty is non-transferable and is limited to the original end-user purchaser.",
                  context),
              _buildBulletPoint(
                  "This warranty covers any defects in materials and workmanship of the Kindly Cuddle products under normal use and conditions, as described in the product manuals.",
                  context),
              _buildSubHeading("The warranty does not cover", context),
              _buildBulletPoint(
                  "Cosmetic deterioration or damage caused by general wear and tear.",
                  context),
              _buildBulletPoint(
                  "Damage due to misuse, abuse, negligence, or accidents.",
                  context),
              _buildBulletPoint(
                  "Unauthorized disassembly, repair, or modification of the product.",
                  context),
              _buildBulletPoint(
                  "Liquid damage, including water or milk entering the motor or electronic components.",
                  context),
              _buildBulletPoint(
                  "Damage to accessories and external components (only the main hub or motor parts are covered).",
                  context),
              _buildSubHeading("Important Information", context),
              _buildBulletPoint(
                  "Single-User Products: Kindly Cuddle products are designed for use by a single user. Use by more than one person may pose a health risk and void the warranty.",
                  context),
              _buildBulletPoint(
                  "Proof of Purchase: You must provide reasonable evidence, including proof of date of delivery and/or purchase, to support any warranty claims. This includes maintaining your original kindlycuddle.com purchase receipt.",
                  context),
              _buildSubHeading("Warranty Resolution", context),
              _buildParagraph(
                  "Upon verification of a valid warranty claim, Kindly Cuddle will, at its discretion, repair or replace the defective product. If a replacement is provided, it will not renew or extend the original warranty period.",
                  context),
              _buildSubHeading("Warranty Resolution", context),
              _buildParagraph(
                  "Upon verification of a valid warranty claim, Kindly Cuddle will, at its discretion, repair or replace the defective product. If a replacement is provided, it will not renew or extend the original warranty period.",
                  context),
              SizedBox(height: 20.h),
              _buildSubHeading("Limitation of Liability", context),
              _buildParagraph(
                  "There are no warranties that extend beyond those expressly stated herein. Any implied warranties, including those of merchantability or fitness for a particular purpose, are limited to the duration of this warranty. Some states do not allow limitations on how long an implied warranty lasts, so the above limitation may not apply to you.Under no circumstances shall Kindly Cuddle LLC be liable for any special, incidental, or consequential damages resulting from the use of our products, breach of this limited warranty, or breach of contract. Some states do not allow the exclusion or limitation of incidental or consequential damages, so the above limitation or exclusion may not apply to you.",
                  context),
              SizedBox(height: 20.h),
              _buildSubHeading("Your Rights", context),
              _buildParagraph(
                  "This warranty gives you specific legal rights, and you may also have other rights which vary from state to state. ",
                  context),
              _buildParagraph(
                  "At Kindly Cuddle, we’re committed to making the process as easy as possible. If you have any questions or concerns, please don’t hesitate to contact us. Our team is dedicated to providing clear information and excellent customer service.",
                  context),
              SizedBox(height: 20.h),
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

  Widget _buildHeading(String text, BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimaryFixed,
      ),
    );
  }

  Widget _buildSubHeading(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            decorationColor: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline),
      ),
    );
  }

  Widget _buildBulletPoint(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.onSecondaryFixed),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context).colorScheme.onSecondaryFixed),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14.sp, color: Theme.of(context).colorScheme.primary),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
