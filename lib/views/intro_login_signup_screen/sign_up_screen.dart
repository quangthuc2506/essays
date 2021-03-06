import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:essays/values/app_assets.dart';
import 'package:essays/views/intro_login_signup_screen/login2.dart';
import 'package:essays/views/main_page_screen.dart';
import 'package:essays/widgets/button_black_green.dart';
import 'package:essays/widgets/text_form_field_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  bool observe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MainPageScreen(currentIndex: 0,)));
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Container(
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
                            "????ng k??",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          textFormFieldLogin(
                              controller: _fullNameController,
                              prefixIcon: Icons.person,
                              labelText: 'H??? t??n',
                              hintText: "Nguy???n Quang Th???c"),
                          textFormFieldLogin(
                              controller: _emailController,
                              prefixIcon: Icons.email,
                              labelText: "Email",
                              hintText: "quangthuc2506@gmail.com"),
                          textFormFieldLogin(
                              controller: _phoneNumberController,
                              prefixIcon: Icons.phone,
                              labelText: "S??? ??i???n tho???i",
                              hintText: "0963255409"),
                          textFormFieldLogin(
                              controller: _passwordController,
                              prefixIcon: Icons.lock_open_outlined,
                              labelText: "M???t kh???u",
                              suffixIcon: Icons.visibility),
                          textFormFieldLogin(
                              controller: _confirmPasswordController,
                              prefixIcon: Icons.lock_open_outlined,
                              labelText: "X??c nh???n m???t kh???u",
                              suffixIcon: Icons.visibility),
                          
                          const SizedBox(
                            height: 16,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ButtonBlackGreen(
                            text: "????ng k??",
                            onPressed: () {
                              _authenticateWithEmailAndPassword(context);
                            },
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("B???n ???? c?? t??i kho???n? "),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Login2Screen()));
                                  },
                                  child: const Text(
                                    "????ng nh???p",
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
            );
          },
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
          _fullNameController.text,
          _emailController.text,
          _passwordController.text,
          _phoneNumberController.text,
          _confirmPasswordController.text));
    }
  }
}
