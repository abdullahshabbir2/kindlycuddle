import 'package:cuddle_care/Constants/colors_constants.dart';
import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/assets_image.dart';
import 'package:cuddle_care/UI/ReUseAble/body_text.dart';
import 'package:cuddle_care/UI/ReUseAble/heading_text.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:cuddle_care/UI/ReUseAble/styled_button.dart';
import 'package:cuddle_care/UI/SignIn/ReUseAble/account_sign.dart';
import 'package:cuddle_care/UI/SignIn/ReUseAble/login_option.dart';
import 'package:cuddle_care/UI/SignIn/ReUseAble/styled_text_field.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_cubit.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_initial_params.dart';
import 'package:cuddle_care/UI/SignIn/SignUp/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  final SignUpCubit cubit;
  // final UserDeInitialParams initialParams;
  const SignUpPage({Key? key, required this.cubit}) : super(key: key);


  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  SignUpCubit get cubit => widget.cubit;

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    // TODO : Fix it Later
    cubit.onInit(SignUpInitialParams());
   cubit.navigator.context =  context;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(BuildContext context, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 43.5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AssetsImages(path: ImageConstants.kindlyCuddle,height: 50),

                ],
              ),
              SizedBox(height: 30.h,),

              Stack(
                children: [
                  ReUseAbleSvg(path: ImageConstants.backgroundShape,height: MediaQuery.of(context).size.height*((812-164)/812),width: MediaQuery.of(context).size.width,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.h,),
                      headingText('Get Started Free!',customHeadingHeight: 1.5),
                      bodyText('Free Forever. No Credit Cards Needed',bodyTextHeight: 1),
                      SizedBox(height: 29.h,),

                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[

                            BlocBuilder(
                                bloc:cubit,
                                builder: (context , state) {
                                  state as SignUpState;
                                  return StyledTextField(
                                    label: 'Username',
                                    hint: 'youremail@broskeez.com',
                                    iconPath: ImageConstants.emailIcon,
                                    validator:   (value){
                                      // return cubit.emailValidator(value) ;
                                    },
                                    inputType: TextInputType.emailAddress,
                                    error: state.emailValidator,
                                    onChanged: (value){
                                      cubit.emailValidator(value);
                                    },
                                  );
                                }
                            ),
                            // SizedBox(height: 12.h,),
                            BlocBuilder(
                                bloc:cubit,
                                builder: (context , state) {
                                  state as SignUpState;
                                  return StyledTextField(
                                    label: 'Username',
                                    iconPath: ImageConstants.userIcon,
                                    // validator:   (value){
                                    //   cubit.setUserName(value);
                                    //   // return cubit.emailValidator(value) ;
                                    // },
                                    onChanged: (value){
                                      cubit.setUserName(value);
                                    },
                                    inputType: TextInputType.emailAddress,
                                    // error: state.,
                                  );
                                }
                            ),
                            // SizedBox(height: 12.h,),
                            BlocBuilder(
                                bloc: cubit,
                                builder: (context,state) {
                                  state as SignUpState;
                                  return StyledTextField(
                                      label: 'Password',
                                      iconPath: ImageConstants.passwordIcon,
                                      validator: (value){
                                        return cubit.passwordValidator(value) ;
                                      },
                                      inputType: TextInputType.text,
                                      error: state.passwordValidator,
                                      showVisibilityIcons: true,
                                      obscureText: !(state.showPassword),
                                      onTap: (){
                                        cubit.reverseObsecurity();
                                      },
                                      onChanged: (password){
                                        cubit.checkPasswordStrength(password);
                                      },
                                    showStrength: state.showStrength,
                                    level: state.strengthLevel,

                                  );
                                }
                            ),


                            // SizedBox(height: 10.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: (){
                                      cubit.resetPassword();
                                    },
                                    child: bodyText('Forgot Password?',bodyTextColor: ColorsConstants.textFieldTextColor,bodyFontSize: 11,bodyTextFontWeight: FontWeight.w400, bodyTextHeight: 0,bodyTextLetterSpacing: 0)),
                                SizedBox(width: 32.w,),
                              ],
                            ),
                            // SizedBox(height: 18.h,),
                            BlocBuilder(
                                bloc: cubit,
                                builder: (context , state) {
                                  state as SignUpState;
                                  return StyledButton(
                                      height: 60.h,
                                      text: 'Sign Up', onTap: (){

                                    // if (_formKey.currentState!.validate()) {
                                      // If the form is valid, display a snackbar. In a real app,
                                      // you would often call a server or save the information in a database.

                                      // if(state.emailValidated && state.passwordValidated){
                                        cubit.signUp(context);
                                      // }



                                    // }



                                  });
                                }
                            ),
                            SizedBox(height: 10.h,),



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

                      bodyText('Or continue with',bodyTextColor: ColorsConstants.textFieldTextColor,bodyFontSize: 11,bodyTextFontWeight: FontWeight.w400, bodyTextHeight: 0,bodyTextLetterSpacing: 0),
                      SizedBox(height: 25.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          loginOption(ImageConstants.google, () { cubit.googleSignUp(context); }),
                          SizedBox(width: 23.w,),
                          loginOption(ImageConstants.apple, () { }),
                          SizedBox(width: 23.w,),
                          loginOption(ImageConstants.facebook, () { })
                        ],
                      ),
                      SizedBox(height: 10.h,),


                      AccountSign(actionText: 'Sign In', bodyString: 'Already have an account?', onTap: (){
                        cubit.moveToSignIn();
                      }),



                      SizedBox(height: 10.h,),



                    ],
                  ),
                ],
              ),

            ],
          ) ,
        ),
      ),
      designSize: const Size(376.0, 812.0),
    );
  }

  // Function to build strength bar
  Widget buildStrengthBar(int level) {
    return Row(
      children: List.generate(4, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          height: 2,
          width: 11,
          decoration: BoxDecoration(
            color: index < level ? Colors.green : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
