import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/intro_login_signup_screen/sign_up_screen.dart';
import 'package:essays/views/main_page_screen.dart';
import 'package:essays/widgets/button_black_green.dart';
import 'package:essays/widgets/text_form_field_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login2Screen extends StatelessWidget {
  Login2Screen({Key? key}) : super(key: key);
  bool observe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MainPageScreen()));
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 64,
                    height: 78,
                    child: Image(
                      image: AssetImage(AppAssets.logo),
                    ),
                  ),
                  Text(
                    "Thuc's",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff95AE45)),
                  ),
                  Text(
                    "Restaurant",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff95AE45)),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      textFormFieldLogin(
                          controller: _emailController,
                          prefixIcon: Icons.email,
                          labelText: "Email",
                          hintText: "quangthuc2506@gmail.com"),
                      textFormFieldLogin(
                          controller: _passwordController,
                          prefixIcon: Icons.lock_open_outlined,
                          labelText: "Password",
                          observe: true,
                          suffixIcon: Icons.visibility,
                          onChanged: (obs) {}),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: Text("Forgot password?")),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _authenticateWithGoogle(context);
                        },
                        icon: const Image(
                            image: AssetImage(AppAssets.logoGoogle)),
                        label: const Text("Login with Google"),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(5),
                            fixedSize: const Size(234, 43),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            primary: const Color(0xff95ae45),
                            onPrimary: Colors.black),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ButtonBlackGreen(
                          text: "Login",
                          onPressed: () {
                            _authenticateWithEmailAndPassword(context);
                          }),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have any account? "),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            SignUpScreen())));
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(color: Color(0xff95ae45)),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context)
          .add(SignInEvent(_emailController.text, _passwordController.text));
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(SignInWithGoogleEvent());
  }
}
