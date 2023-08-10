

import 'package:chatt_ggpptt_aaapp_flutter/ChatScreen/Screens/response_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChatGPT App')),
      body: BlocProvider<ChatBloc>(
        create: (context) => ChatBloc(),
        child: Padding(
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
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResponseScreen()),
                  );
                },
                child: Text('View Response'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}