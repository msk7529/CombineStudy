# Chapter 7 Key points

- publisher는 collection과 sequence와 매우 유사한 값을 생성하므로, 실제로 sequence 이다.
- min과 max operator를 이용하여 publisher가 내보낸 값들 중 가장 큰 값을 내보낼  수 있다.
- first, last, output(at:), output(in:) operator를 이용하여 특정 인덱스 혹은 특정 인덱스범위에 있는 값들을 찾아낼 수 있다.
- first(where:), last(where:) operator를 이용하여 upstream 값들 중 특정 조건을 만족하는 첫번째 혹은 마지막 값을 찾아낼 수 있다.
- count, contains, allSatisfy는 publisher가 내보낸 값들 중 하나를 내보내지 않고, 그 값들에 기반하여 다른 값을 내보낸다.
- contains(where:)을 사용하여 upstream 값들 중 특정 조건을 만족하는 값이 있는지 확인 할 수 있다.
- reduce를 사용하여 upstream 값들을 축적하여 하나의 값으로 내보낼 수 있다.
