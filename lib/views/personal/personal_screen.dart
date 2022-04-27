import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:essays/views/coupon/coupon_screen.dart';
import 'package:essays/views/favorite/favorite_screen.dart';
import 'package:essays/views/intro_login_signup_screen/login2.dart';
import 'package:essays/views/personal/account_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 46,
        elevation: 0,
        backgroundColor: const Color(0xff44CECA),
        leading: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        bottom: PreferredSize(
          preferredSize: const Size(0, 40),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountInformationScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Text(
                        state is AuthenticatedState
                            ? state.userMap['name']
                            : 'Good morning!',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      );
                    },
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 20,
            color: Colors.grey[200],
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text('Đơn hàng của tôi'),
            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {},
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text('Món ăn yêu thích'),
            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FavoriteScreen()));
            },
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text('Quản lý thanh toán'),
            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {},
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text('Ví Coupon'),
            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CouponScreen()));
            },
          ),
          const Divider(
            height: 0,
          ),
          
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text('Điều khoản và điều kiện'),
            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {},
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text('Hỗ trợ & đóng góp'),
            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {},
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text('Đăng xuất'),
            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () {
              BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login2Screen()),
                  (route) => false);
            },
          ),
          const Divider(
            height: 0,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            color: const Color(0xffEFF0F3),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('v1.0.0'),
                Text(
                  "daVinci",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff44CECA),
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
