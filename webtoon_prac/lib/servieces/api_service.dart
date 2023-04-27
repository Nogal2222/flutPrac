import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today";

  void getTodaysToons() async {
    // pub.dev에서 패키지 찾을 수 있음 (http 패키지 설치)
    final url = Uri.parse('$baseUrl/$today');
    // 기본적으로 비동기식으로 작동
    // http.get(url);
    // 동기식으로 작동하려면 다음과 같이 async + await
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
  }
}
