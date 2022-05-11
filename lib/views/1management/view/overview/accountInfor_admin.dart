import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:essays/views/intro_login_signup_screen/login2.dart';
import 'package:essays/views/personal/change_infor.dart';
import 'package:essays/widgets/text_form_field_infor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInforAdmin extends StatelessWidget {
  AccountInforAdmin({Key? key}) : super(key: key);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff44CECA),
        elevation: 0,
        leading: InkWell(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Thông tin tài khoản',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(1, 200),
          child: SizedBox(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: const Color(0xff44CECA),
                      height: 100,
                    ),
                    Container(
                      height: 100,
                      color: Colors.grey[200],
                    )
                  ],
                ),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: ClipOval(
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              width: 180,
                              height: 180,
                              color: Colors.white,
                              child: ClipOval(
                                child: BlocBuilder<AuthBloc, AuthState>(
                                  builder: (context, state) {
                                    return InkWell(
                                      onTap: () {
                                        context
                                            .read<AuthBloc>()
                                            .add(UpdateAvatarEvent());
                                      },
                                      child: Container(
                                        width: 160,
                                        height: 160,
                                        color: Colors.grey[300],
                                        child: state is AuthenticatedState
                                            ? state.userMap['avatar']
                                                    .toString()
                                                    .isNotEmpty
                                                ? Image.network(
                                                    state.userMap['avatar'],
                                                    fit: BoxFit.cover,
                                                  )
                                                : const Icon(
                                                    Icons
                                                        .person_outline_outlined,
                                                    size: 100,
                                                    color: Color(0xff44CECA),
                                                  )
                                            : const Icon(
                                                Icons.person_outline_outlined,
                                                size: 100,
                                                color: Color(0xff44CECA),
                                              ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Positioned(
                  bottom: 10,
                  right: MediaQuery.of(context).size.width * 0.5 - 80,
                  child: ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(2.5),
                      width: 40,
                      height: 40,
                      color: Colors.white,
                      child: ClipOval(
                        child: Container(
                          width: 30,
                          height: 30,
                          color: Colors.grey,
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final name;
          state is AuthenticatedState
              ? {
                  name = state.userMap['name'],
                  _fullNameController.text = name,
                  _emailController.text = state.userMap['email'],
                  _phoneNumberController.text = state.userMap['phoneNumber'],
                  _addressController.text = state.userMap['address']
                }
              : {};
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeInfor(
                                title: 'Họ tên',
                                content: _fullNameController.text,
                              )));
                },
                child: IgnorePointer(
                  child: TextFormFieldInfor(
                      controller: _fullNameController,
                      labelText: 'Họ tên',
                      prefixIcon: Icons.person_outline_outlined,
                      suffixIcon: Icons.keyboard_arrow_right_rounded,
                      readOnly: true),
                ),
              ),
              TextFormFieldInfor(
                  controller: _emailController,
                  prefixIcon: Icons.email_outlined,
                  labelText: 'Email',
                  readOnly: true),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeInfor(
                                title: 'Địa chỉ',
                                content: _addressController.text,
                              )));
                },
                child: IgnorePointer(
                  child: TextFormFieldInfor(
                      controller: _addressController,
                      prefixIcon: Icons.location_on_rounded,
                      labelText: 'Địa chỉ',
                      suffixIcon: Icons.keyboard_arrow_right_rounded,
                      readOnly: true),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeInfor(
                                title: 'Số điện thoại',
                                content: _phoneNumberController.text,
                              )));
                },
                child: IgnorePointer(
                  child: TextFormFieldInfor(
                      controller: _phoneNumberController,
                      prefixIcon: Icons.phone,
                      labelText: 'Số điện thoại',
                      suffixIcon: Icons.keyboard_arrow_right_rounded,
                      readOnly: true),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Transform.translate(
                  offset: const Offset(15, -3),
                  child: const Icon(
                    Icons.lock,
                    color: Color(0xff44CECA),
                  ),
                ),
                title: const Text('Đổi mật khẩu'),
                minLeadingWidth: 36,
              ),
              const Divider(
                height: 0,
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login2Screen()),
                      (route) => false);
                },
                child: IgnorePointer(
                  child: TextFormFieldInfor(
                      hintText: 'Đăng xuất',
                      prefixIcon: Icons.logout,
                      readOnly: true),
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.grey[200],
              ))
            ],
          );
        },
      ),
    );
  }
}
