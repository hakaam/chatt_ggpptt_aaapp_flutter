import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ChatScreen/Screens/input_screen.dart';
import 'ChatScreen/Screens/response_screen.dart';
import 'ChatScreen/bloc/chat_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatGPT App',
        initialRoute: '/',
        routes: {
          '/': (context) => InputScreen(),
          '/response': (context) => ResponseScreen(),
        },
      ),
    );
  }
}
