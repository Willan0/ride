import 'package:flutter/material.dart';
import 'package:ride/services/firebase_service/firebase_authetication.dart';
import 'package:ride/authentication/login_page.dart';
import 'package:ride/utils/extension.dart';
import 'package:ride/utils/validation.dart';
import 'package:ride/widgets/custom_button.dart';
import 'package:ride/widgets/custom_text_field.dart';
import 'package:ride/widgets/loading_dialog.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool isInvisible = true;

  @override
  void dispose() {
    _nameTextController.dispose();
    _phoneTextController.dispose();
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
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                const Text(
                  "Create a User's Account",
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
                      /// username
                      CustomTextField(
                        controller: _nameTextController,
                        labelText: "Enter username",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            Validation.userNameValidation(value),
                      ),
                      10.spacingHeight,

                      /// phone
                      CustomTextField(
                        controller: _phoneTextController,
                        labelText: "Enter phone number",
                        textInputType: TextInputType.phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => Validation.phoneValidation(value),
                      ),
                      10.spacingHeight,

                      /// email
                      CustomTextField(
                        controller: _emailTextController,
                        labelText: "Enter email",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) => Validation.emailValidation(value),
                      ),
                      10.spacingHeight,

                      ///password
                      CustomTextField(
                        controller: _passwordTextController,
                        labelText: "Enter password",
                        isSecure: isInvisible,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            Validation.passwordValidation(value),
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

                /// sign up
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomButton(
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _singUpUser();
                      }
                    },
                    child: const Text("Sign Up"),
                  ),
                ),
                10.spacingHeight,

                /// Go to sign In
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  type: "text",
                  onPressed: () {
                    context.pushScreen(const LoginPage());
                  },
                  child: const Text(
                    "Already have an account ? Login here",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _singUpUser() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const LoadingDialog(
              message: "Loging in",
            ));
    final user = await FirebaseAuthentication.signInWithEmail(
            _emailTextController.text, _passwordTextController.text)
        .catchError((e) {
      Navigator.of(context);
    });

    if (!mounted) return;
    Navigator.pop(context);
  }
}
