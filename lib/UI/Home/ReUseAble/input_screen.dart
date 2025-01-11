import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputScreen extends StatefulWidget {
  final bool isVisible;
  final Function setPulseWeight;
  InputScreen({required this.isVisible, required this.setPulseWeight});
  @override
  InputScreenState createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
  // Controllers to get text input
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when no longer needed
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  void _submitInputs() {
    // Get values from text fields
    double firstInput = double.parse(_firstController.text);
    double secondInput = double.parse(_secondController.text);

    // Print the values to console or perform further actions
    print("First Input: $firstInput");
    print("Second Input: $secondInput");

    widget.setPulseWeight(firstInput, secondInput);
  }

  void _redirectHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Center(
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(16.0), // Set desired border radius
          child: Container(
            width: 300, // Set the desired width
            padding: const EdgeInsets.all(16.0),
            color: Colors.white, // White background color
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Makes the height fit the content
              children: [
                TextFormField(
                  controller: _firstController,
                  keyboardType:
                      TextInputType.number, // Sets input type to number
                  decoration: const InputDecoration(
                      labelText: "Pulse",
                      labelStyle: TextStyle(color: Colors.blueGrey)),
                ),
                TextFormField(
                  controller: _secondController,
                  keyboardType:
                      TextInputType.number, // Sets input type to number
                  decoration: const InputDecoration(
                      labelText: "Weight",
                      labelStyle: TextStyle(color: Colors.blueGrey)),
                ),
                const SizedBox(height: 20),
                StyledButton(text: 'Submit', onTap: _submitInputs),
                const SizedBox(height: 20),
                StyledButton(
                  text: 'Cancel',
                  onTap: _redirectHome,
                  backgroundColor: Colors.redAccent,
                  width: 200.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
