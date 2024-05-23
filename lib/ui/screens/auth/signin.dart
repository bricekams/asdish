import 'package:asdish/ui/widgets/primary_button.dart';
import 'package:asdish/ui/widgets/social_auth_button.dart';
import 'package:asdish/ui/widgets/fields/textfield.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

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

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static GlobalKey<FormState> form1Key = GlobalKey();
  static GlobalKey<FormState> form2Key = GlobalKey();
  bool showPassword = false;

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
              // Text(
              //   "ASDISH",
              //   style: TextStyle(
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo_1.png"),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sign in with",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                          controller: emailController,
                          validator: (txt) {},
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
                          controller: passwordController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
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
                          controller: phoneController,
                          initialCountryCode: "CM",
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            suffixIcon: const Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
              PrimaryButton(
                onPressed: () {
                  if (tabController.index == 1) {
                    context.push("/auth/otp");
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
