import 'dart:async';
import 'dart:developer';

import 'package:asdish/config/constants.dart';
import 'package:asdish/providers/states.dart';
import 'package:asdish/ui/widgets/fields/textfield.dart';
import 'package:asdish/ui/widgets/primary_button.dart';
import 'package:asdish/ui/widgets/social_auth_button.dart';
import 'package:asdish/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool showRePassword = false;
  bool processing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SocialAuthButton(
                      icon: FontAwesomeIcons.google,
                      text: "Google",
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: const Row(children: <Widget>[
                        Expanded(child: Divider()),
                        Text(
                          "OR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(child: Divider()),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: SignUpScreen.firstNameController,
                            label: const Text("First name"),
                            validator: (txt) {
                              if (txt != null && txt.isEmpty) return "Required";
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: SignUpScreen.emailController,
                            label: const Text("Email (optional)"),
                            validator: (txt) {
                              if (txt != null &&
                                  txt.isNotEmpty &&
                                  !isValidEmail(txt ?? "")) return "Invalid";
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          IntlPhoneField(
                            languageCode: "en",
                            dropdownTextStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            controller: SignUpScreen.phoneController,
                            initialCountryCode: "CM",
                            keyboardType: TextInputType.number,
                            validator: (c) {
                              if (!isDigitsOnly(c?.number ?? "")) {
                                return "Invalid";
                              }
                              return null;
                            },
                            countries: const [
                              Country(
                                name: "Cameroon",
                                nameTranslations: {
                                  "fr": "Cameroun",
                                  "en": "Cameroon",
                                },
                                flag: "🇨🇲",
                                code: "CM",
                                dialCode: "237",
                                minLength: 9,
                                maxLength: 9,
                              ),
                            ],
                            disableLengthCheck: true,
                            showCountryFlag: false,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              label: const Text("Phone"),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              suffixIcon: const Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            label: const Text("Password"),
                            validator: (txt) {
                              if (!isValidPassword(txt ?? "")) {
                                return "Not strong enough, add digits, special characters, capital and non capital letters";
                              }
                              return null;
                            },
                            obscureText: !showPassword,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: !showPassword
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                            ),
                            controller: SignUpScreen.passwordController,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            label: const Text("Confirm password"),
                            obscureText: !showRePassword,
                            validator: (txt) {
                              if (SignUpScreen.passwordController.text != txt) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showRePassword = !showRePassword;
                                });
                              },
                              child: !showRePassword
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                            ),
                            controller: SignUpScreen.rePasswordController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Text("I have an account"),
                              ),
                            ],
                          ),
                          PrimaryButton(
                            text: "Sign up",
                            loading: processing,
                            onPressed: () {
                              if (!formKey.currentState!.validate()) return;
                              _signup();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  _signup() async {
    setState(() {
      processing = true;
    });
    try {
      UserCredential? credential;
      if (SignUpScreen.emailController.text.isNotEmpty) {
        credential = await auth.createUserWithEmailAndPassword(
          email: SignUpScreen.emailController.text,
          password: SignUpScreen.passwordController.text,
        );
      }
      _verifyPhoneNumber(credential);
      setState(() {
        processing = true;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        processing = false;
      });
      if (context.mounted) {
        toast(context, message: e.code, state: ToastState.ERROR);
      }
    }
  }

  Future<UserCredential?> _verifyPhoneNumber(UserCredential? credential) async {
    UserCredential? creds = credential;
    await auth.verifyPhoneNumber(
      phoneNumber: "+237${SignUpScreen.phoneController.text}",
      timeout: const Duration(minutes: 1),
      verificationCompleted: (phoneCredential) async {},
      verificationFailed: (e) {
        setState(() {
          processing = false;
        });
        if (context.mounted) {
          toast(context, message: e.code, state: ToastState.ERROR);
        }
      },
      codeSent: (verificationId, resendToken) {
        setState(() {
          processing = false;
        });

        if (context.read<TimerProvider>().canRequestOTP) {
          context.read<TimerProvider>().startOTPTimer();
        }

        Map<String, dynamic> extra = {
          "verificationId": verificationId,
          "resendToken": resendToken,
          "verificationCompleted": (PhoneAuthCredential credential) async {
            try {
              if (creds != null &&
                  creds!.user != null &&
                  creds!.user!.email != null &&
                  creds!.user!.email!.isNotEmpty) {
                log("supposed email: ${creds!.user!.email}");
                log("Supposed phone creds ${credential.toString()}");
                creds = await creds?.user?.linkWithCredential(credential);
              } else {
                creds ??= await auth.signInWithCredential(credential);
              }
              log("user 1 log: ${creds.toString()}");
              await creds?.user
                  ?.updateDisplayName(SignUpScreen.firstNameController.text);
              if (creds?.user?.email == null) {
                await creds?.user
                    ?.updatePassword(SignUpScreen.passwordController.text);
              }
              await creds?.user?.reload();
              log("user 2 log: ${creds.toString()}");
            } on FirebaseAuthException catch (e) {
              await auth.currentUser?.delete();
              rethrow;
            }
            return;
          },
        };

        context.push("/auth/challenges/phone", extra: extra);
      },
      codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout) {
        // setState(() {
        //   processing = false;
        // });
      },
    );
    return creds;
  }
}
