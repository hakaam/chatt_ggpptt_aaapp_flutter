import 'package:flutter/material.dart';

import 'ChatScreen/Screens/input_screen.dart';
import 'ChatScreen/bloc/chat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'ChatGPT App',
        home: InputScreen(),
      ),
    );
  }
}
