# Chapter 5 Key points

- prepend, append operator를 사용하여 original publisher 앞 또는 뒤에 다른 publisher의 출력을 추가할 수 있다.
- switchToLateset를 사용하면 publisher를 가장 최신의 publisher로 전환하고, 이전 publisher의 구독을 취소할 수 있다.
- merge(with:)를 사용하면 여러 publisher의 값을 interleave 할 수 있다.
- combineLatest를 사용하면 결합된 publisher들이 내보낸 각각의 값들 중 가장 최신의 값을 묶어 튜플형태로 내보낼 수 있다.
- zip을 사용하면 결합된 publisher들이 내보낸 값들을 차례대로 쌍을 이루어 튜플형태로 내보낼 수 있다.
- combine operator를 혼합하여 publisher와 출력간에 흥미롭고 복잡한 관계를 만들어낼 수 있다.
