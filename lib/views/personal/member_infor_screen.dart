import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:essays/values/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberInforScreen extends StatelessWidget {
  const MemberInforScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,color: Colors.white,
            )),
        title: const Text(
          'Thông tin thành viên',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff44CECA),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media.istockphoto.com/vectors/abstract-vector-white-and-gray-subtle-lattice-pattern-background-vector-id1138069810?k=20&m=1138069810&s=170667a&w=0&h=aCO9oZh1GqgpveZJOzIZoMcCfxVXCT_BKIrg0Ijh124='),
                          fit: BoxFit.cover)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Container(
                    height: width * 0.53,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(AppAssets.silverBanner),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 6.0)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          width: 55,
                                          height: 55,
                                          // child: Image.network(_user.photoURL!),
                                          color: Colors.grey[200],
                                          child: state is AuthenticatedState
                                              ? state.userMap['avatar'] != null
                                                  ? Image.network(
                                                      state.userMap['avatar'])
                                                  : const Icon(
                                                      Icons
                                                          .person_outline_rounded,
                                                      size: 30,
                                                    )
                                              : const Icon(
                                                  Icons.person_outline_rounded,
                                                  size: 30,
                                                ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            state is AuthenticatedState
                                                ? Text(
                                                    '${state.userMap['name']}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  )
                                                : const Text('Thêm nick name'),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              'Khách hàng bạc',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Tổng tích lũy',
                                style: TextStyle(color: Colors.white),
                              ),
                              Transform.translate(
                                offset: const Offset(-15,0),
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.flag,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    state is AuthenticatedState
                                        ? '${state.userMap['point']}'
                                        : '100',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset(AppAssets.silver),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              color: const Color(0xffFFFBF0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Phần thưởng',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff676767))),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Nhận một ưu đãi Mua 1 tặng 1 mỗi 100 tích lũy',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(color: Color(0xff676767)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120),
                        color: const Color(0xffF5EDDA)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.opacity,
                          size: 50,
                          color: Color(0xff6C4D3B),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('0/100')
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 10,
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: const Text(
                  'Đặc quyền thành viên',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: ListTile(
                leading: Icon(
                  Icons.card_travel_outlined,
                  color: Color(0xffCFB794),
                ),
                title: Text('Thưởng làm quen'),
                subtitle:
                    Text('Thưởng một mã ưu đãi 50% ngay khi đăng ký tài khoản'),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: ListTile(
                leading: Icon(
                  Icons.looks,
                  color: Color(0xffCFB794),
                ),
                title: Text('Tích lũy điểm'),
                subtitle:
                    Text('Với mỗi 10.000 đồng bạn sẽ tích lũy được 1 vcCoin'),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: ListTile(
                leading: Icon(
                  Icons.cake,
                  color: Color(0xffCFB794),
                ),
                title: Text('Đổi điểm'),
                subtitle: Text(
                    'Vỡi mỗi 100 vcCoin bạn sẽ đổi được một ưu đãi Mua 1 Tặng 1'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
