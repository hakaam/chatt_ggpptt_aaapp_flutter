import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_state.dart';


class ResponseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Response')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return Text(state.message);
            },
          ),
        ),
      ),
    );
  }
}