import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_provider/work_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WorkService()),
      ],
      child: const MyApp(),
    ),
  );
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

/// 작업 클래스
class Work {
  String job; // 할 일
  bool isDone; // 완료 여부

  Work(this.job, this.isDone); // 생성자
}

/// 홈 페이지
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Work> workList = []; // 전체 작업리스트 목록

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkService>( // Consumer 위젯 : 위젯트리 꼭대기에 등록된 서비스에 접근할 수 있음, 해당 위젯에서 일부분만 rebuild, 등록된 모든 위젯의 builder 함수가 재호출 되면서 화면이 갱신됨
      builder: (context, workService, child) { // builder : 화면에 보여줄 위젯을 반환하는 함수
        List<Work> workList = workService.workList;
        return Scaffold(
          appBar: AppBar(
            title: Text("리스트"),
          ),
          body: workList.isEmpty
              ? Center(child: Text("리스트가 없습니다"))
              : ListView.builder(
                  itemCount: workList.length, // workList 개수 만큼 보여주기
                  itemBuilder: (context, index) {
                    Work work = workList[index]; // index에 해당하는 work 가져오기
                    return ListTile(
                      // 리스트
                      title: Text(
                        work.job, // 해야할 작업은 work 의 job 속성에 들어 있음
                        style: TextStyle(
                          fontSize: 24,
                          color: work.isDone ? Colors.grey : Colors.black,
                          decoration: work.isDone
                              ? TextDecoration.lineThrough // 텍스트에 취소선 넣기
                              : TextDecoration.none,
                        ),
                      ),
                      // 삭제 아이콘 버튼
                      trailing: IconButton(
                        icon: Icon(CupertinoIcons.delete),
                        onPressed: () {
                          // 삭제 버튼 클릭시
                          showDeleteDialog(context, index);
                        },
                      ),
                      onTap: () {
                        // 아이템 클릭시
                        setState(() {
                          work.isDone = !work.isDone;
                        });
                      },
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              // + 버튼 클릭시 버킷 생성 페이지로 이동, 추가 버튼 눌렀을 때 빈값이면 null이 반홤되므로 String은 ? 타입 사용
              String? job = await Navigator.push(
                // await : Navigator.push()로 화면을 띄우고 해당 화면이 종료될 때 까지 이 라인에서 기다리도록 만듬. 이후 화면이 종료되면 job 변수에 반환된 파라미터를 할당하고 다음 라인 진행됨
                context,
                MaterialPageRoute(builder: (_) => CreatePage()),
              );
              if (job != null) {
                setState(() {
                  Work newWork = Work(job, false);
                  workList.add(newWork); // 작업 리스트에 추가
                });
              }
            },
          ),
        );
      }, // User
    );
  }

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("정말로 삭제하시겠습니까?"),
          actions: [
            // 취소 버튼
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("취소"),
            ),
            // 확인 버튼
            TextButton(
              onPressed: () {
                setState(() {
                  // index에 해당하는 항목 삭제
                  workList.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text(
                "확인",
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
        );
      },
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
                    // WorkService 에서 CREATE 호출
                    WorkService workService = context.read<WorkService>();
                    workService.createWork(job);
                    Navigator.pop(context, job); // job 변수를 반환하며 화면을 종료
                  }
                  print("입력된 데이터 => $job");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
