# Chapter 9 Key points

- Combine은 dataTaskPublisher(for:) 메서드를 통해 publisher-based abstraction을 제공할 수 있다.
- publiser에 decode operator을 사용하여 Codable을 준수하는 모델을 decode 하여 값을 내보낼 수 있다.
- 여러개의 subscriber가 존재할 때 subscription의 반복을 공유할 operator가 없기 때문에, 이러한 상황을 ConnectablePublisher와 multicast operator을 사용하여 해결할 수 있다.
