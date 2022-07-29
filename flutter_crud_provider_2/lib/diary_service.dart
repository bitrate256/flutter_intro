import 'package:flutter/material.dart';

class Diary {
  String text; // 내용
  DateTime createdAt; // 작성 시간

  Diary({
    required this.text,
    required this.createdAt,
  });
}

class DiaryService extends ChangeNotifier {
  /// Diary 목록
  List<Diary> diaryList = [];

  /// 특정 날짜의 diary 조회
  List<Diary> getByDate(DateTime date) {
    // TODO : 아래 내용을 지우고 구현해주세요.
    return diaryList;
  }

  /// Diary 작성
  void create(String text, DateTime selectedDate) {
    // TODO
  }

  /// Diary 수정
  void update(DateTime createdAt, String newContent) {
    // TODO
  }

  /// Diary 삭제
  void delete(DateTime createdAt) {
    // TODO
  }
}
