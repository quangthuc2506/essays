import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeInfor extends StatelessWidget {
  String title;
  String? content;
  ChangeInfor({Key? key, required this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    _textController.text = content!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3AC5C8),
        elevation: 1,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xffF6F5FA),
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      _textController.text = '';
                    },
                    child: const Icon(
                      Icons.highlight_off,
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff3AC5C8), width: 1.5))),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (title == 'Họ tên') {
                context
                    .read<AuthBloc>()
                    .add(UpdateNameEvent(fullName: _textController.text));
                Navigator.pop(context);
                context.read<AuthBloc>().add(LoadInforEvent());
              }
              if (title == 'Số điện thoại') {
                context.read<AuthBloc>().add(
                    UpdatePhoneNumberEvent(phoneNumber: _textController.text));
                Navigator.pop(context);
                context.read<AuthBloc>().add(LoadInforEvent());
              }
              if (title == 'Địa chỉ') {
                context
                    .read<AuthBloc>()
                    .add(UpdateAddressEvent(address: _textController.text));
                Navigator.pop(context);
                context.read<AuthBloc>().add(LoadInforEvent());
              }
            },
            child: const Text('Lưu thay đổi'),
            style: ElevatedButton.styleFrom(
                primary: const Color(0xff3AC5C8),
                fixedSize: Size(MediaQuery.of(context).size.width, 50)),
          )
        ]),
      ),
    );
  }
}
