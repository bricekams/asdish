import 'dart:developer';

import 'package:asdish/config/constants.dart';
import 'package:asdish/providers/states.dart';
import 'package:asdish/ui/widgets/primary_button.dart';
import 'package:asdish/ui/widgets/social_auth_button.dart';
import 'package:asdish/ui/widgets/fields/textfield.dart';
import 'package:asdish/utils/helpers.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> form1Key = GlobalKey();
  GlobalKey<FormState> form2Key = GlobalKey();
  bool showPassword = false;
  bool sendingOTP = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
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
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.7,
                child: TabBar(
                  controller: tabController,
                  onTap: (i) {},
                  tabs: const [
                    Tab(
                      child: Icon(Icons.lock),
                    ),
                    Tab(
                      child: Icon(Icons.perm_phone_msg),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AutoScaleTabBarView(
                controller: tabController,
                children: [
                  Form(
                    key: form1Key,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Email or phone",
                          controller: SignInScreen.emailController,
                          validator: (txt) {
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          label: const Text("Password"),
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
                          controller: SignInScreen.passwordController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.push("/auth/signup");
                              },
                              child: const Text("Create account"),
                            ),
                            TextButton(
                              onPressed: () {
                                context.push("/auth/password/reset-request");
                              },
                              child: const Text("Forget password?"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: form2Key,
                    child: Column(
                      children: [
                        IntlPhoneField(
                          languageCode: "en",
                          dropdownTextStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          controller: SignInScreen.phoneController,
                          initialCountryCode: "CM",
                          keyboardType: TextInputType.number,
                          showDropdownIcon: false,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.push("/auth/signup");
                              },
                              child: const Text("Create account"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              PrimaryButton(
                loading: sendingOTP,
                onPressed: () {
                  if (tabController.index == 1) {
                    setState(() {
                      sendingOTP = true;
                    });
                    auth.verifyPhoneNumber(
                      phoneNumber: "+237${SignInScreen.phoneController.text}",
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        setState(() {
                          sendingOTP = false;
                        });
                        await auth.signInWithCredential(credential);
                      },
                      verificationFailed: (FirebaseAuthException e) async {
                        setState(() {
                          sendingOTP = false;
                        });
                        toast(context,
                            message: e.code, state: ToastState.ERROR);
                      },
                      codeSent:
                          (String verificationId, int? resendToken) async {
                        setState(() {
                          sendingOTP = false;
                        });

                        if (context.read<TimerProvider>().canRequestOTP) {
                          context.read<TimerProvider>().startOTPTimer();
                        }

                        Map<String, dynamic> extra = {
                          "verificationId": verificationId,
                          "resendToken": resendToken,
                        };

                        context.push("/auth/challenges/phone", extra: extra);
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        setState(() {
                          sendingOTP = false;
                        });
                      },
                    );

                  } else {
                    if (context.read<TimerProvider>().canRequestEmailCode) {
                      context.read<TimerProvider>().startEmailTimer();
                    }
                    context.push("/auth/challenges/email");
                  }
                },
                text: "Sign in",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
