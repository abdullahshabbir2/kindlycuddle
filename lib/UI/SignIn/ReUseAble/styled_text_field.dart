// import 'package:cuddle_care/Constants/colors_constants.dart';
// import 'package:cuddle_care/UI/ReUseAble/body_text_style.dart';
// import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// Widget StyledTextField(
//     String label,
//     String iconPath,
//     Function validator,
//     {String? hint, TextInputType? inputType,bool? obscureText, bool? showVisibilityIcons,VoidCallback? onTap}
//     ) {
//   TextEditingController controller = TextEditingController();
//
//   return Column(
//     children: [
//
//       Container(
//         width: 327.w,
//         height: 55.h,
//         decoration: ShapeDecoration(
//           color: Colors.white.withOpacity(0.6000000238418579),
//           shape: RoundedRectangleBorder(
//             side: const BorderSide(width: 0.30, color: Colors.white),
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//         child: TextFormField(
//           obscureText: obscureText ?? false,
//           controller: controller,
//           keyboardType: inputType ?? TextInputType.text,
//           decoration: InputDecoration(
//             hintText: hint ?? label,
//             hintStyle: BodyTextStyle(bodyTextColor: ColorsConstants.textFieldTextColor, bodyTextFontWeight: FontWeight.w100),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.white.withOpacity(0.6), // Semi-transparent white color
//                 width: 0.3, // Border width
//               ),
//               borderRadius: BorderRadius.circular(20.0), // Rounded corners
//             ),
//             prefixIcon:  Padding(
//               padding: const EdgeInsets.all( 15), // add padding to adjust icon
//               child: ReUseAbleSvg(path: iconPath,),
//             ),
//             suffixIcon: Visibility(
//                 visible: showVisibilityIcons ?? false,
//                 child: InkWell(
//                     onTap:onTap,
//                     child: Container(child: (obscureText ?? false) ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off_sharp)))),
//             ),
//
//           validator: (value) {
//             debugPrint(validator(value));
//             return validator(value);
//           },
//         ),
//       ),
//     ],
//   );
//
// }

import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text_style.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/SignIn/ReUseAble/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyledTextField extends StatefulWidget {
  final String label;
  final String iconPath;
  final String? hint;
  final TextInputType? inputType;
  final bool? obscureText;
  final bool? showVisibilityIcons;
  final Function validator;
  final VoidCallback? onTap;
  final String? error;
  final Function? onChanged;
  final bool? showStrength;
  final int? level;
  const StyledTextField({
    Key? key,
    required this.label,
    required this.iconPath,
    this.hint,
    this.inputType,
    this.obscureText,
    this.showVisibilityIcons,
    required this.validator,
    this.onTap,
    this.error,
    this.onChanged,
    this.showStrength,
    this.level
  }) : super(key: key);

  @override
  _StyledTextFieldState createState() => _StyledTextFieldState();
}

class _StyledTextFieldState extends State<StyledTextField> {
  late bool _obscureText; // State variable for toggling visibility
  late TextEditingController _controller;

  List<String> strengths = [
    'Weak',
    'normal',
    'Strong',
    'excellent'
  ];

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? false; // Initialize obscureText from widget
    _controller = TextEditingController(); // Initialize controller
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingText(widget.label,fontSize: 15),
        SizedBox(height: 13.h,),
        Container(
          width: 327.w,
          height: 55.h,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.6),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.30, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: TextFormField(
            obscureText: widget.obscureText ?? false,
            controller: _controller,
            keyboardType: widget.inputType ?? TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint ?? widget.label,
              hintStyle: BodyTextStyle(
                bodyTextColor: ColorsConstants.textFieldTextColor,
                bodyTextFontWeight: FontWeight.w100,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.6), // Semi-transparent white color
                  width: 0.3, // Border width
                ),
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15), // add padding to adjust icon
                child: ReUseAbleSvg(path: widget.iconPath),
              ),
              suffixIcon: Visibility(
                visible: widget.showVisibilityIcons ?? false,
                child: InkWell(
                  onTap: widget.onTap,
                  child: (widget.showStrength ?? false)
                      ?
                  buildStrengthBar(widget.level ?? 0)
                  :
                  Icon(
                    color: ColorsConstants.textFieldTextColor,
                    (widget.obscureText ?? false) ? Icons.visibility : Icons.visibility_off_sharp,
                  ),
                ),
              ),
            ),
            validator: (value) {
              debugPrint(widget.validator(value));
              widget.validator(value);
            },
            onChanged: (value){
              widget.onChanged!(value);
            },
          ),
        ),
        errorText(widget.error ?? ''),

        // Builder(
        //   builder: (context) {
        //     final formFieldState = Form.of(context)._fields[widget.key];
        //     return formFieldState?.hasError == true
        //         ? Padding(
        //       padding: const EdgeInsets.only(left: 8.0, top: 4.0),
        //       child: Text(
        //         formFieldState.errorText ?? '',
        //         style: const TextStyle(color: Colors.red, fontSize: 12),
        //       ),
        //     )
        //         : const SizedBox.shrink(); // Empty space if no error
        //   },
        // )
      ],
    );
  }
  // Function to build strength bar
  Widget buildStrengthBar(int level) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:[
        ...List.generate(3, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          height: 2,
          width: 11,
          decoration: BoxDecoration(
            color: index < level ? Colors.green : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
        strengthText(strengths[widget.level ?? 0])
    ]
    );
  }

  Widget strengthText(String text){
    return Text(
      text,
      style: TextStyle(
        color: ColorsConstants.strengthTextColor,
        fontSize: 10.45,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        height: 0,
      ),
    );
  }
}
