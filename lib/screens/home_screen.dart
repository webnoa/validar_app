import 'package:firebase_auth/firebase_auth.dart';
import 'package:validar_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:validar_app/blocs/authentication_bloc/authentication_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseUser user;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationLoggedOut());
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: Text("Hello, ${user.email}"),
          ),
          SizedBox(height: 10),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
