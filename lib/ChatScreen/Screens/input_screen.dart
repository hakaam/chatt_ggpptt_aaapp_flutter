import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import the necessary package

import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChatGPT App')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: _controller),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final chatBloc = BlocProvider.of<ChatBloc>(context);
                chatBloc.add(ChatEvent.sendMessage);
              },
              child: Text('Get Response'),
            ),
          ],
        ),
      ),
    );
  }
}
