main() {
  // 흐름 제어문

  // if 문
  bool bool1 = false;
  if (bool1) {
    // bool1 이 true 이면 실행
  } else {
    // bool1 이 false 이면 실행
  }

  // ~ else if
  bool bool2 = false;
  bool bool3 = false;
  if (bool1) {
    // bool1이 **true**면 실행
  } else if (bool2) {
    // bool1이 **false**이고, bool2가 **true**이면 실행
  } else if (bool3) {
    // bool1과 bool2가 **false**이고, bool3가 **true**이면 실행
  } else {
    // bool1, bool2, bool3가 모두 **false**이면 실행
  }

  // 반복문
  // 일반적인 for 문
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }

  // 과일 5개가 들어있는 배열의 내용을 모두 출력하려면 5번 print를 사용해야 합니다.
  List<String> dataList = ["idx", "ID", "name", "age", "memo"];
  print(dataList[0]);
  print(dataList[1]);
  print(dataList[2]);
  print(dataList[3]);
  print(dataList[4]);

  print("---- 반복문 ----");
  print("fruits.length : ${dataList.length}"); // 전체 배열의 개수

  // 반복문을 사용하면?
  for (int i = 0; i < dataList.length; i++) {
    print("$i : ${dataList[i]}"); // i가 0부터 dataList.length - 1까지로 변합니다.
  }


  print("---- for in 문 ----");

  // for in문이라 불리는 다른 형태의 반복문도 존재함
  for (String name in dataList) {
    print(name); // dataList 배열의 원소를 차례대로 꺼냅니다.
  }
}