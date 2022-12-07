import 'package:chatapp/Share/Components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Share/Components/constant.dart';

class SignUpScreen extends StatefulWidget {
  String id = 'Signup';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? Email;
  String? Password;
  // Global Key Form Validation
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
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
                                text: 'SignUp,',
                                fontsize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: CustomText(
                                  text: 'SignIn',
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
                            text: 'Welcome New User',
                            fontsize: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 56,
                          ),
                          // User Name Filed
                          InputForm(
                            onvalidate: (value) {
                              if (value!.isEmpty) {
                                return 'User Name Is Required';
                              }
                            },
                            type: TextInputType.text,
                            text: 'User Name',
                            color: Colors.grey,
                            iconPrefex: Icons.person,
                            hint: 'User Name',
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          // Email Field
                          InputForm(
                            onvalidate: (value) {
                              if (value!.isEmpty) {
                                return 'Email Is Required';
                              }
                            },
                            onchange: (value) {
                              Email = value;
                            },
                            type: TextInputType.emailAddress,
                            text: 'Email',
                            color: Colors.grey,
                            iconPrefex: Icons.email_outlined,
                            hint: 'Email@example.com',
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          // Password Filed
                          InputForm(
                            onchange: (value) {
                              Password = value;
                            },
                            type: TextInputType.visiblePassword,
                            text: 'Passsword',
                            color: Colors.grey,
                            iconPrefex: Icons.lock,
                            iconSuffex: Icons.visibility,
                            hint: '**************',
                            onsave: (value) {},
                            onvalidate: (value) {
                              if (value!.isEmpty) {
                                return 'Password Is Required';
                              }
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButtom(
                            onpressed: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });

                                // Access Method User And Password
                                // الميل والباسورد جايين من ال input فهبدا اخزنهم
                                try {
                                  await signUpFireBase(Email, Password);
                                  snackBarMessage(context, 'Success');
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    snackBarMessage(context,
                                        'The password provided is too weak');
                                  } else if (e.code == 'email-already-in-use') {
                                    // This Is Extract Method
                                    snackBarMessage(context,
                                        'The account already exists for that email');
                                  }
                                } catch (e) {
                                  snackBarMessage(context, 'erorr Is $e');
                                }
                                isLoading = false;
                                setState(() {});
                              } else {
                                return 'field Is Required';
                              }
                            },
                            text: 'Register Now ',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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

  Future<void> signUpFireBase(String? Email, String? Password) async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: Email!,
      password: Password!,
    );
  }
}
