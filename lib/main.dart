import 'package:validar_app/blocs/authentication_bloc/authentication_state.dart';
import 'package:validar_app/blocs/simple_bloc_observer.dart';
import 'package:validar_app/repositories/user_repository.dart';
import 'package:validar_app/screens/home_screen.dart';
import 'package:validar_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication_bloc/authentication_bloc.dart';
import 'blocs/authentication_bloc/authentication_event.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AuthenticationStarted()),
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff6a515e),
        cursorColor: Color(0xff6a515e),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationFailure) {
            return LoginScreen(
              userRepository: _userRepository,
            );
          }

          if (state is AuthenticationSuccess) {
            return HomeScreen(
              user: state.firebaseUser,
            );
          }

          return Scaffold(
            //appBar: AppBar(),
            backgroundColor: Colors.blueAccent,
            body: Container(
              child: Center(
                  child: Text(
                "Espere...",
                style: TextStyle(color: Colors.white),
              )),
            ),
          );
        },
      ),
    );
  }
}
