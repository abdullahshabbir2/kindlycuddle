import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  final bool isVisible;
  final Function setPulseWeight;
  InputScreen({required this.isVisible, required this.setPulseWeight});
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
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
    double firstInput =  double.parse(_firstController.text) ;
    double secondInput = double.parse(_secondController.text) ;

    // Print the values to console or perform further actions
    print("First Input: $firstInput");
    print("Second Input: $secondInput");

    widget.setPulseWeight(firstInput , secondInput);

  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Set desired border radius
          child: Container(
            width: 300, // Set the desired width
            padding: const EdgeInsets.all(16.0),
            color: Colors.white, // White background color
            child: Column(
              mainAxisSize: MainAxisSize.min, // Makes the height fit the content
              children: [
                TextFormField(
                  controller: _firstController,
                  keyboardType: TextInputType.number, // Sets input type to number
                  decoration: InputDecoration(labelText: 'Pulse'),
                ),
                TextFormField(
                  controller: _secondController,
                  keyboardType: TextInputType.number, // Sets input type to number
                  decoration: InputDecoration(labelText: 'Weight'),
                ),
                SizedBox(height: 20),

                StyledButton(text: 'Submit', onTap: _submitInputs),

                // ElevatedButton(
                //   onPressed: _submitInputs,
                //   child: Text("Submit"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );


    // return Visibility(
    //   visible: widget.isVisible,
    //   child: Center(
    //     child: Container(
    //       width: 300, // Set the desired width
    //       padding: const EdgeInsets.all(16.0),
    //
    //       color: Colors.white, // White background color
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min, // Makes the height fit the content
    //         children: [
    //           TextField(
    //             controller: _firstController,
    //             decoration: InputDecoration(labelText: 'First Input'),
    //           ),
    //           TextField(
    //             controller: _secondController,
    //             decoration: InputDecoration(labelText: 'Second Input'),
    //           ),
    //           SizedBox(height: 20),
    //           ElevatedButton(
    //             onPressed: _submitInputs,
    //             child: Text("Submit"),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );


    // Visibility(
    //   visible: widget.isVisible,
    //   child: Container(
    //     color: Colors.white, // Set background color to white
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       children: [
    //         TextField(
    //           controller: _firstController,
    //           decoration: InputDecoration(labelText: 'First Input'),
    //         ),
    //         TextField(
    //           controller: _secondController,
    //           decoration: InputDecoration(labelText: 'Second Input'),
    //         ),
    //         SizedBox(height: 20),
    //         ElevatedButton(
    //           onPressed: _submitInputs,
    //           child: Text("Submit"),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    // return
    //   // Scaffold(
    //   // appBar: AppBar(
    //   //   title: Text("Input from TextFields"),
    //   // ),
    //   // body: Padding(
    //   //   padding: const EdgeInsets.all(16.0),
    //   //   child:
    //     Visibility(
    //       visible: widget.isVisible,
    //       child: Column(
    //         children: [
    //           TextField(
    //             controller: _firstController,
    //             decoration: InputDecoration(labelText: 'First Input'),
    //           ),
    //           TextField(
    //             controller: _secondController,
    //             decoration: InputDecoration(labelText: 'Second Input'),
    //           ),
    //           SizedBox(height: 20),
    //           ElevatedButton(
    //             onPressed: _submitInputs,
    //             child: Text("Submit"),
    //           ),
    //         ],
    //       ),
    //     );
    //   ),
    // );
  }
}