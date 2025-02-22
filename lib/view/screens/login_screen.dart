import 'package:bank_app/view/constants/color.dart';
import 'package:bank_app/view/screens/home_screen.dart';
import 'package:bank_app/view/screens/register_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';
import '../components/navigate.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold, // Makes the text bold
                      color: rmaincolor,
                      fontSize: 60,// Change to your desired color
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    controller: emailController,
                    focusNode: _emailFocusNode,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    hintText: 'Enter UserName',
                    labelText: 'User Name',
                    prefixIcon: Icons.supervised_user_circle,
                    prefixIconColor: rmaincolor,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: passwordController,
                    focusNode: _passwordFocusNode,
                    onFieldSubmitted: (data) {
                      if (formKey.currentState!.validate()) {}
                    },
                    hintText: 'Enter your Password',
                    labelText: 'Password',
                    prefixIcon: Icons.lock,
                    prefixIconColor: rmaincolor,
                    suffixIcon: Icons.visibility_outlined, // أيقونة الإظهار
                    suffixIconToggle: Icons.visibility_off_outlined, // أيقونة الإخفاء
                    isPassword: true, // تفعيل ميزة الإخفاء والإظهار
                  ),
                  SizedBox(height: 30),
                  ConditionalBuilder(
                    condition: true,
                    builder: (context) => CustomButton(

                      text: 'LOGIN',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          navigateAndFinish(context, HomeScreen());
                        }
                      },
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          navigateAndFinish(context, RegisterScreen());
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: rmaincolor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}