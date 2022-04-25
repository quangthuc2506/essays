import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:essays/widgets/text_form_field_infor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInformationScreen extends StatelessWidget {
  AccountInformationScreen({Key? key}) : super(key: key);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

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
                                    return Container(
                                      width: 160,
                                      height: 160,
                                      color: Colors.grey[300],
                                      child: state is AuthenticatedState
                                          ? Image.network(
                                              state.userMap['avatar'],
                                              fit: BoxFit.cover,
                                            )
                                          : const Icon(
                                              Icons.person_outline_outlined,
                                              size: 100,
                                              color: Color(0xff44CECA),
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
                  _phoneNumberController.text = state.userMap['phoneNumber']
                }
              : {};
          return Column(
            children: [
              TextFormFieldInfor(
                  controller: _fullNameController,
                  labelText: 'Họ tên',
                  prefixIcon: Icons.person_outline_outlined,
                  onChanged: (value) {
                  }),
              TextFormFieldInfor(
                  controller: _emailController,
                  prefixIcon: Icons.email_outlined,
                  labelText: 'Email',
                  readOnly: true),
              TextFormFieldInfor(
                  controller: _phoneNumberController,
                  prefixIcon: Icons.phone,
                  labelText: 'Số điện thoại',
                  onChanged: (value) {
                  }),
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
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              Expanded(
                  child: Container(
                color: Colors.grey[200],
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LoadInforEvent());
                  },
                  child: const Text('Cập nhật'),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(175, 50),
                      primary: const Color(0xff44CECA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                )),
              ))
            ],
          );
        },
      ),
    );
  }
}
