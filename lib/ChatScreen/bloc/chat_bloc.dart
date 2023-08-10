import 'chat_event.dart';
import 'chat_state.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState(''));

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
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
          'messages': [
            {'role': 'system', 'content': 'You are a helpful assistant.'},
            {
              'role': 'user',
              'content': 'This is a sample question.'
            }, // Update with user input
          ],
        }),
      );

      final responseData = jsonDecode(response.body);
      final reply = responseData['choices'][0]['message']['content'];

      yield ChatState(reply);
    }
  }
}
