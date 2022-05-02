import 'package:essays/blocs/auth/auth_bloc.dart';
import 'package:essays/blocs/cart/cart_bloc.dart';
import 'package:essays/blocs/category/category_bloc.dart';
import 'package:essays/blocs/product/product_bloc.dart';
import 'package:essays/repository/auth/auth_repository.dart';
import 'package:essays/repository/cart/cart_repository.dart';
import 'package:essays/repository/category/category_repository.dart';
import 'package:essays/repository/product/product_repository.dart';
import 'package:essays/views/1management/view/manage_main_page_screen.dart';
import 'package:essays/views/intro_login_signup_screen/login2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(authRepository: AuthRepository())),
              BlocProvider(create: (context)=>CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategoriesEvent())),
              BlocProvider(create: (context)=>ProductBloc(productRepository: ProductRepository())),
              BlocProvider(create: (context)=>CartBloc(cartRepository: CartRepository())),
        ],
        child: MaterialApp(
          
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              
                primarySwatch: Colors.blue,
                primaryColor: Colors.black,
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black))),
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  context.read<AuthBloc>().add(CheckedSignInEvent(email: snapshot.data!.email));
                  return ManageMainPageScreen(currentIndex: 1,);
                }
                return Login2Screen();
              },
            )));
  }
}
