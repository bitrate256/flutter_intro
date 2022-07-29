import 'package:flutter/material.dart';

import 'main.dart';

/// ChangeNotifier : workList 가 변경될 때 해당 값을 보여주는 화면을 갱신
class WorkService extends ChangeNotifier {
  List<Work> workList = [
    Work('테스트데이터', false), // 더미 데이터
  ];

  /// CREATE
  void createWork(String job) {
    workList.add(Work(job, false));
    notifyListeners(); // 갱신 = Consumer<WorkService>의 builder 부분만 새로고침
  }

  /// UPDATE
  void updateWork(Work work, int index) {
    workList[index] = work;
    notifyListeners();
  }

  /// work 삭제
  void deleteWork(int index) {
    workList.removeAt(index);
    notifyListeners();
  }
}