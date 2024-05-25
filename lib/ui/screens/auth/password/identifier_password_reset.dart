import 'package:asdish/providers/states.dart';
import 'package:asdish/ui/widgets/fields/textfield.dart';
import 'package:asdish/ui/widgets/primary_button.dart';
import 'package:asdish/ui/widgets/social_auth_button.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class IdentifierPasswordReset extends StatefulWidget {
  const IdentifierPasswordReset({super.key});

  @override
  State<IdentifierPasswordReset> createState() => _IdentifierPasswordResetState();
}

class _IdentifierPasswordResetState extends State<IdentifierPasswordReset>  with TickerProviderStateMixin {
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
  static TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> form1Key = GlobalKey();
  GlobalKey<FormState> form2Key = GlobalKey();

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
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.7,
                child: TabBar(
                  controller: tabController,
                  onTap: (i) {},
                  tabs: const [
                    Tab(
                      child: Icon(Icons.email),
                    ),
                    Tab(
                      child: Icon(Icons.phone_android),
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
                          hintText: "Email",
                          controller: emailController,
                          validator: (txt) {
                            return null;
                          },
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
                              borderSide:
                              BorderSide(color: Colors.grey.shade400),
                            ),
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                            suffixIcon: const Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                onPressed: () {
                  if (tabController.index == 1) {
                    if (context.read<TimerProvider>().canRequestOTP) {
                      context.read<TimerProvider>().startOTPTimer();
                    }
                    context.push("/auth/password/code-reset",extra: true);
                  } else {
                    if (context.read<TimerProvider>().canRequestEmailCode) {
                      context.read<TimerProvider>().startEmailTimer();
                    }
                    context.push("/auth/password/code-reset",extra: false);
                  }
                },
                text: "Send code",
              ),
            ],
          ),
        ),
      ),
    );
  }
}