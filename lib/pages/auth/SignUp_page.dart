import 'package:chatapp/Share/Components/components.dart';
import 'package:chatapp/pages/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Share/Components/constant.dart';

class SignUpScreen extends StatelessWidget {
  String id = 'SignUpScreen';

  @override
  Widget build(BuildContext context) {
    String? Email;
    String? Password;
    GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
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
                          onvalidate: (value) {},
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButtom(
                          onpressed: () async {
                            // Access Method User And Password



                            // الميل والباسورد جايين من ال input فهبدا اخزنهم

                            try {
                              await signUpFireBase(Email, Password);
                              snackBarMessage(context,'Email Is Created');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                               snackBarMessage(context, 'The password provided is too weak');
                              } else if (e.code == 'email-already-in-use') {
                                // This Is Extract Method
                                snackBarMessage(context,'The account already exists for that email');

                              }
                            } catch (e) {
                              snackBarMessage(context, 'erorr Is $e');
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
    );
  }

  void snackBarMessage(BuildContext context,String? message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$message'),backgroundColor: Primarycolor,));
  }

  Future<void> signUpFireBase(String? Email, String? Password) async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: Email!,
      password: Password!,
    );
  }


}
