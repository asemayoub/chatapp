import 'package:chatapp/Share/Components/components.dart';
import 'package:chatapp/pages/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Share/Components/constant.dart';
import 'SignUp_page.dart';

class LoginScreen extends StatefulWidget {
  String id = 'LoginScreenPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

  bool isHidden = true;

  bool isLoading = false;

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Image.asset(
                          'assets/icon/chat-10-removebg-preview.png'),
                    ),
                    Container(
                      height: 420,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                        top: 20,
                        right: 10,
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Welcome And Sign Up

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Welcome,',
                                fontsize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, SignUpScreen().id);
                                },
                                child: CustomText(
                                  text: 'SignUp',
                                  fontsize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Primarycolor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: 'Sign in to Continue',
                            fontsize: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 56,
                          ),
                          InputForm(
                            obsecure: false,
                            onchange: (value) {
                              email = value;
                            },
                            type: TextInputType.emailAddress,
                            text: 'Email',
                            color: Colors.grey,
                            iconPrefex: Icons.email_outlined,
                            hint: 'email@example.com',
                            onsave: (value) {},
                            onvalidate: (value) {
                              if (value!.isEmpty) {
                                return 'Please Type Email';
                              }
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InputForm(
                            onchange: (value) {
                              password = value;
                            },
                            obsecure: isHidden,
                            type: TextInputType.visiblePassword,
                            text: 'Passsword',
                            color: Colors.grey,
                            iconPrefex: Icons.lock,
                            setIcon: isHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                            suffexclick: () {
                              setState(() {
                                togglePassword();
                              });
                            },
                            hint: '**************',
                            onsave: (value) {},
                            onvalidate: (value) {
                              if (value!.isEmpty) {
                                return 'Please Type Password';
                              }
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                            text: 'Forget Password?',
                            fontsize: 14,
                            alignment: Alignment.topRight,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButtom(
                            onpressed: () async {
                              if (formkey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                                try {
                                  await LoginUser();
                                  snackBarMessage(context, 'Success Login');
                                  Navigator.pushNamed(context, chatScreen().id,
                                      arguments: email);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    snackBarMessage(context,
                                        'No user found for that email');
                                  } else if (e.code == 'wrong-password') {
                                    // This Is Extract Method
                                    snackBarMessage(context,
                                        'Wrong password provided for that user');
                                  } else if (e.code == null) {
                                    snackBarMessage(context, 'message');
                                  }
                                } catch (e) {
                                  snackBarMessage(context, 'erorr Is $e');
                                }
                                isLoading = false;
                                setState(() {});
                              } else {
                                return 'Type Input';
                              }
                            },
                            text: 'SIGN IN',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void snackBarMessage(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$message'),
      backgroundColor: Primarycolor,
    ));
  }

  Future<void> LoginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

  void togglePassword() {
    setState(() {
      isHidden = !isHidden;
    });
  }
}
