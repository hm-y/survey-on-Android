import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic >> fetchQuestion(qId) async {

    // String request = "localhost:3000/questions/70.xml?with_visitor_stats=true&visitor_identifier=2&with_appearance=true&with_prompt=true&with_visitor_stats=true";    
    final response = await http.get('https://jsonplaceholder.typicode.com/comments/' + qId.toString());
    final Map<String, dynamic> responseJson = json.decode(response.body);
    return responseJson;
}

void sendAnswer(){
    String request = "localhost:3000/questions/70/prompts/170/vote.xml?next_prompt[algorithm]=all-combos&next_prompt[visitor_identifier]=2&next_prompt[with_appearance]=true&next_prompt[with_visitor_stats]=true&question_id=70&vote[appearance_lookup]=dbfc534e48794a0f2e2cdd48d73dfaa1&vote[direction]=left&vote[skip_fraud_protection]=true&vote[time_viewed]=4563&vote[tracking][x_click_offset]=&vote[tracking][y_click_offset]=&vote[visitor_identifier]=2";
    http.post(request);
}