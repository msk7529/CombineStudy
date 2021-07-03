# Chapter 3 Key points

- publisher의 output에 대한 operation을 수행하는 메서드를 operator 라고 한다.
- operator도 publisher이다.
- transform operator는 upstream publisher의 input을 downstream 사용에 적합한 ouput으로 변환시킨다.
- Marble diagram은 각 Combine operator의 동작방식을 시각화하는 좋은 방법이다.
- 값을 버퍼링할때 사용하는 operator(예를 들어 collect, flatMap)을 사용할 떄는 메모리문제를 야기할 수 있으므로 조심해서 사용해야 한다.
- Swift 표준 라이브러리의 함수에 대한 기존지식을 적용할 때 주의해야한다. 비슷한 이름의 Combine operator 중 일부는 동일하게 동작하는 반면, 일부는 완전히 다르게 동작한다.
- subscription에서 여러개의 operator을 연결해서 사용할 수 있다.
