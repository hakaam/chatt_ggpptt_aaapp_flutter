import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState('')) {
    on<ChatEvent>((event, emit) async {
      if (event == ChatEvent.sendMessage) {
        final apiKey = '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';
        final apiUrl = 'https://api.openai.com/v1/chat/completions';

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
          },
          body: jsonEncode({
            'model': 'gpt-3.5-turbo', // Add the model parameter
            'messages': [
              {'role': 'system', 'content': 'You are a helpful assistant.'},
              {
                'role': 'user',
                'content': 'This is a sample question.',
              }, // Update with user input
            ],
          }),
        );
          print(response.body);
        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final choices = responseData['choices'];

          if (choices is List && choices.isNotEmpty) {
            final content = choices[0]['message']['content'];

            if (content != null) {
              final reply = content.toString();
              emit(ChatState(reply));
            } else {
              // Handle the case where 'content' is null
            }
          } else {
            // Handle the case where 'choices' is empty or not a list
          }
        } else {
          // Handle API error (response.statusCode is not 200)
        }
      }
    });
  }
}