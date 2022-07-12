void main() {
  // 함수의 호출과 실행순서
  print("========== 함수의 호출과 실행순서 ==========");
  print("1. start");
  funcA();
  print("4. end");

  // 함수의 입력
  print("========== 함수의 입력 ==========");
  funcB("do");

  // 함수에 입력 값을 이름과 함께 전달
  funcC(variable: "do");

  // 이름 지정 매개변수의 값을 필수록 전달하도록 만들기
  funcD(variable: "do");

  // 이름 지정 매개변수의 값을 여러개 전달하기
  funcE(variable1: "do");
  funcE(variable1: "do", variable2: "Some thing E");
  funcE(variable2: "some Thing E", variable1: "do");

  // 함수의 출력
  print("========== 함수의 출력 ==========");
  // getName() 함수는 "jack" 을 반환하기 때문에 name 에는 jack 이 들어감
  String name = getName();
  print(name);
  // 화살표 함수 (Arrow Function) 으로 더 짧게 표현 가능
  String name2 = getName2();
  print(name2);

  // 입출력 예제
  print("========== 입출력 예제 ==========");
  String compiler = getCode("코드");
  print(compiler);

  // 입출력 연습
  List<String> aListOfStrings = ['one', 'two', 'three'];
  List<String>? aNullableListOfStrings; // 변수 자체가 null일 수 있으므로 맨 뒤에 ?를 추가
  List<String?> aListOfNullableStrings = ['one', null, 'three']; // 배열이 String 또는 null을 가질 수 있으므로 String?로 변경

  print('aListOfStrings is $aListOfStrings.');
  print('aNullableListOfStrings is $aNullableListOfStrings.');
  print('aListOfNullableStrings is $aListOfNullableStrings.');
}

// 함수의 호출과 실행순서
void funcA() {
  print("2. do");
  print("2. something A");
}

// 함수의 입력
// 입력값을 받아주는 변수를 파라미터/매개변수/인자 등 다양하게 지칭함
void funcB(String variable) {
  print(variable + " something B-1");
  print("${variable} something B-1");
}

// 함수에 입력 값을 이름과 함께 전달
// 이름지정 매개변수(Named Parameter)
// 이름지정 매개변수는 함수 호출시 값을 전달하지 않다도 되므로 7재 줄에 입력값을 받는 변수의 타입이 null이 될 수 있도록 String? 으로 선언되어 있음
void funcC({String? variable}) {
  print("$variable something C");
}

// 이름 지정 매개변수의 값을 필수록 전달하도록 만들기
// required 키워드가 있는 경우, 호출시 필수로 전달되어야 함
void funcD({required String variable}) {
  print("$variable something D");
}

// 이름 지정 매개변수의 값을 여러개 전달하기
// 이름지정 매개변수는 이름을 지정하기 때문에 함수 호출시 순서에 관계없이 입력값을 전달할 수 있음
void funcE({required String variable1, String? variable2}) {
  print("$variable1 : $variable2");
}

// 함수의 출력
// String 은 함수가 최종적으로 반환하는 값의 타입
// 함수 내부에서 최종적으로 반환하려는 값 앞에 return, getName 함수는 "jack" String 을 반환함
String getName() {
  return "jack";
}

// 화살표 함수 (Arrow Function) 으로 더 짧게 표현 가능
String getName2() => "bit";

// 입출력 예제
String getCode(String code) {
  return "$code가 컴파일됨!";
}