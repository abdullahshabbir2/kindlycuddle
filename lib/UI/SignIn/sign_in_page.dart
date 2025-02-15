import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:cuddle_care/UI/SignIn/ReUseAble/account_sign.dart';
import 'package:cuddle_care/UI/SignIn/ReUseAble/gradient_divider.dart';
import 'package:cuddle_care/UI/SignIn/ReUseAble/login_option.dart';
import 'package:cuddle_care/UI/SignIn/ReUseAble/styled_text_field.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_cubit.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatefulWidget {
  final SignInCubit cubit;
  // final UserDeInitialParams initialParams;
  const SignInPage({Key? key, required this.cubit}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInCubit get cubit => widget.cubit;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(SignInInitialParams());
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 43.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AssetsImages(path: ImageConstants.kindlyCuddle, height: 50),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Stack(
                children: [
                  ReUseAbleSvg(
                    path: ImageConstants.backgroundShape,
                    height: MediaQuery.of(context).size.height *
                        ((812 - 164) / 812),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      headingText('Welcome Back!', customHeadingHeight: 1.5),
                      bodyText('welcome back we missed you', bodyTextHeight: 1),
                      SizedBox(
                        height: 25.h,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            BlocBuilder(
                                bloc: cubit,
                                builder: (context, state) {
                                  state as SignInState;
                                  return StyledTextField(
                                    label: 'Username',
                                    iconPath: ImageConstants.userIcon,
                                    validator: (value) {
                                      return cubit.emailValidator(value);
                                    },
                                    inputType: TextInputType.emailAddress,
                                    error: state.emailValidator,
                                    onChanged: (value) {
                                      cubit.setEmail(value as String);
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 12.h,
                            ),
                            BlocBuilder(
                                bloc: cubit,
                                builder: (context, state) {
                                  state as SignInState;
                                  return StyledTextField(
                                    label: 'Password',
                                    iconPath: ImageConstants.passwordIcon,
                                    validator: (value) {
                                      return cubit.passwordValidator(value);
                                    },
                                    inputType: TextInputType.text,
                                    error: state.passwordValidator,
                                    showVisibilityIcons: true,
                                    obscureText: !(state.showPassword),
                                    onTap: () {
                                      cubit.reverseObsecurity();
                                    },
                                    onChanged: (password) {
                                      cubit.setPassword(password);
                                    },
                                  );
                                }),

                            SizedBox(height: 10.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      cubit.resetPassword();
                                    },
                                    child: bodyText('Forgot Password?',
                                        bodyTextColor:
                                            ColorsConstants.textFieldTextColor,
                                        bodyFontSize: 11,
                                        bodyTextFontWeight: FontWeight.w400,
                                        bodyTextHeight: 0,
                                        bodyTextLetterSpacing: 0)),
                                SizedBox(
                                  width: 32.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            BlocBuilder(
                                bloc: cubit,
                                builder: (context, state) {
                                  state as SignInState;
                                  return StyledButton(
                                      height: 60.h,
                                      text: 'Sign In',
                                      onTap: () {
                                        // if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In a real app,
                                        // you would often call a server or save the information in a database.

                                        cubit.SignIn(context);

                                        // }
                                      });
                                }),
                            SizedBox(
                              height: 30.h,
                            ),

                            // ElevatedButton(
                            //   onPressed: () {
                            //     // Validate returns true if the form is valid, or false otherwise.
                            //     if (_formKey.currentState!.validate()) {
                            //       // If the form is valid, display a snackbar. In a real app,
                            //       // you would often call a server or save the information in a database.
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         SnackBar(content: Text('Processing Data')),
                            //       );
                            //     }
                            //   },
                            //   child: Text('Submit'),
                            // ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center everything
                        children: [
                          GradientDivider(
                            width: MediaQuery.of(context).size.width *
                                0.25, // 25% screen width
                            color: Colors.grey,
                            reverse: false,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8), // Spacing around text
                            child: Text(
                              'Or continue with',
                              style: TextStyle(
                                color: ColorsConstants.textFieldTextColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          GradientDivider(
                            width: MediaQuery.of(context).size.width *
                                0.25, // 25% screen width
                            color: Colors.grey,
                            reverse: true,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          loginOption(ImageConstants.google, () {
                            cubit.googleSignUp(context);
                          }),
                          SizedBox(
                            width: 23.w,
                          ),
                          loginOption(ImageConstants.apple, () {}),
                          SizedBox(
                            width: 23.w,
                          ),
                          loginOption(ImageConstants.facebook, () {})
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AccountSign(
                          actionText: 'Sign Up',
                          bodyString: 'Don\'t have an account?',
                          onTap: () {
                            cubit.moveToSignUp();
                          }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      designSize: const Size(376.0, 852.0),
    );
  }
}
