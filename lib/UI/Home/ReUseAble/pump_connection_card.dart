import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';

class PumpConnectionCard extends StatelessWidget {
  final dynamic device; // Replace with the actual type of device if known
  final VoidCallback onTap;

  const PumpConnectionCard({
    Key? key,
    required this.device,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 180),
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(20.0), // Optional: Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0999,
              child: AssetsImages(
                path: ImageConstants.finalPump,
              ),
            ),
            bodyText(
              device == null ? 'Not Connected' : 'Connected',
              bodyFontSize: 12,
              bodyTextFontWeight: FontWeight.w400,
              bodyTextHeight: 1,
            ),
            StyledButton(
              text: device == null ? 'Connect Pump' : 'Disconnect',
              onTap: onTap,
              backgroundColor: const Color(0xFFB2CBF2),
              textColor: Colors.white,
              height: MediaQuery.of(context).size.height * (33 / 712),
              width: MediaQuery.of(context).size.width * (137 / 375),
            )
          ],
        ),
      ),
    );
  }
}
