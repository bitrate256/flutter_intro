import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "로그인",
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Image.network(
                    "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                    width: 81,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "이메일"
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "비밀번호"
                  ),
                ),
                // 엘레베이티드 버튼
                Container(
                  width: double.infinity, // 좌우 넓이 끝까지 넓히기
                  margin: EdgeInsets.only(top: 24), // 텍스트필드와 텍스트버튼 사이 간격
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Text('로그인 (텍스트 버튼)'),
                  ),
                ),
                // 텍스트 버튼
                TextButton(
                    onPressed: (){},
                    child: Text('텍스트 버튼'),
                ),
                // 아이콘 버튼
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
