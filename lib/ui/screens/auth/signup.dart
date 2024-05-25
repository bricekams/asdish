import 'package:asdish/ui/widgets/fields/textfield.dart';
import 'package:asdish/ui/widgets/primary_button.dart';
import 'package:asdish/ui/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController rePasswordController = TextEditingController();
  bool showPassword = false;
  bool showRePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              CustomTextField(
                controller: firstNameController,
                label: const Text("First name"),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: emailController,
                label: const Text("Email (optional)"),
              ),
              const SizedBox(height: 10),
              IntlPhoneField(
                languageCode: "en",
                dropdownTextStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                controller: phoneController,
                initialCountryCode: "CM",
                keyboardType: TextInputType.number,
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
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  suffixIcon: const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                ),
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
              const SizedBox(height: 10),
              CustomTextField(
                label: const Text("Confirm password"),
                obscureText: !showRePassword,
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
                controller: rePasswordController,
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
              const SizedBox(height: 10),
              PrimaryButton(
                text: "Sign up",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
