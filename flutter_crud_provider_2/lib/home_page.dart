import 'package:flutter/cupertino.dart';
import 'package:flutter_crud_provider_2/diary_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 달력 보여주는 형식
  CalendarFormat calendarFormat = CalendarFormat.month;

  // 선택된 날짜
  DateTime selectedDate = DateTime.now();

  // CREATE text controller
  TextEditingController createTextController = TextEditingController();

  // UPDATE text controller
  TextEditingController updateTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryService>(
      builder: (context, diaryService, child) {
        List<Diary> diaryList = diaryService.getByDate(selectedDate);
        return Scaffold(
          // 키보드가 올라올 때 화면 밀지 않도록 만들기(overflow 방지)
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                /// 달력
                TableCalendar(
                  firstDay: DateTime.utc(2010),
                  lastDay: DateTime.utc(2099),
                  focusedDay: selectedDate,
                  calendarFormat: calendarFormat,
                  onFormatChanged: (format) {
                    // 달력 형식 변경
                    setState(() {
                      calendarFormat = format;
                    });
                  },
                  eventLoader: (date) {
                    // 각 날짜에 해당하는 diaryList 보여주기
                    return diaryService.getByDate(date);
                  },
                  calendarStyle: CalendarStyle(
                    // toDay 색상 제거 (투데이는 화이트)
                    todayTextStyle: TextStyle(color: Colors.black),
                    todayDecoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  // 선택된 날짜
                  selectedDayPredicate: (day) {
                    return isSameDay(selectedDate, day);
                  },
                  // 선택된 날짜 색깔
                  onDaySelected: (_, focusedDay) {
                    setState(() {
                      selectedDate = focusedDay;
                    });
                  },
                ),
                // 화면 나누기 (디바이더)
                Divider(height: 1),
              ],
            ),
          ),
        );
      },
    );
  }
}
