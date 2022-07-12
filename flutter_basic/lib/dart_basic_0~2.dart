main() {

  // 변수와 자료형

  // main() 은 Dart 에서 처음 시작시 호출하는 약속된 함수임.
  print("Hello Dart");

  // Dart는 마지막에 세미콜론 (;) 으로 마무리 해야 함

  // 변수
  print("========== var ==========");

  // 변수 명 만드는 규칙
  // 영문 / _ / $ / 숫자 만 사용
  // 숫자 로 시작 불가능
  // 카멜케이스 사용

  // var : 처음 담긴 값으로 타입이 지정됨
  // String : 문자만 담을 수 있음
  // String? : 문자 또는 비어있는(null) 상태일 수 있음
  // final String : 문자를 한번 담은 뒤 재할당 불가능함

  var name = 'jack';
  print(name);
  print(name.runtimeType);// string (문자)

  var age = 20;
  print(age); // 20
  print(age.runtimeType); // int (정수)


  print("="*20);


  /// String : 문자만 넣을 수 있음
  String address = '문자열';
  print(address); // 문자열

  // address = 1; // ⬅️ String 만 담을 수 있기 때문에 이 코드는 에러 발생

  address = '문자열 다시 초기화';
  print(address); // 모두의 집


  print("="*20);


  /// String? : 문자 또는 비어있을 수 있음
  String? email; // ⬅️ 아무것도 안넣었으므로 비어있음
  print(email); // null ⬅️ 비어있음을 의미

  email = "문자열 다시 할당"; // 문자열 할당
  print(email); // 문자열 다시 할당

  email = null; // 다시 비우기
  print(email); // null


  print("="*20);


  /// final : 값을 재할당 할 수 없음
  final String phone = "010-0000-0000";
  print(phone); // 010-0000-0000
  // phone = "010-1111-1111"; // final 때문에 이 코드는 실행 불가능
}