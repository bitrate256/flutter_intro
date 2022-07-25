import 'package:flutter/cupertino.dart';
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
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> bucketList = ['테스트1','테스트2']; // 전체 버킷리스트 목록

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("리스트"),
      ),
      body: bucketList.isEmpty
          ? Center(child: Text("리스트가 없습니다"))
          : ListView.builder(
              itemCount: bucketList.length, // bucketList 개수 만큼 보여주기
              itemBuilder: (context, index) {
                String bucket = bucketList[index]; // index에 해당하는 bucket 가져오기
                return ListTile(
                  // 버킷 리스트 할 일
                  title: Text(
                    bucket,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  // 삭제 아이콘 버튼
                  trailing: IconButton(
                    icon: Icon(CupertinoIcons.delete),
                    onPressed: () {
                      // 삭제 버튼 클릭시
                      print('$bucket : 삭제하기');
                    },
                  ),
                  onTap: () {
                    // 아이템 클릭시
                    print('$bucket : 클릭 됨');
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // + 버튼 클릭시 버킷 생성 페이지로 이동, 추가 버튼 눌렀을 때 빈값이면 null이 반홤되므로 String은 ? 타입 사용
          String? job = await Navigator.push( // await : Navigator.push()로 화면을 띄우고 해당 화면이 종료될 때 까지 이 라인에서 기다리도록 만듬. 이후 화면이 종료되면 job 변수에 반환된 파라미터를 할당하고 다음 라인 진행됨
            context,
            MaterialPageRoute(builder: (_) => CreatePage()),
          );
          if (job != null) {
            setState(() {
              bucketList.add(job); // 버킷 리스트에 추가
            });
          }
        },
      ),
    );
  }
}

/// 리스트 생성 페이지
class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  // TextField의 값을 가져올 때 사용
  TextEditingController textController = TextEditingController();

  // 경고 메세지
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("리스트 작성"),
        // 뒤로가기 버튼
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 텍스트 입력창
            TextField(
              controller: textController, // 연결
              autofocus: true,
              decoration: InputDecoration(
                hintText: "내용을 입력하세요",
                errorText: error,
              ),
            ),
            SizedBox(height: 32),
            // 추가하기 버튼
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                child: Text(
                  "추가하기",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  // 추가하기 버튼 클릭시
                  String job = textController.text; // 값 가져오기
                  if (job.isEmpty) {
                    setState(() {
                      error = "텍스트 입력되지 않음"; // 내용이 없는 경우 에러 메세지
                    });
                  } else {
                    setState(() {
                      error = null; // 내용이 있는 경우 에러 메세지 숨기기
                    });
                    Navigator.pop(context, job); // job 변수를 반환하며 화면을 종료
                  }
                  print(job);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}