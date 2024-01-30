import 'package:flutter/material.dart';
import 'package:ride/authentication/sign_up_page.dart';
import 'package:ride/utils/extension.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool isInvisible = true;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              const Text(
                "Login to Account",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailTextController,
                      labelText: "Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    18.spacingHeight,
                    CustomTextField(
                      controller: _passwordTextController,
                      labelText: "Password",
                      isSecure: isInvisible,
                      suffixIcon: IconButton(
                          onPressed: () {
                            isInvisible = !isInvisible;
                            if (mounted) setState(() {});
                          },
                          icon: Icon(isInvisible
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    )
                  ],
                ),
              ),
              20.spacingHeight,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {},
                  child: const Text("Login"),
                ),
              ),
              10.spacingHeight,
              CustomButton(
                width: MediaQuery.of(context).size.width,
                type: "text",
                onPressed: () {
                  context.pushScreen(const SingUpPage());
                },
                child: const Text(
                  "Don't have account ? SignUp here",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
