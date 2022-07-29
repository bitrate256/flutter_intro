import 'package:flutter_crud_provider_2/diary_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryService>(
      builder: (context, diaryService, child) {
        return Scaffold(
          body: Center(
            child: Text("HomePage"),
          ),
        );
      },
    );
  }
}
