import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// 홈 페이지
/// 퀴즈를 받아올 때 마다 화면 갱신 -> StateFulWidget 으로 변경
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
// 상태를 나타내는 _HomePageState 클래스가 추가
class _HomePageState extends State<HomePage> {

  String quiz = ""; // 보여줄 퀴즈

  // initState : 위젯 생성시 호출
  // dispose : 위젯 삭제시 호출
  @override
  void initState() {
    super.initState();
    print("시작");

    // 퀴즈 가져오기
    getQuiz();
  }

  // 퀴즈 가져오기
  void getQuiz() async {
    String trivia = await getNumberTrivia();
    setState(() {
      quiz = trivia;
    });
  }

  Future<String> getNumberTrivia() async {
    // get 메소드로 URL 호출
    Response result = await Dio().get('http://numbersapi.com/random/trivia');
    String trivia = result.data; // 응답 결과 가져오기
    print(trivia);
    return trivia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent, // backgroundColor 로 나머지 색생 동일하게 채움
      body: SafeArea( // SafeArea : 세이프 에어리어로 감싸서 위아래 여유공간 확보
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.pinkAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // quiz
              Expanded(
                child: Center(
                  child: Text(
                    quiz, // "퀴즈"를 위에서 응답을 담은 변수로 변경
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // New Quiz 버튼
              SizedBox(
                height: 42,
                child: ElevatedButton(
                  child: Text(
                    "New Quiz",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 24,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () async {
                    // New Quiz 클릭시 퀴즈 가져오기
                    // getNumberTrivia();
                    // String trivia = await getNumberTrivia();
                    // setState(() {
                    //   quiz = trivia;
                    // });
                    getQuiz();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
